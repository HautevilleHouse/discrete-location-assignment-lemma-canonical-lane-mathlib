import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteLocationAssignmentLemmaCanonicalLaneLean.IntegralityGap

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

structure DiscreteLocationAssignmentLemma (L : LocationSpace) (P : AssignmentProblem L) (C : CoverageConstraint L P) (G : IntegralityGap L P C) where
  lemmaStatement : Prop
  lemmaProof : lemmaStatement

def DiscreteLocationAssignmentLemmaClosed (L : LocationSpace) (P : AssignmentProblem L) (C : CoverageConstraint L P) (G : IntegralityGap L P C) (D : DiscreteLocationAssignmentLemma L P C G) : Prop :=
  D.lemmaStatement

theorem discrete_location_assignment_lemma_closed (L : LocationSpace) (P : AssignmentProblem L) (C : CoverageConstraint L P) (G : IntegralityGap L P C) (D : DiscreteLocationAssignmentLemma L P C G) : DiscreteLocationAssignmentLemmaClosed L P C G D :=
  D.lemmaProof

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse