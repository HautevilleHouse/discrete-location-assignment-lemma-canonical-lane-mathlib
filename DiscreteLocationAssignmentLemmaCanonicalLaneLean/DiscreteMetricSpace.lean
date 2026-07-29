import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

structure DiscreteMetricSpace where
  Points : Type u
  distance : Points → Points → ℝ
  distancePositive : ∀ x y : Points, distance x y ≥ 0
  distanceIdentity : ∀ x : Points, distance x x = 0
  distanceSymmetry : ∀ x y : Points, distance x y = distance y x
  distanceTriangle : ∀ x y z : Points, distance x z ≤ distance x y + distance y z

def DiscreteMetricSpaceClosed (M : DiscreteMetricSpace) : Prop :=
  (∀ x : M.Points, M.distance x x = 0) ∧
  (∀ x y : M.Points, M.distance x y = M.distance y x) ∧
  (∀ x y z : M.Points, M.distance x z ≤ M.distance x y + M.distance y z)

theorem discrete_metric_space_closed (M : DiscreteMetricSpace) : DiscreteMetricSpaceClosed M :=
  And.intro M.distanceIdentity (And.intro M.distanceSymmetry M.distanceTriangle)

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse
