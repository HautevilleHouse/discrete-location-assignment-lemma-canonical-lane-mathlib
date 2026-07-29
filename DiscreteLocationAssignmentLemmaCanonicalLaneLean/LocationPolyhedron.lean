import DiscreteLocationAssignmentLemmaCanonicalLaneLean.LocationAssignmentSystem

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

structure LocationPolyhedron {L : LocationAssignmentSystem} where
  constraints : Set (L.agents → ℚ)
  polyhedron : Prop
  integralVertices : Prop
  verticesIntegral : Prop
  polyhedronClosed : polyhedron
  integralVerticesClosed : integralVertices
  verticesIntegralClosed : verticesIntegral

structure LocationPolyhedronEvidence {L : LocationAssignmentSystem}
    (P : LocationPolyhedron L) where
  polyhedronClosed : P.polyhedron
  integralVerticesClosed : P.integralVertices
  verticesIntegralClosed : P.verticesIntegral

def LocationPolyhedronClosed {L : LocationAssignmentSystem}
    (P : LocationPolyhedron L) : Prop :=
  P.polyhedron ∧ P.integralVertices ∧ P.verticesIntegral

theorem location_polyhedron_closed_from_evidence {L : LocationAssignmentSystem}
    (P : LocationPolyhedron L) (E : LocationPolyhedronEvidence P) :
    LocationPolyhedronClosed P := by
  exact And.intro E.polyhedronClosed (And.intro E.integralVerticesClosed E.verticesIntegralClosed)

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse