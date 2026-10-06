import SixBirdsIII.Basic

namespace SixBirdsIII

def Level.rank : Level → Nat
  | .behavioral => 0
  | .verification => 1
  | .structural => 2

def Level.lt (a b : Level) : Prop := a.rank < b.rank

structure OrderedInstrument where
  identifier : Nat
  level : Level

structure OrderedInstrumentStack where
  lowerInstruments : List OrderedInstrument
  admissible : Prop

structure OrderedAuditExtension where
  lower : OrderedInstrumentStack
  instrument : OrderedInstrument
  higherThanLower : ∀ i ∈ lower.lowerInstruments,
    Level.lt i.level instrument.level

theorem finite_rotating_audit_of_higher_level
    (stack : OrderedInstrumentStack)
    (hAvailable : ∃ upper : Level,
      ∀ i ∈ stack.lowerInstruments, Level.lt i.level upper) :
    ∃ ext : OrderedAuditExtension,
      ext.lower = stack ∧
      ∀ i ∈ stack.lowerInstruments, Level.lt i.level ext.instrument.level := by
  obtain ⟨upper, hu⟩ := hAvailable
  exact ⟨⟨stack, ⟨stack.lowerInstruments.length, upper⟩, hu⟩, rfl, hu⟩

theorem no_level_above_structural :
    ¬ ∃ upper : Level, Level.lt Level.structural upper := by
  intro ⟨upper, h⟩
  cases upper <;> simp [Level.lt, Level.rank] at h

theorem no_higher_level_for_top_stack
    (stack : OrderedInstrumentStack)
    (hTop : ∃ i ∈ stack.lowerInstruments,
      i.level = Level.structural) :
    ¬ ∃ upper : Level,
      ∀ i ∈ stack.lowerInstruments, Level.lt i.level upper := by
  intro ⟨upper, hu⟩
  obtain ⟨i, hi, hil⟩ := hTop
  exact no_level_above_structural ⟨upper, hil ▸ hu i hi⟩

structure InstrumentStack where
  length : Nat
  finiteRecords : Bool
  admissibleLowerStack : Bool
  strictlyIncreasingLevels : Bool
  stackDefectEmpty : Bool
deriving Repr

structure RotatingAuditExtension where
  lower : InstrumentStack
  extensionInstrumentPresent : Bool
  extensionLevelHigher : Bool
  targetScopeCoversLowerStack : Bool
  bridgeAdmissible : Bool
  reportAccepted : Bool
  stackDefectEmpty : Bool
  complianceAccepted : Bool
  selfSoundnessAccepted : Bool
deriving Repr

def oneLevelRotatingAuditExtension
    (stack : InstrumentStack)
    (_hfinite : stack.finiteRecords = true)
    (_hadm : stack.admissibleLowerStack = true)
    (_hlevels : stack.strictlyIncreasingLevels = true) :
    RotatingAuditExtension :=
  { lower := stack
    extensionInstrumentPresent := true
    extensionLevelHigher := true
    targetScopeCoversLowerStack := true
    bridgeAdmissible := true
    reportAccepted := true
    stackDefectEmpty := stack.stackDefectEmpty
    complianceAccepted := stack.stackDefectEmpty
    selfSoundnessAccepted := false }

theorem finite_rotating_audit
    (stack : InstrumentStack)
    (hfinite : stack.finiteRecords = true)
    (hadm : stack.admissibleLowerStack = true)
    (hlevels : stack.strictlyIncreasingLevels = true) :
    exists ext : RotatingAuditExtension,
      ext.lower = stack /\
      ext.extensionInstrumentPresent = true /\
      ext.extensionLevelHigher = true /\
      ext.bridgeAdmissible = true /\
      ext.reportAccepted = true /\
      (ext.complianceAccepted = true <-> ext.stackDefectEmpty = true) /\
      ext.selfSoundnessAccepted = false := by
  refine ⟨oneLevelRotatingAuditExtension stack hfinite hadm hlevels, ?_⟩
  simp [oneLevelRotatingAuditExtension]

def toyCleanInstrumentStack : InstrumentStack :=
  { length := 2
    finiteRecords := true
    admissibleLowerStack := true
    strictlyIncreasingLevels := true
    stackDefectEmpty := true }

def toyDefectiveInstrumentStack : InstrumentStack :=
  { toyCleanInstrumentStack with
    stackDefectEmpty := false }

end SixBirdsIII
