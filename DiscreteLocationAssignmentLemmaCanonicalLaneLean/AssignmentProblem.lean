import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteLocationAssignmentLemmaCanonicalLaneLean.LocationSpace

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

structure AssignmentProblem (L : LocationSpace) where
  facilities : List L.points
  clients : List L.points
  demand : List ℝ
  capacity : List ℝ
  assignmentCost : L.points → L.points → ℝ
  objectiveMinimizeTotalCost : Prop
  constraintsSatisfied : Prop

structure AssignmentEvidence (L : LocationSpace) (P : AssignmentProblem L) where
  objectiveMinimizeTotalCostClosed : P.objectiveMinimizeTotalCost
  constraintsSatisfiedClosed : P.constraintsSatisfied

def AssignmentClosed (L : LocationSpace) (P : AssignmentProblem L) : Prop :=
  P.objectiveMinimizeTotalCost ∧ P.constraintsSatisfied

theorem assignment_closed_from_evidence (L : LocationSpace) (P : AssignmentProblem L) (E : AssignmentEvidence L P) : AssignmentClosed L P :=
  by
    exact And.intro E.objectiveMinimizeTotalCostClosed E.constraintsSatisfiedClosed

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse