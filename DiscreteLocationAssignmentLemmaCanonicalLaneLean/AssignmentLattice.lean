import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

structure AssignmentLatticePackage (A : AdmissibleClass) where
  latticeType : Type u
  partialOrder : PartialOrder latticeType
  joinOp : latticeType → latticeType → latticeType
  meetOp : latticeType → latticeType → latticeType
  joinSemilattice : JoinSemilattice latticeType
  meetSemilattice : MeetSemilattice latticeType
  assignmentFunction : latticeType → latticeType
  monotonic : Monotone assignmentFunction
  fixedPointClause : ∃ x : latticeType, assignmentFunction x = x

def AssignmentLatticeClosed {A : AdmissibleClass} (L : AssignmentLatticePackage A) : Prop :=
  L.fixedPointClause

theorem assignment_lattice_closed {A : AdmissibleClass} (L : AssignmentLatticePackage A) (h : L.fixedPointClause) : AssignmentLatticeClosed L := h

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse