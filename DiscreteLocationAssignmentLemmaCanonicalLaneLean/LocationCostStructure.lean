import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteLocationAssignmentLemmaCanonicalLaneLean

structure LocationCostStructure where
  locations : Type u
  costMatrix : locations → locations → ℝ
  triangleInequality : Prop
  symmetry : Prop
  nonNegativity : Prop

def LocationCostClosed (L : LocationCostStructure) : Prop :=
  L.triangleInequality ∧ L.symmetry ∧ L.nonNegativity

structure LocationCostEvidence (L : LocationCostStructure) where
  triangleInequalityClosed : L.triangleInequality
  symmetryClosed : L.symmetry
  nonNegativityClosed : L.nonNegativity

theorem location_cost_closed_from_evidence
    (L : LocationCostStructure) (E : LocationCostEvidence L) :
    LocationCostClosed L := by
  exact And.intro E.triangleInequalityClosed
    (And.intro E.symmetryClosed E.nonNegativityClosed)

end DiscreteLocationAssignmentLemmaCanonicalLaneLean
end HautevilleHouse