import canonicalLaneMathlib.AdmissibleClass
import DiscreteLocationAssignmentLemmaCanonicalLaneLean.DiscreteMetricSpace

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

structure AssignmentStructure (M : DiscreteMetricSpace) where
  assignments : M.Points → ℝ
  costFunction : (M.Points → ℝ) → ℝ
  totalCost : ℝ
  feasible : Prop
  assignmentClosed : Prop

structure AssignmentEvidence {M : DiscreteMetricSpace} (A : AssignmentStructure M) where
  feasibleClosed : A.feasible
  assignmentClosedClosed : A.assignmentClosed

def AssignmentClosed {M : DiscreteMetricSpace} (A : AssignmentStructure M) : Prop :=
  A.feasible ∧ A.assignmentClosed

theorem assignment_closed_from_evidence {M : DiscreteMetricSpace}
    (A : AssignmentStructure M) (E : AssignmentEvidence A) : AssignmentClosed A :=
  And.intro E.feasibleClosed E.assignmentClosedClosed

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse
