import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteLocationAssignmentLemmaCanonicalLaneLean.LocationAssignmentModel

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

structure OptimalAssignmentPath {L : DiscreteLocationAssignmentModel} where
  path : ℕ → L.initialLocation
  actionSequence : ℕ → L.admissibleActions
  pathCompatibleWithActions : ∀ (t : ℕ), L.transitionCost (path t) (actionSequence t) (path (t+1)) > 0 ∨ path (t+1) = path t
  totalCost : ℝ
  costMinimal : ∀ (otherPath : ℕ → L.initialLocation) (otherActions : ℕ → L.admissibleActions),
    (∀ t, L.transitionCost (otherPath t) (otherActions t) (otherPath (t+1)) > 0 ∨ otherPath (t+1) = otherPath t) →
    (∑ t in Finset.range L.timeHorizon, L.transitionCost (otherPath t) (otherActions t) (otherPath (t+1))) ≥ totalCost

structure OptimalAssignmentPathEvidence {L : DiscreteLocationAssignmentModel} (O : OptimalAssignmentPath L) where
  costMinimalClosed : O.costMinimal

def OptimalAssignmentPathClosed {L : DiscreteLocationAssignmentModel} (O : OptimalAssignmentPath L) : Prop :=
  O.costMinimal

theorem optimal_assignment_path_closed_from_evidence {L : DiscreteLocationAssignmentModel}
    (O : OptimalAssignmentPath L) (E : OptimalAssignmentPathEvidence O) :
    OptimalAssignmentPathClosed O :=
  E.costMinimalClosed

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse