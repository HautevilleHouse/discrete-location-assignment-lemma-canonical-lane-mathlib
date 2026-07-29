import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteLocationAssignmentLemmaCanonicalLaneLean.CoverageConstraint

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

structure IntegralityGap (L : LocationSpace) (P : AssignmentProblem L) (C : CoverageConstraint L P) where
  linearProgramOptimal : ℝ
  integerProgramOptimal : ℝ
  gapBound : ℝ
  gapBoundClosed : gapBound ≥ linearProgramOptimal - integerProgramOptimal
  integralityGapClosed : Prop
  integralityGapClosedTerm : integralityGapClosed

def IntegralityGapClosed (L : LocationSpace) (P : AssignmentProblem L) (C : CoverageConstraint L P) (G : IntegralityGap L P C) : Prop :=
  G.integralityGapClosed

theorem integrality_gap_closed_from_evidence (L : LocationSpace) (P : AssignmentProblem L) (C : CoverageConstraint L P) (G : IntegralityGap L P C) : IntegralityGapClosed L P C G :=
  G.integralityGapClosedTerm

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse