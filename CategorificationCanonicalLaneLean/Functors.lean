import canonicalLaneMathlib.AdmissibleClass
import CategorificationCanonicalLaneLean.Categories

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure FunctorPackage (C D : CategoryPackage) where
  mapObjects : C.objects -> D.objects
  mapMorphisms : {x y : C.objects} -> C.morphisms -> D.morphisms
  preservesIdentity : Prop
  preservesComposition : Prop

structure FunctorEvidence {C D : CategoryPackage} (F : FunctorPackage C D) where
  preservesIdentityClosed : F.preservesIdentity
  preservesCompositionClosed : F.preservesComposition

def FunctorClosed {C D : CategoryPackage} (F : FunctorPackage C D) : Prop :=
  F.preservesIdentity ∧ F.preservesComposition

theorem functor_closed_from_evidence {C D : CategoryPackage} (F : FunctorPackage C D)
    (E : FunctorEvidence F) : FunctorClosed F := by
  exact And.intro E.preservesIdentityClosed E.preservesCompositionClosed

end CategorificationCanonicalLaneLean
end HautevilleHouse