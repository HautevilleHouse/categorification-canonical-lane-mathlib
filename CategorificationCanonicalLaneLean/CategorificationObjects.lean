import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure CategoryObject where
  carrier : Type u
  morphism : carrier → carrier → Type v
  identity : (x : carrier) → morphism x x
  composition : {x y z : carrier} → morphism x y → morphism y z → morphism x z
  associativity : ∀ {x y z w : carrier} (f : morphism x y) (g : morphism y z) (h : morphism z w),
    composition (composition f g) h = composition f (composition g h)
  leftIdentity : ∀ {x y : carrier} (f : morphism x y), composition (identity x) f = f
  rightIdentity : ∀ {x y : carrier} (f : morphism x y), composition f (identity y) = f

structure FunctorObject (C D : CategoryObject) where
  onObjects : C.carrier → D.carrier
  onMorphisms : {x y : C.carrier} → C.morphism x y → D.morphism (onObjects x) (onObjects y)
  preservesIdentity : ∀ (x : C.carrier), onMorphisms (C.identity x) = D.identity (onObjects x)
  preservesComposition : ∀ {x y z : C.carrier} (f : C.morphism x y) (g : C.morphism y z),
    onMorphisms (C.composition f g) = D.composition (onMorphisms f) (onMorphisms g)

structure NaturalTransformationObject {C D : CategoryObject} (F G : FunctorObject C D) where
  components : (x : C.carrier) → D.morphism (F.onObjects x) (G.onObjects x)
  naturality : ∀ {x y : C.carrier} (f : C.morphism x y),
    D.composition (F.onMorphisms f) (components y) = D.composition (components x) (G.onMorphisms f)

structure EquivalenceObject (C D : CategoryObject) where
  forward : FunctorObject C D
  backward : FunctorObject D C
  unit : NaturalTransformationObject (compFunctor backward forward) (identityFunctor C)
  counit : NaturalTransformationObject (compFunctor forward backward) (identityFunctor D)
  triangleLeft : ∀ (x : C.carrier), compMorphism (unit.components x) (forward.onMorphisms (counit.components (forward.onObjects x))) = D.identity (forward.onObjects x)
  triangleRight : ∀ (x : D.carrier), compMorphism (backward.onMorphisms (unit.components (backward.onObjects x))) (counit.components x) = C.identity (backward.onObjects x)

def identityFunctor (C : CategoryObject) : FunctorObject C C where
  onObjects := λ x => x
  onMorphisms := λ f => f
  preservesIdentity := λ _ => rfl
  preservesComposition := λ _ _ => rfl

def compFunctor {C D E : CategoryObject} (F : FunctorObject D E) (G : FunctorObject C D) : FunctorObject C E where
  onObjects := λ x => F.onObjects (G.onObjects x)
  onMorphisms := λ f => F.onMorphisms (G.onMorphisms f)
  preservesIdentity := λ x => by
    simp [G.preservesIdentity, F.preservesIdentity]
  preservesComposition := λ f g => by
    simp [G.preservesComposition, F.preservesComposition]

def compMorphism {C : CategoryObject} {x y z : C.carrier} (f : C.morphism x y) (g : C.morphism y z) : C.morphism x z :=
  C.composition f g

structure AdmittedCategoryObject where
  category : CategoryObject
  isClosedSymmetricMonoidal : Prop
  hasFiniteLimits : Prop
  conclusion : hasFiniteLimits ∧ isClosedSymmetricMonoidal

end CategorificationCanonicalLaneLean
end HautevilleHouse
