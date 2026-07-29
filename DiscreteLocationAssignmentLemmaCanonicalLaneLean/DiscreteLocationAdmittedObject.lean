import canonicalLaneMathlib.AdmissibleClass
import DiscreteLocationAssignmentLemmaCanonicalLaneLean.IntegralityCertificate

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

structure DiscreteLocationSpace where
  carrier : Type
  metric : carrier → carrier → ℚ
  discrete : Prop

structure DiscreteLocationAdmittedObject where
  space : DiscreteLocationSpace
  feasibleAssignment : Prop
  polyhedronIntegral : Prop
  algorithmDecomposes : Prop
  certificateVerified : Prop
  conclusion : feasibleAssignment ∧ polyhedronIntegral ∧ algorithmDecomposes ∧ certificateVerified

def DiscreteLocationWitnessClosed (O : DiscreteLocationAdmittedObject) : Prop :=
  O.conclusion

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse