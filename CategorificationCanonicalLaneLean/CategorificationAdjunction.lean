import CategorificationCanonicalLaneLean.CategorificationObjects

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure AdjunctionPackage {C D : CategoryObject} (F : FunctorObject C D) (G : FunctorObject D C) where
  unit : NaturalTransformationObject (identityFunctor C) (compFunctor G F)
  counit : NaturalTransformationObject (compFunctor F G) (identityFunctor D)
  triangleLeft : ∀ (c : C.carrier), compMorphism (F.onMorphisms (unit.components c)) (counit.components (F.onObjects c)) = D.identity (F.onObjects c)
  triangleRight : ∀ (d : D.carrier), compMorphism (unit.components (G.onObjects d)) (G.onMorphisms (counit.components d)) = C.identity (G.onObjects d)

structure AdjunctionEvidence {C D : CategoryObject} {F : FunctorObject C D} {G : FunctorObject D C} (A : AdjunctionPackage F G) where
  triangleLeftClosed : A.triangleLeft
  triangleRightClosed : A.triangleRight

def AdjunctionClosed {C D : CategoryObject} {F : FunctorObject C D} {G : FunctorObject D C} (A : AdjunctionPackage F G) : Prop :=
  A.triangleLeft ∧ A.triangleRight

theorem adjunction_closed_from_evidence {C D : CategoryObject} {F : FunctorObject C D} {G : FunctorObject D C} (A : AdjunctionPackage F G) (E : AdjunctionEvidence A) : AdjunctionClosed A :=
  And.intro E.triangleLeftClosed E.triangleRightClosed

end CategorificationCanonicalLaneLean
end HautevilleHouse
