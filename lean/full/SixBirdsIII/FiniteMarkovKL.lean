import SixBirdsIII.FiniteProbability

namespace SixBirdsIII

def ratFinSum (n : Nat) (f : Fin n → Rat) : Rat :=
  ((List.finRange n).map f).sum

private theorem listSumAdd {α : Type} (xs : List α) (f g : α → Rat) :
    (xs.map (fun x => f x + g x)).sum =
      (xs.map f).sum + (xs.map g).sum := by
  induction xs with
  | nil => exact (Rat.add_zero 0).symm
  | cons x xs ih =>
      simp only [List.map_cons, List.sum_cons, ih]
      simp only [Rat.add_assoc, Rat.add_left_comm]

private theorem ratNegAdd (a b : Rat) : -(a + b) = -a + -b := by
  apply Rat.add_right_cancel (a + b)
  calc
    -(a + b) + (a + b) = 0 := Rat.neg_add_cancel _
    _ = (-a + -b) + (a + b) := by
      calc
        0 = (-a + a) + (-b + b) := by
          simp only [Rat.neg_add_cancel, Rat.add_zero]
        _ = (-a + -b) + (a + b) := by
          simp only [Rat.add_assoc, Rat.add_left_comm]

private theorem listSumNeg {α : Type} (xs : List α) (f : α → Rat) :
    (xs.map (fun x => -f x)).sum = -(xs.map f).sum := by
  induction xs with
  | nil => rfl
  | cons x xs ih =>
      simp only [List.map_cons, List.sum_cons, ih, ratNegAdd]

private theorem listSumMul (xs : List α) (c : Rat) (f : α → Rat) :
    (xs.map (fun x => c * f x)).sum = c * (xs.map f).sum := by
  induction xs with
  | nil => simp
  | cons x xs ih =>
      simp only [List.map_cons, List.sum_cons, ih, Rat.mul_add]

private theorem listSumMono (xs : List α) (f g : α → Rat)
    (h : ∀ x ∈ xs, f x ≤ g x) :
    (xs.map f).sum ≤ (xs.map g).sum := by
  induction xs with
  | nil => exact Rat.le_refl
  | cons x xs ih =>
      simp only [List.map_cons, List.sum_cons]
      have hx : f x ≤ g x := h x (by simp)
      have hxs : (xs.map f).sum ≤ (xs.map g).sum :=
        ih (fun y hy => h y (by simp [hy]))
      exact Rat.le_trans
        ((Rat.add_le_add_right).2 hx)
        ((Rat.add_le_add_left).2 hxs)

theorem ratFinSum_add (n : Nat) (f g : Fin n → Rat) :
    ratFinSum n (fun i => f i + g i) = ratFinSum n f + ratFinSum n g :=
  listSumAdd (List.finRange n) f g

theorem ratFinSum_sub (n : Nat) (f g : Fin n → Rat) :
    ratFinSum n (fun i => f i - g i) = ratFinSum n f - ratFinSum n g := by
  simp only [Rat.sub_eq_add_neg]
  rw [ratFinSum_add]
  exact congrArg (fun t => ratFinSum n f + t) (listSumNeg (List.finRange n) g)

theorem ratFinSum_mul (n : Nat) (c : Rat) (f : Fin n → Rat) :
    ratFinSum n (fun i => c * f i) = c * ratFinSum n f :=
  listSumMul (List.finRange n) c f

theorem ratFinSum_congr (n : Nat) (f g : Fin n → Rat)
    (h : ∀ i, f i = g i) : ratFinSum n f = ratFinSum n g := by
  simp only [ratFinSum]
  congr 1
  exact List.map_congr_left (fun i _ => h i)

theorem ratFinSum_zero (n : Nat) : ratFinSum n (fun _ => 0) = 0 := by
  unfold ratFinSum
  generalize List.finRange n = xs
  induction xs with
  | nil => rfl
  | cons _ xs ih =>
      simp only [List.map_cons, List.sum_cons, ih, Rat.zero_add]

theorem ratFinSum_nonneg (n : Nat) (f : Fin n → Rat)
    (h : ∀ i, 0 ≤ f i) : 0 ≤ ratFinSum n f := by
  unfold ratFinSum
  have aux (xs : List (Fin n)) : 0 ≤ (xs.map f).sum := by
    induction xs with
    | nil => exact Rat.le_refl
    | cons x xs ih =>
        simp only [List.map_cons, List.sum_cons]
        exact Rat.add_nonneg (h x) ih
  exact aux (List.finRange n)

theorem ratFinSum_mono (n : Nat) (f g : Fin n → Rat)
    (h : ∀ i, f i ≤ g i) : ratFinSum n f ≤ ratFinSum n g :=
  listSumMono (List.finRange n) f g (fun i _ => h i)

/-- An ordered additive codomain for finite KL sums. In the intended instance,
    `Scalar = ℝ`, `ratCast q = (q : ℝ)`, `scale q x = (q : ℝ) * x`, and
    `logRatio p q = Real.log ((p : ℝ) / (q : ℝ))` for positive rationals.
    The required laws hold for natural logarithms on the reals: positivity of
    the rational embedding permits `log(p/r) = log(p/q) + log(q/r)` and
    `log(p/p) = 0`; `log(q/p) ≤ q/p - 1`, multiplied by positive `p`, gives
    `(p-q : ℝ) ≤ p * log(p/q)`. The remaining fields are additive order and
    scalar-distributivity laws of ℝ. Core Lean has no ℝ or logarithm, so this
    structure carries these standard laws as hypotheses, never as axioms. -/
structure FiniteLogLaws where
  Scalar : Type
  zero : Scalar
  add : Scalar → Scalar → Scalar
  le : Scalar → Scalar → Prop
  scale : Rat → Scalar → Scalar
  ratCast : Rat → Scalar
  logRatio : Rat → Rat → Scalar
  le_refl : ∀ a, le a a
  add_zero : ∀ a, add a zero = a
  zero_add : ∀ a, add zero a = a
  add_exchange : ∀ a b c d,
    add (add a b) (add c d) = add (add a c) (add b d)
  add_nonneg : ∀ {a b}, le zero a → le zero b → le zero (add a b)
  add_mono : ∀ {a b c d}, le a b → le c d → le (add a c) (add b d)
  add_nonnegative_right : ∀ a b, le zero b → le a (add a b)
  scale_add : ∀ q a b, scale q (add a b) = add (scale q a) (scale q b)
  scale_zero : ∀ q, scale q zero = zero
  scale_nonneg : ∀ {q a}, 0 ≤ q → le zero a → le zero (scale q a)
  ratCast_zero : ratCast 0 = zero
  ratCast_add : ∀ a b, ratCast (a + b) = add (ratCast a) (ratCast b)
  ratCast_injective : ∀ {a b}, ratCast a = ratCast b → a = b
  scale_ratCast : ∀ a b, scale a (ratCast b) = ratCast (a * b)
  chain : ∀ {p q r : Rat}, 0 < p → 0 < q → 0 < r →
    logRatio p r = add (logRatio p q) (logRatio q r)
  self_zero : ∀ {p : Rat}, 0 < p → logRatio p p = zero
  gibbs : ∀ {p q : Rat}, 0 < p → 0 < q →
    le (ratCast (p - q)) (scale p (logRatio p q))

def scalarListSum (L : FiniteLogLaws) : List L.Scalar → L.Scalar
  | [] => L.zero
  | x :: xs => L.add x (scalarListSum L xs)

def scalarFinSum (L : FiniteLogLaws) (n : Nat)
    (f : Fin n → L.Scalar) : L.Scalar :=
  scalarListSum L ((List.finRange n).map f)

private theorem scalarListSum_add (L : FiniteLogLaws) (xs : List α)
    (f g : α → L.Scalar) :
    scalarListSum L (xs.map (fun x => L.add (f x) (g x))) =
      L.add (scalarListSum L (xs.map f)) (scalarListSum L (xs.map g)) := by
  induction xs with
  | nil => exact (L.add_zero L.zero).symm
  | cons x xs ih =>
      simp only [List.map_cons, scalarListSum, ih]
      exact L.add_exchange _ _ _ _

theorem scalarFinSum_add (L : FiniteLogLaws) (n : Nat)
    (f g : Fin n → L.Scalar) :
    scalarFinSum L n (fun i => L.add (f i) (g i)) =
      L.add (scalarFinSum L n f) (scalarFinSum L n g) :=
  scalarListSum_add L (List.finRange n) f g

private theorem scalarListSum_scale (L : FiniteLogLaws) (xs : List α)
    (q : Rat) (f : α → L.Scalar) :
    scalarListSum L (xs.map (fun x => L.scale q (f x))) =
      L.scale q (scalarListSum L (xs.map f)) := by
  induction xs with
  | nil => exact (L.scale_zero q).symm
  | cons x xs ih =>
      simp only [List.map_cons, scalarListSum, ih]
      exact (L.scale_add q _ _).symm

theorem scalarFinSum_scale (L : FiniteLogLaws) (n : Nat)
    (q : Rat) (f : Fin n → L.Scalar) :
    scalarFinSum L n (fun i => L.scale q (f i)) =
      L.scale q (scalarFinSum L n f) :=
  scalarListSum_scale L (List.finRange n) q f

theorem scalarFinSum_congr (L : FiniteLogLaws) (n : Nat)
    (f g : Fin n → L.Scalar) (h : ∀ i, f i = g i) :
    scalarFinSum L n f = scalarFinSum L n g := by
  unfold scalarFinSum
  congr 1
  exact List.map_congr_left (fun i _ => h i)

theorem scalarFinSum_zero (L : FiniteLogLaws) (n : Nat) :
    scalarFinSum L n (fun _ => L.zero) = L.zero := by
  unfold scalarFinSum
  have aux (xs : List (Fin n)) :
      scalarListSum L (xs.map (fun _ => L.zero)) = L.zero := by
    induction xs with
    | nil => rfl
    | cons _ xs ih =>
        simp only [List.map_cons, scalarListSum, ih]
        exact L.zero_add L.zero
  exact aux (List.finRange n)

theorem scalarFinSum_nonneg (L : FiniteLogLaws) (n : Nat)
    (f : Fin n → L.Scalar) (h : ∀ i, L.le L.zero (f i)) :
    L.le L.zero (scalarFinSum L n f) := by
  unfold scalarFinSum
  have aux (xs : List (Fin n)) :
      L.le L.zero (scalarListSum L (xs.map f)) := by
    induction xs with
    | nil => exact L.le_refl L.zero
    | cons x xs ih =>
        simp only [List.map_cons, scalarListSum]
        exact L.add_nonneg (h x) ih
  exact aux (List.finRange n)

theorem scalarFinSum_mono (L : FiniteLogLaws) (n : Nat)
    (f g : Fin n → L.Scalar) (h : ∀ i, L.le (f i) (g i)) :
    L.le (scalarFinSum L n f) (scalarFinSum L n g) := by
  unfold scalarFinSum
  have aux (xs : List (Fin n)) :
      L.le (scalarListSum L (xs.map f))
        (scalarListSum L (xs.map g)) := by
    induction xs with
    | nil => exact L.le_refl L.zero
    | cons x xs ih =>
        simp only [List.map_cons, scalarListSum]
        exact L.add_mono (h x) ih
  exact aux (List.finRange n)

private theorem scalarListSum_ratCast (L : FiniteLogLaws) (xs : List α)
    (f : α → Rat) :
    scalarListSum L (xs.map (fun x => L.ratCast (f x))) =
      L.ratCast ((xs.map f).sum) := by
  induction xs with
  | nil => exact L.ratCast_zero.symm
  | cons x xs ih =>
      simp only [List.map_cons, scalarListSum, List.sum_cons, ih]
      exact (L.ratCast_add _ _).symm

theorem scalarFinSum_ratCast (L : FiniteLogLaws) (n : Nat)
    (f : Fin n → Rat) :
    scalarFinSum L n (fun i => L.ratCast (f i)) =
      L.ratCast (ratFinSum n f) :=
  scalarListSum_ratCast L (List.finRange n) f

structure FiniteRatKernel (k l : Nat) where
  prob : Fin k → Fin l → Rat
  positive : ∀ y z, 0 < prob y z
  normalized : ∀ y, ratFinSum l (prob y) = 1

/-- `conditional_expectation` is the finite disintegration identity for
    functions valued in the ordered scalar codomain of `L`. -/
structure FiniteMarkovLaw (L : FiniteLogLaws) (n k l : Nat) where
  weight : Fin n → Rat
  weight_nonnegative : ∀ x, 0 ≤ weight x
  weight_normalized : ratFinSum n weight = 1
  micro : Fin n → Fin l → Rat
  micro_positive : ∀ x z, 0 < micro x z
  micro_normalized : ∀ x, ratFinSum l (micro x) = 1
  macroOf : Fin n → Fin k
  macroWeight : Fin k → Rat
  macroWeight_nonnegative : ∀ y, 0 ≤ macroWeight y
  macroWeight_normalized : ratFinSum k macroWeight = 1
  conditional : FiniteRatKernel k l
  conditional_expectation : ∀ f : Fin k → Fin l → L.Scalar,
    scalarFinSum L n (fun x => L.scale (weight x)
      (scalarFinSum L l (fun z => L.scale (micro x z) (f (macroOf x) z)))) =
    scalarFinSum L k (fun y => L.scale (macroWeight y)
      (scalarFinSum L l (fun z => L.scale (conditional.prob y z) (f y z))))

def finitePredictiveLoss {L : FiniteLogLaws} {n k l : Nat}
    (D : FiniteMarkovLaw L n k l) (K : FiniteRatKernel k l) : L.Scalar :=
  scalarFinSum L n (fun x => L.scale (D.weight x)
    (scalarFinSum L l (fun z => L.scale (D.micro x z)
      (L.logRatio (D.micro x z) (K.prob (D.macroOf x) z)))))

def finiteConditionalInformation {L : FiniteLogLaws} {n k l : Nat}
    (D : FiniteMarkovLaw L n k l) : L.Scalar :=
  finitePredictiveLoss D D.conditional

def finiteExcessLoss {L : FiniteLogLaws} {n k l : Nat}
    (D : FiniteMarkovLaw L n k l) (K : FiniteRatKernel k l) : L.Scalar :=
  scalarFinSum L k (fun y => L.scale (D.macroWeight y)
    (scalarFinSum L l (fun z => L.scale (D.conditional.prob y z)
      (L.logRatio (D.conditional.prob y z) (K.prob y z)))))

theorem finite_markov_kl_decomposition {n k l : Nat}
    (L : FiniteLogLaws) (D : FiniteMarkovLaw L n k l)
    (K : FiniteRatKernel k l) :
    finitePredictiveLoss D K =
      L.add (finiteConditionalInformation D) (finiteExcessLoss D K) := by
  let f : Fin k → Fin l → L.Scalar := fun y z =>
    L.logRatio (D.conditional.prob y z) (K.prob y z)
  have hsplit (x : Fin n) (z : Fin l) :
      L.logRatio (D.micro x z) (K.prob (D.macroOf x) z) =
        L.add (L.logRatio (D.micro x z)
          (D.conditional.prob (D.macroOf x) z))
          (f (D.macroOf x) z) :=
    L.chain (D.micro_positive x z)
      (D.conditional.positive (D.macroOf x) z)
      (K.positive (D.macroOf x) z)
  have hrow (x : Fin n) :
      scalarFinSum L l (fun z => L.scale (D.micro x z)
        (L.logRatio (D.micro x z) (K.prob (D.macroOf x) z))) =
      L.add
        (scalarFinSum L l (fun z => L.scale (D.micro x z)
          (L.logRatio (D.micro x z)
            (D.conditional.prob (D.macroOf x) z))))
        (scalarFinSum L l (fun z => L.scale (D.micro x z)
          (f (D.macroOf x) z))) := by
    calc
      _ = scalarFinSum L l (fun z => L.add
          (L.scale (D.micro x z)
            (L.logRatio (D.micro x z)
              (D.conditional.prob (D.macroOf x) z)))
          (L.scale (D.micro x z) (f (D.macroOf x) z))) := by
            apply scalarFinSum_congr
            intro z
            rw [hsplit x z, L.scale_add]
      _ = _ := scalarFinSum_add L l _ _
  unfold finitePredictiveLoss finiteConditionalInformation finiteExcessLoss
  calc
    _ = scalarFinSum L n (fun x => L.add
          (L.scale (D.weight x)
            (scalarFinSum L l (fun z => L.scale (D.micro x z)
              (L.logRatio (D.micro x z)
                (D.conditional.prob (D.macroOf x) z)))))
          (L.scale (D.weight x)
            (scalarFinSum L l (fun z => L.scale (D.micro x z)
              (f (D.macroOf x) z))))) := by
          apply scalarFinSum_congr
          intro x
          rw [hrow x, L.scale_add]
    _ = _ := by
      rw [scalarFinSum_add]
      congr 1
      exact D.conditional_expectation f

theorem finite_rat_kl_nonnegative (l : Nat) (L : FiniteLogLaws)
    (p q : Fin l → Rat) (hp : ∀ z, 0 < p z) (hq : ∀ z, 0 < q z)
    (hpn : ratFinSum l p = 1) (hqn : ratFinSum l q = 1) :
    L.le L.zero (scalarFinSum L l
      (fun z => L.scale (p z) (L.logRatio (p z) (q z)))) := by
  have h := scalarFinSum_mono L l
    (fun z => L.ratCast (p z - q z))
    (fun z => L.scale (p z) (L.logRatio (p z) (q z)))
    (fun z => L.gibbs (hp z) (hq z))
  rw [scalarFinSum_ratCast, ratFinSum_sub, hpn, hqn] at h
  have hz : (1 : Rat) - 1 = 0 := by
    simp only [Rat.sub_eq_add_neg, Rat.add_neg_cancel]
  rwa [hz, L.ratCast_zero] at h

theorem finite_excess_loss_nonnegative {n k l : Nat}
    (L : FiniteLogLaws) (D : FiniteMarkovLaw L n k l)
    (K : FiniteRatKernel k l) :
    L.le L.zero (finiteExcessLoss D K) := by
  unfold finiteExcessLoss
  apply scalarFinSum_nonneg
  intro y
  apply L.scale_nonneg (D.macroWeight_nonnegative y)
  exact finite_rat_kl_nonnegative l L (D.conditional.prob y)
    (K.prob y) (D.conditional.positive y) (K.positive y)
    (D.conditional.normalized y) (K.normalized y)

theorem finite_conditional_excess_zero {n k l : Nat}
    (L : FiniteLogLaws) (D : FiniteMarkovLaw L n k l) :
    finiteExcessLoss D D.conditional = L.zero := by
  unfold finiteExcessLoss
  calc
    _ = scalarFinSum L k (fun _ => L.zero) := by
      apply scalarFinSum_congr
      intro y
      have hz : scalarFinSum L l (fun z =>
          L.scale (D.conditional.prob y z)
            (L.logRatio (D.conditional.prob y z)
              (D.conditional.prob y z))) = L.zero := by
        calc
          _ = scalarFinSum L l (fun _ => L.zero) := by
            apply scalarFinSum_congr
            intro z
            rw [L.self_zero (D.conditional.positive y z)]
            exact L.scale_zero _
          _ = L.zero := scalarFinSum_zero L l
      rw [hz]
      exact L.scale_zero _
    _ = L.zero := scalarFinSum_zero L k

def finiteMarkovClosureProfileFromKL {n k l : Nat}
    (L : FiniteLogLaws) (D : FiniteMarkovLaw L n k l) :
    FiniteMarkovClosureProfile (FiniteRatKernel k l) L.Scalar :=
  { admissible := fun _ => True
    conditionalMacroKernel := D.conditional
    predictiveClosureLoss := finitePredictiveLoss D
    conditionalMutualInformation := finiteConditionalInformation D
    excessLoss := finiteExcessLoss D
    zero := L.zero
    add := L.add
    leq := L.le
    conditional_admissible := trivial
    loss_decomposition := fun K _ => finite_markov_kl_decomposition L D K
    excess_nonnegative := fun K _ => finite_excess_loss_nonnegative L D K
    conditional_excess_zero := finite_conditional_excess_zero L D
    add_zero_cmi := L.add_zero _
    cmi_le_add_nonnegative := fun e he => L.add_nonnegative_right _ e he }

theorem finite_markov_closure_deficit_from_kl {n k l : Nat}
    (L : FiniteLogLaws) (D : FiniteMarkovLaw L n k l) :
    IsLossMinimum L.le (fun _ : FiniteRatKernel k l => True)
      (finitePredictiveLoss D) D.conditional ∧
    finitePredictiveLoss D D.conditional =
      finiteConditionalInformation D := by
  exact finite_markov_closure_deficit (finiteMarkovClosureProfileFromKL L D)

end SixBirdsIII
