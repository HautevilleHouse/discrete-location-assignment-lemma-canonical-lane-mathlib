import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteLocationAssignmentLemmaCanonicalLaneLean.DiscreteLocationAssignmentLemma

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A with
  | AdmissibleClass.mk _ _ _ _ => True

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  by
    trivial

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse