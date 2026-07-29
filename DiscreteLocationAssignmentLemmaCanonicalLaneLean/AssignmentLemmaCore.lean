import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteLocationAssignmentLemmaCanonicalLaneLean.LocationAssignmentModel
import HautevilleHouse.DiscreteLocationAssignmentLemmaCanonicalLaneLean.OptimalAssignmentPath
import HautevilleHouse.DiscreteLocationAssignmentLemmaCanonicalLaneLean.ConvexityAndDynamicProgramming
import HautevilleHouse.DiscreteLocationAssignmentLemmaCanonicalLaneLean.StochasticExtension

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

structure AssignmentLemmaCore where
  model : DiscreteLocationAssignmentModel
  optimalPath : OptimalAssignmentPath model
  convexity : ConvexityProperties model
  stochasticExtension : StochasticLocationAssignmentModel
  compatibility : Prop

structure AssignmentLemmaEvidence (A : AssignmentLemmaCore) where
  optimalPathClosed : OptimalAssignmentPathClosed A.optimalPath
  convexityClosed : ConvexityClosed A.convexity
  stochasticExtensionClosed : StochasticModelClosed A.stochasticExtension
  compatibilityClosed : A.compatibility

def AssignmentLemmaCoreClosed (A : AssignmentLemmaCore) : Prop :=
  OptimalAssignmentPathClosed A.optimalPath ∧
  ConvexityClosed A.convexity ∧
  StochasticModelClosed A.stochasticExtension ∧
  A.compatibility

theorem assignment_lemma_core_closed_from_evidence (A : AssignmentLemmaCore)
    (E : AssignmentLemmaEvidence A) : AssignmentLemmaCoreClosed A :=
  And.intro E.optimalPathClosed
    (And.intro E.convexityClosed
      (And.intro E.stochasticExtensionClosed E.compatibilityClosed))

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse