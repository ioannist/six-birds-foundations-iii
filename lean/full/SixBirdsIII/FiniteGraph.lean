namespace SixBirdsIII

structure FiniteGraph (n : Nat) (E : Type) where
  source : E → Fin n
  target : E → Fin n

inductive FiniteWalk {n : Nat} {E : Type} (G : FiniteGraph n E) : Fin n → Fin n → Type where
  | nil (v : Fin n) : FiniteWalk G v v
  | edge (e : E) : FiniteWalk G (G.source e) (G.target e)
  | reverse {u v : Fin n} : FiniteWalk G u v → FiniteWalk G v u
  | append {u v w : Fin n} : FiniteWalk G u v → FiniteWalk G v w → FiniteWalk G u w

def finiteWalkIntegral {n : Nat} {E : Type} {G : FiniteGraph n E}
    (a : E → Int) : {u v : Fin n} → FiniteWalk G u v → Int
  | _, _, .nil _ => 0
  | _, _, .edge e => a e
  | _, _, .reverse w => -finiteWalkIntegral a w
  | _, _, .append p q => finiteWalkIntegral a p + finiteWalkIntegral a q

def FiniteCoboundary {n : Nat} {E : Type} (G : FiniteGraph n E)
    (p : Fin n → Int) (e : E) : Int :=
  p (G.target e) - p (G.source e)

def FiniteExact {n : Nat} {E : Type} (G : FiniteGraph n E)
    (a : E → Int) : Prop :=
  ∃ p : Fin n → Int, a = FiniteCoboundary G p

theorem finiteWalkIntegral_coboundary {n : Nat} {E : Type} {G : FiniteGraph n E}
    (p : Fin n → Int) {u v : Fin n} (w : FiniteWalk G u v) :
    finiteWalkIntegral (FiniteCoboundary G p) w = p v - p u := by
  induction w with
  | nil v => simp [finiteWalkIntegral]
  | edge e => rfl
  | reverse w ih =>
      simp only [finiteWalkIntegral, ih]
      omega
  | append w₁ w₂ ih₁ ih₂ =>
      simp only [finiteWalkIntegral, ih₁, ih₂]
      omega

theorem finite_graph_exact_form_null_drive {n m : Nat}
    (G : FiniteGraph n (Fin m)) (a : Fin m → Int) (ha : FiniteExact G a)
    (v : Fin n) (w : FiniteWalk G v v) :
    finiteWalkIntegral a w = 0 := by
  obtain ⟨p, rfl⟩ := ha
  simpa using finiteWalkIntegral_coboundary p w

def FiniteConnected {n : Nat} {E : Type} (G : FiniteGraph n E) (root : Fin n) : Prop :=
  ∀ v : Fin n, Nonempty (FiniteWalk G root v)

theorem finite_graph_nonzero_affinity_equivalence {n m : Nat}
    (G : FiniteGraph n (Fin m)) (root : Fin n) (hc : FiniteConnected G root)
    (a : Fin m → Int) :
    (¬ FiniteExact G a) ↔
      ∃ (v : Fin n) (w : FiniteWalk G v v), finiteWalkIntegral a w ≠ 0 := by
  constructor
  · intro hnot
    classical
    apply Classical.byContradiction
    intro hzero
    have hz : ∀ (v : Fin n) (w : FiniteWalk G v v), finiteWalkIntegral a w = 0 := by
      intro v w
      exact Classical.byContradiction (fun hn => hzero ⟨v, w, hn⟩)
    let path : (v : Fin n) → FiniteWalk G root v :=
      fun v => Classical.choice (hc v)
    let p : Fin n → Int := fun v => finiteWalkIntegral a (path v)
    apply hnot
    refine ⟨p, funext ?_⟩
    intro e
    have hcycle := hz root
      (FiniteWalk.append
        (FiniteWalk.append (path (G.source e)) (FiniteWalk.edge e))
        (FiniteWalk.reverse (path (G.target e))))
    dsimp [p, FiniteCoboundary]
    dsimp [finiteWalkIntegral] at hcycle
    omega
  · rintro ⟨v, w, hw⟩ ⟨p, hp⟩
    apply hw
    rw [hp]
    simpa using finiteWalkIntegral_coboundary p w

/-- A rooted finite forest is encoded by a parent map whose rank strictly
    decreases toward each root. Its edges are precisely the nonroot vertices. -/
structure FiniteRootedForest (n : Nat) where
  parent : Fin n → Fin n
  root : Fin n → Bool
  rank : Fin n → Nat
  parent_decreases : ∀ v, root v = false → rank (parent v) < rank v

def FiniteRootedForest.graph {n : Nat} (F : FiniteRootedForest n) :
    FiniteGraph n {v : Fin n // F.root v = false} :=
  ⟨fun e => F.parent e.val, fun e => e.val⟩

def finiteForestPotential {n : Nat} (F : FiniteRootedForest n)
    (a : {v : Fin n // F.root v = false} → Int) (v : Fin n) : Int :=
  if h : F.root v = false then
    finiteForestPotential F a (F.parent v) + a ⟨v, h⟩
  else 0
termination_by F.rank v
decreasing_by exact F.parent_decreases v h

theorem finite_graph_forest_no_drive {n : Nat}
    (F : FiniteRootedForest n)
    (a : {v : Fin n // F.root v = false} → Int) :
    FiniteExact F.graph a ∧
      ∀ (v : Fin n) (w : FiniteWalk F.graph v v),
        finiteWalkIntegral a w = 0 := by
  let p := finiteForestPotential F a
  have heq : a = FiniteCoboundary F.graph p := by
    funext e
    have hp := finiteForestPotential.eq_1 F a e.val
    simp [e.property] at hp
    simp [FiniteCoboundary, FiniteRootedForest.graph, p, hp]
    have hs : a ⟨e.val, e.property⟩ = a e := congrArg a (Subtype.ext rfl)
    omega
  refine ⟨⟨p, heq⟩, ?_⟩
  intro v w
  rw [heq]
  simpa using finiteWalkIntegral_coboundary p w

structure FiniteGraphGate (n : Nat) (E : Type) where
  source : FiniteGraph n E
  targetForest : FiniteRootedForest n
  retained : {v : Fin n // targetForest.root v = false} → E
  admissible : ∀ e, source.source (retained e) = targetForest.graph.source e ∧
    source.target (retained e) = targetForest.graph.target e
  rankLossRecorded : ∃ (v : Fin n) (w : FiniteWalk source v v)
    (a : E → Int), finiteWalkIntegral a w ≠ 0

theorem finite_graph_gating_affinity_suppression {n m : Nat}
    (gate : FiniteGraphGate n (Fin m))
    (a : {v : Fin n // gate.targetForest.root v = false} → Int) :
    ∀ (v : Fin n) (w : FiniteWalk gate.targetForest.graph v v),
      finiteWalkIntegral a w = 0 := by
  exact (finite_graph_forest_no_drive gate.targetForest a).2

end SixBirdsIII
