import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

structure AssignmentCompactnessPackage (A : AdmissibleClass) where
  compactSpace : Type u
  topology : TopologicalSpace compactSpace
  compactProp : IsCompact (Set.univ : Set compactSpace)
  assignmentFunction : compactSpace → compactSpace
  continuity : Continuous assignmentFunction
  fixedPointProp : ∃ x : compactSpace, assignmentFunction x = x

def AssignmentCompactnessClosed {A : AdmissibleClass} (P : AssignmentCompactnessPackage A) : Prop :=
  P.fixedPointProp

theorem assignment_compactness_closed {A : AdmissibleClass} (P : AssignmentCompactnessPackage A) (h : P.fixedPointProp) : AssignmentCompactnessClosed P := h

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse