import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

structure MetricSpaceAssignmentPackage (A : AdmissibleClass) where
  metricSpace : Type u
  topology : TopologicalSpace metricSpace
  metric : metricSpace → metricSpace → ℝ
  triangleInequality : ∀ x y z : metricSpace, metric x z ≤ metric x y + metric y z
  symmetric : ∀ x y : metricSpace, metric x y = metric y x
  nonnegative : ∀ x y : metricSpace, 0 ≤ metric x y
  identityOfIndiscernibles : ∀ x y : metricSpace, metric x y = 0 → x = y
  assignmentFunction : Type v → Type v
  locationSet : Type w
  assignmentLaw : Prop

structure MetricSpaceAssignmentEvidence {A : AdmissibleClass} (M : MetricSpaceAssignmentPackage A) where
  assignmentLawClosed : M.assignmentLaw

def MetricSpaceAssignmentClosed {A : AdmissibleClass} (M : MetricSpaceAssignmentPackage A) : Prop :=
  M.assignmentLaw

theorem metric_space_assignment_closed_from_evidence {A : AdmissibleClass} (M : MetricSpaceAssignmentPackage A) (E : MetricSpaceAssignmentEvidence M) : MetricSpaceAssignmentClosed M := by
  exact E.assignmentLawClosed

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse