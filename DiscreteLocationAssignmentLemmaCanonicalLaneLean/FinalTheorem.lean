import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteLocationAssignmentLemmaCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

def ConstrainedDiscreteLocationAssignmentLemmaClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_discrete_location_assignment_lemma_endgame (A : AdmissibleClass) : ConstrainedDiscreteLocationAssignmentLemmaClosure A :=
  by
    exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse