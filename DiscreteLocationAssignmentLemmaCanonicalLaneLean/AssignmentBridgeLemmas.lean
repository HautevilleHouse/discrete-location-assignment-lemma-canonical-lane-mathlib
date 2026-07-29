import DiscreteLocationAssignmentLemmaCanonicalLaneLean.DiscreteAssignmentConstraint
import DiscreteLocationAssignmentLemmaCanonicalLaneLean.LocationCostStructure

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | .assignment D => DiscreteAssignmentClosed D
  | .cost L => LocationCostClosed L

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  rcases A.object with (D | L)
  · exact discrete_assignment_closed_from_evidence D (by
      rcases A with ⟨_, _, _, h⟩
      exact h)
  · exact location_cost_closed_from_evidence L (by
      rcases A with ⟨_, _, _, h⟩
      exact h)

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse