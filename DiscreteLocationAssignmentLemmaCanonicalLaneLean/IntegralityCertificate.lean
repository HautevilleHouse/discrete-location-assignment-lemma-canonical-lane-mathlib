import DiscreteLocationAssignmentLemmaCanonicalLaneLean.DecompositionAlgorithm

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

structure IntegralityCertificate {L : LocationAssignmentSystem}
    {P : LocationPolyhedron L} (D : DecompositionAlgorithm P) where
  certificate : Type
  sizeBound : Prop
  verificationRoutine : Prop
  certificateFound : Prop
  sizeBoundClosed : sizeBound
  verificationRoutineClosed : verificationRoutine
  certificateFoundClosed : certificateFound

structure IntegralityCertificateEvidence {L : LocationAssignmentSystem}
    {P : LocationPolyhedron L} {D : DecompositionAlgorithm P}
    (C : IntegralityCertificate D) where
  sizeBoundClosed : C.sizeBound
  verificationRoutineClosed : C.verificationRoutine
  certificateFoundClosed : C.certificateFound

def IntegralityCertificateClosed {L : LocationAssignmentSystem}
    {P : LocationPolyhedron L} {D : DecompositionAlgorithm P}
    (C : IntegralityCertificate D) : Prop :=
  C.sizeBound ∧ C.verificationRoutine ∧ C.certificateFound

theorem integrality_certificate_closed_from_evidence {L : LocationAssignmentSystem}
    {P : LocationPolyhedron L} {D : DecompositionAlgorithm P}
    (C : IntegralityCertificate D) (E : IntegralityCertificateEvidence C) :
    IntegralityCertificateClosed C := by
  exact And.intro E.sizeBoundClosed (And.intro E.verificationRoutineClosed E.certificateFoundClosed)

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse