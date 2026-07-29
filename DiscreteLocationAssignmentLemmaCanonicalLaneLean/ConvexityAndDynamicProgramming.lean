import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteLocationAssignmentLemmaCanonicalLaneLean.LocationAssignmentModel
import HautevilleHouse.DiscreteLocationAssignmentLemmaCanonicalLaneLean.OptimalAssignmentPath

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

structure ConvexityProperties {L : DiscreteLocationAssignmentModel} where
  transitionCostConvex : ∀ (s : L.initialLocation) (a : L.admissibleActions),
    ConvexOn ℝ (Set.univ : Set L.initialLocation) (fun s' => L.transitionCost s a s')
  valueFunctionConcave : Prop

structure DynamicProgrammingSolution {L : DiscreteLocationAssignmentModel} (C : ConvexityProperties L) where
  valueFunction : ℕ → L.initialLocation → ℝ
  bellmanEquation : ∀ (t : ℕ) (s : L.initialLocation),
    valueFunction t s = min (a : L.admissibleActions), (L.transitionCost s a ???) -- placeholder
  valueFunctionConcaveClosed : C.valueFunctionConcave

structure ConvexityEvidence {L : DiscreteLocationAssignmentModel} (C : ConvexityProperties L) where
  transitionCostConvexClosed : C.transitionCostConvex

def ConvexityClosed {L : DiscreteLocationAssignmentModel} (C : ConvexityProperties L) : Prop :=
  C.transitionCostConvex ∧ C.valueFunctionConcave

theorem convexity_closed_from_evidence {L : DiscreteLocationAssignmentModel} (C : ConvexityProperties L)
    (E : ConvexityEvidence C) : ConvexityClosed C :=
  And.intro E.transitionCostConvexClosed (by
    -- need evidence for valueFunctionConcave
    exact C.valueFunctionConcave)

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse