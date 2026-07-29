import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure FunctorPackage (C D : MorphismCategoryPackage) where
  objectMap : C.sourceObject → D.sourceObject
  morphismMap : C.morphisms → D.morphisms
  preservesIdentity : Prop
  preservesComposition : Prop

structure FunctorEvidence {C D : MorphismCategoryPackage} (F : FunctorPackage C D) where
  preservesIdentityClosed : F.preservesIdentity
  preservesCompositionClosed : F.preservesComposition

def FunctorClosed {C D : MorphismCategoryPackage} (F : FunctorPackage C D) : Prop :=
  F.preservesIdentity ∧ F.preservesComposition

theorem functor_closed_from_evidence {C D : MorphismCategoryPackage}
    (F : FunctorPackage C D) (E : FunctorEvidence F) : FunctorClosed F := by
  exact And.intro E.preservesIdentityClosed E.preservesCompositionClosed

end CategorificationCanonicalLaneLean
end HautevilleHouse