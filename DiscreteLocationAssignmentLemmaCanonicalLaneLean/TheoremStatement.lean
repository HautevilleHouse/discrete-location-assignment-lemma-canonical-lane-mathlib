import DiscreteLocationAssignmentLemmaCanonicalLaneLean.Basic

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

structure DiscreteLocationSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure DiscreteLocationAdmittedObject where
  space : DiscreteLocationSpace
  assignmentSatisfied : Prop
  conclusion : assignmentSatisfied

def DiscreteLocationWitnessClosed (O : DiscreteLocationAdmittedObject) : Prop :=
  O.assignmentSatisfied

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse