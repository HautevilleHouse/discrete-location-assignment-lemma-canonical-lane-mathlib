import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteLocationAssignmentLemmaCanonicalLaneLean.AssignmentProblem

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

structure CoverageConstraint (L : LocationSpace) (P : AssignmentProblem L) where
  coverageRadius : ℝ
  coverageCondition : ∀ client : L.points, ∃ facility : P.facilities, L.distanceFunction client facility ≤ coverageRadius
  coverageConditionClosed : coverageCondition

def CoverageClosed (L : LocationSpace) (P : AssignmentProblem L) (C : CoverageConstraint L P) : Prop :=
  C.coverageCondition

theorem coverage_closed_from_evidence (L : LocationSpace) (P : AssignmentProblem L) (C : CoverageConstraint L P) : CoverageClosed L P C :=
  C.coverageConditionClosed

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse