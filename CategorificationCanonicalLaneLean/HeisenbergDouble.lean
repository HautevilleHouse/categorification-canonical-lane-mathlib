import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure HeisenbergDoublePackage (H : Type u) [CategoricalGroup H] where
  underlyingCategory : Type v
  monoidalStructure : MonoidalCategory underlyingCategory
  doubleConstruction : underlyingCategory ⥤ underlyingCategory
  pentagonCoherence : Prop
  triangleCoherence : Prop
  pentagonCoherenceClosed : pentagonCoherence
  triangleCoherenceClosed : triangleCoherence

structure HeisenbergDoubleEvidence {H : Type u} [CategoricalGroup H] (D : HeisenbergDoublePackage H) where
  pentagonCoherenceClosed : D.pentagonCoherence
  triangleCoherenceClosed : D.triangleCoherence

def HeisenbergDoubleClosed {H : Type u} [CategoricalGroup H] (D : HeisenbergDoublePackage H) : Prop :=
  D.pentagonCoherence ∧ D.triangleCoherence

theorem heisenberg_double_closed_from_evidence {H : Type u} [CategoricalGroup H] (D : HeisenbergDoublePackage H) (E : HeisenbergDoubleEvidence D) : HeisenbergDoubleClosed D := by
  exact And.intro E.pentagonCoherenceClosed E.triangleCoherenceClosed

end CategorificationCanonicalLaneLean
end HautevilleHouse