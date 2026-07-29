import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

structure LocationAssignmentSystem where
  locations : Type u
  agents : Type v
  assignment : agents → locations
  capacity : locations → ℕ
  demand : agents → ℕ
  feasible : Prop
  assignmentRespectsCapacity : Prop
  assignmentSatisfiesDemand : Prop
  assignmentRespectsCapacityClosed : assignmentRespectsCapacity
  assignmentSatisfiesDemandClosed : assignmentSatisfiesDemand
  feasibleClosed : feasible := by
    exact And.intro assignmentRespectsCapacityClosed assignmentSatisfiesDemandClosed

structure LocationAssignmentEvidence (L : LocationAssignmentSystem) where
  assignmentRespectsCapacityClosed : L.assignmentRespectsCapacity
  assignmentSatisfiesDemandClosed : L.assignmentSatisfiesDemand

def LocationAssignmentClosed (L : LocationAssignmentSystem) : Prop :=
  L.assignmentRespectsCapacity ∧ L.assignmentSatisfiesDemand

theorem location_assignment_closed_from_evidence (L : LocationAssignmentSystem)
    (E : LocationAssignmentEvidence L) : LocationAssignmentClosed L := by
  exact And.intro E.assignmentRespectsCapacityClosed E.assignmentSatisfiesDemandClosed

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse