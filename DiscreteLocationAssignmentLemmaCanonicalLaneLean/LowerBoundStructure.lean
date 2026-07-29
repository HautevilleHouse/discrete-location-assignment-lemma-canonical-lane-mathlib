import canonicalLaneMathlib.AdmissibleClass
import DiscreteLocationAssignmentLemmaCanonicalLaneLean.DiscreteMetricSpace
import DiscreteLocationAssignmentLemmaCanonicalLaneLean.AssignmentStructure

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

structure LowerBoundStructure {M : DiscreteMetricSpace}
    (A : AssignmentStructure M) where
  lowerBound : ℝ
  boundTightness : Prop
  boundProof : Prop
  boundProofClosed : boundProof
  tightnessClosed : boundTightness

def LowerBoundClosed {M : DiscreteMetricSpace}
    {A : AssignmentStructure M} (L : LowerBoundStructure A) : Prop :=
  L.boundTightness ∧ L.boundProof

theorem lower_bound_closed_from_evidence {M : DiscreteMetricSpace}
    {A : AssignmentStructure M} (L : LowerBoundStructure A) : LowerBoundClosed L :=
  And.intro L.tightnessClosed L.boundProofClosed

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse
