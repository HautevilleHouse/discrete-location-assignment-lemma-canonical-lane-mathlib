import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteLocationAssignmentLemmaCanonicalLaneLean.LocationAssignmentModel

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

structure StochasticLocationAssignmentModel extends DiscreteLocationAssignmentModel where
  stochasticTransition : initialLocation → admissibleActions → (initialLocation → ℝ)
  probabilitySumOne : ∀ s a, (∑ s', stochasticTransition s a s') = 1
  expectedCost : initialLocation → admissibleActions → ℝ
  expectedCostDefined : ∀ s a, expectedCost s a = (∑ s', (stochasticTransition s a s') * transitionCost s a s')

structure StochasticEvidence (S : StochasticLocationAssignmentModel) where
  probabilitySumOneClosed : S.probabilitySumOne
  expectedCostDefinedClosed : S.expectedCostDefined

def StochasticModelClosed (S : StochasticLocationAssignmentModel) : Prop :=
  S.probabilitySumOne ∧ S.expectedCostDefined

theorem stochastic_model_closed_from_evidence (S : StochasticLocationAssignmentModel)
    (E : StochasticEvidence S) : StochasticModelClosed S :=
  And.intro E.probabilitySumOneClosed E.expectedCostDefinedClosed

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse