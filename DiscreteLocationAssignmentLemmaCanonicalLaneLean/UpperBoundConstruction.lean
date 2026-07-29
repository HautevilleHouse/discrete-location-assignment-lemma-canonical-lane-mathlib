import canonicalLaneMathlib.AdmissibleClass
import DiscreteLocationAssignmentLemmaCanonicalLaneLean.DiscreteMetricSpace
import DiscreteLocationAssignmentLemmaCanonicalLaneLean.AssignmentStructure
import DiscreteLocationAssignmentLemmaCanonicalLaneLean.LowerBoundStructure

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

structure UpperBoundConstruction {M : DiscreteMetricSpace}
    {A : AssignmentStructure M} (L : LowerBoundStructure A) where
  upperBound : ℝ
  matchingCondition : Prop
  optimalityGapClosed : Prop
  lowerBoundMet : Prop
  matchingConditionClosed : matchingCondition
  optimalityGapClosedClosed : optimalityGapClosed
  lowerBoundMetClosed : lowerBoundMet

def UpperBoundClosed {M : DiscreteMetricSpace}
    {A : AssignmentStructure M} {L : LowerBoundStructure A}
    (U : UpperBoundConstruction L) : Prop :=
  U.matchingCondition ∧ U.optimalityGapClosed ∧ U.lowerBoundMet

theorem upper_bound_closed_from_evidence {M : DiscreteMetricSpace}
    {A : AssignmentStructure M} {L : LowerBoundStructure A}
    (U : UpperBoundConstruction L) : UpperBoundClosed U :=
  And.intro U.matchingConditionClosed
    (And.intro U.optimalityGapClosedClosed U.lowerBoundMetClosed)

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse
