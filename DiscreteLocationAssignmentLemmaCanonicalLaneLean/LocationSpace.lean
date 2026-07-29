import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

structure LocationSpace where
  points : Type u
  topology : TopologicalSpace points
  metric : Type v
  discreteMetric : Prop
  finiteSubsets : Prop
  distanceFunction : points → points → ℝ

structure LocationSpaceEvidence (L : LocationSpace) where
  discreteMetricClosed : L.discreteMetric
  finiteSubsetsClosed : L.finiteSubsets
  distanceSymmetric : ∀ x y : L.points, L.distanceFunction x y = L.distanceFunction y x
  distanceNonnegative : ∀ x y : L.points, L.distanceFunction x y ≥ 0
  distanceTriangle : ∀ x y z : L.points, L.distanceFunction x z ≤ L.distanceFunction x y + L.distanceFunction y z

def LocationSpaceClosed (L : LocationSpace) : Prop :=
  L.discreteMetric ∧ L.finiteSubsets

theorem location_space_closed_from_evidence (L : LocationSpace) (E : LocationSpaceEvidence L) : LocationSpaceClosed L :=
  by
    exact And.intro E.discreteMetricClosed E.finiteSubsetsClosed

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse