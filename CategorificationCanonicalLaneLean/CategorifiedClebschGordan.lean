import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

open TensorProduct

structure CategorifiedClebschGordanPackage (U : Type u) [CategoricalGroup U] where
  irreducibleReps : Type v
  tensorProductDecomposition : irreducibleReps → irreducibleReps → List (irreducibleReps × ℕ)
  multiplicitiesConsistent : Prop
  intertwinersConstructed : Prop
  multiplicitiesConsistentClosed : multiplicitiesConsistent
  intertwinersConstructedClosed : intertwinersConstructed

structure CategorifiedClebschGordanEvidence {U : Type u} [CategoricalGroup U] (C : CategorifiedClebschGordanPackage U) where
  multiplicitiesConsistentClosed : C.multiplicitiesConsistent
  intertwinersConstructedClosed : C.intertwinersConstructed

def CategorifiedClebschGordanClosed {U : Type u} [CategoricalGroup U] (C : CategorifiedClebschGordanPackage U) : Prop :=
  C.multiplicitiesConsistent ∧ C.intertwinersConstructed

theorem categorified_clebsch_gordan_closed_from_evidence {U : Type u} [CategoricalGroup U] (C : CategorifiedClebschGordanPackage U) (E : CategorifiedClebschGordanEvidence C) : CategorifiedClebschGordanClosed C := by
  exact And.intro E.multiplicitiesConsistentClosed E.intertwinersConstructedClosed

end CategorificationCanonicalLaneLean
end HautevilleHouse