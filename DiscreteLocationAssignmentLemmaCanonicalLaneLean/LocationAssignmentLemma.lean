import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

structure LocationAssignmentLemmaPackage (A : AdmissibleClass) where
  assignmentFunction : Type u → Type u
  locationSet : Type u
  totalOrder : TotalOrder locationSet
  lowerBound : locationSet
  upperBound : locationSet
  monotonicProp : ∀ x : locationSet, assignmentFunction x ≥ x
  fixedPointProp : ∃ x : locationSet, assignmentFunction x = x

def LocationAssignmentLemmaClosed {A : AdmissibleClass} (L : LocationAssignmentLemmaPackage A) : Prop :=
  L.fixedPointProp

theorem location_assignment_lemma_closed {A : AdmissibleClass} (L : LocationAssignmentLemmaPackage A) (h : L.fixedPointProp) : LocationAssignmentLemmaClosed L := h

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse