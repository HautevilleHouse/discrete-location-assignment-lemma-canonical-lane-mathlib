import DiscreteLocationAssignmentLemmaCanonicalLaneLean.LocationPolyhedron

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

structure DecompositionAlgorithm {L : LocationAssignmentSystem}
    (P : LocationPolyhedron L) where
  steps : Nat
  decompositionFound : Prop
  complexityBound : Prop
  correctness : Prop
  decompositionFoundClosed : decompositionFound
  complexityBoundClosed : complexityBound
  correctnessClosed : correctness

structure DecompositionAlgorithmEvidence {L : LocationAssignmentSystem}
    {P : LocationPolyhedron L} (D : DecompositionAlgorithm P) where
  decompositionFoundClosed : D.decompositionFound
  complexityBoundClosed : D.complexityBound
  correctnessClosed : D.correctness

def DecompositionAlgorithmClosed {L : LocationAssignmentSystem}
    {P : LocationPolyhedron L} (D : DecompositionAlgorithm P) : Prop :=
  D.decompositionFound ∧ D.complexityBound ∧ D.correctness

theorem decomposition_algorithm_closed_from_evidence {L : LocationAssignmentSystem}
    {P : LocationPolyhedron L} (D : DecompositionAlgorithm P)
    (E : DecompositionAlgorithmEvidence D) : DecompositionAlgorithmClosed D := by
  exact And.intro E.decompositionFoundClosed (And.intro E.complexityBoundClosed E.correctnessClosed)

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse