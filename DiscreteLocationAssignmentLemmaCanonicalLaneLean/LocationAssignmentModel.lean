import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

structure DiscreteLocationAssignmentModel where
  timeHorizon : ℕ
  initialLocation : Type u
  admissibleActions : Type v
  transitionCost : initialLocation → admissibleActions → initialLocation → ℝ
  assignmentRule : (ℕ → admissibleActions) → Prop
  initialLocationProperty : Prop
  transitionCostFinite : Prop

structure LocationAssignmentEvidence (L : DiscreteLocationAssignmentModel) where
  assignmentRuleClosed : L.assignmentRule
  initialLocationPropertyClosed : L.initialLocationProperty
  transitionCostFiniteClosed : L.transitionCostFinite

def LocationAssignmentModelClosed (L : DiscreteLocationAssignmentModel) : Prop :=
  L.assignmentRule ∧ L.initialLocationProperty ∧ L.transitionCostFinite

theorem location_assignment_model_closed_from_evidence (L : DiscreteLocationAssignmentModel)
    (E : LocationAssignmentEvidence L) : LocationAssignmentModelClosed L :=
  And.intro E.assignmentRuleClosed
    (And.intro E.initialLocationPropertyClosed E.transitionCostFiniteClosed)

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse