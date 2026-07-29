import canonicalLaneMathlib.AdmissibleClass
import DiscreteLocationAssignmentLemmaCanonicalLaneLean.DiscreteMetricSpace
import DiscreteLocationAssignmentLemmaCanonicalLaneLean.AssignmentStructure

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

structure LocationOptimalityPackage {M : DiscreteMetricSpace}
    (A : AssignmentStructure M) where
  facilityLocations : Set M.Points
  assignmentOptimal : Prop
  minimaxProperty : Prop
  pMedianProperty : Prop
  dominatingSetProperty : Prop

structure LocationOptimalityEvidence {M : DiscreteMetricSpace}
    {A : AssignmentStructure M} (L : LocationOptimalityPackage A) where
  assignmentOptimalClosed : L.assignmentOptimal
  minimaxPropertyClosed : L.minimaxProperty
  pMedianPropertyClosed : L.pMedianProperty
  dominatingSetPropertyClosed : L.dominatingSetProperty

def LocationOptimalityClosed {M : DiscreteMetricSpace}
    {A : AssignmentStructure M} (L : LocationOptimalityPackage A) : Prop :=
  L.assignmentOptimal ∧ L.minimaxProperty ∧ L.pMedianProperty ∧ L.dominatingSetProperty

theorem location_optimality_closed_from_evidence {M : DiscreteMetricSpace}
    {A : AssignmentStructure M} (L : LocationOptimalityPackage A)
    (E : LocationOptimalityEvidence L) : LocationOptimalityClosed L :=
  And.intro E.assignmentOptimalClosed
    (And.intro E.minimaxPropertyClosed
      (And.intro E.pMedianPropertyClosed E.dominatingSetPropertyClosed))

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse
