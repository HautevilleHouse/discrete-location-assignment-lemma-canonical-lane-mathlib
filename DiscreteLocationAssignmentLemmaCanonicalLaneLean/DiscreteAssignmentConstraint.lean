import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

structure DiscreteLocationAssignmentPackage where
  locations : Type u
  agents : Type v
  assignmentRelation : agents → locations → Prop
  capacityConstraint : Prop
  assignmentCost : agents → locations → ℝ
  totalCost : ℝ
  optimalAssignmentExists : Prop

structure DiscreteAssignmentEvidence (D : DiscreteLocationAssignmentPackage) where
  capacityConstraintClosed : D.capacityConstraint
  optimalAssignmentExistsClosed : D.optimalAssignmentExists

def DiscreteAssignmentClosed (D : DiscreteLocationAssignmentPackage) : Prop :=
  D.capacityConstraint ∧ D.optimalAssignmentExists

theorem discrete_assignment_closed_from_evidence
    (D : DiscreteLocationAssignmentPackage) (E : DiscreteAssignmentEvidence D) :
    DiscreteAssignmentClosed D := by
  exact And.intro E.capacityConstraintClosed E.optimalAssignmentExistsClosed

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse