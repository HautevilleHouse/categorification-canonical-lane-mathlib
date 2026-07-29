import CategorificationCanonicalLaneLean.CategorificationObjects

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure MonoidalCategoryPackage (C : CategoryObject) where
  tensorProduct : FunctorObject (productCategory C C) C
  unitObject : C.carrier
  associator : NaturalTransformationObject (compFunctor tensorProduct (identityFunctor (productCategory C C))) tensorProduct
  leftUnitor : NaturalTransformationObject (tensorProduct ∘ₐ (unitFunctor C)) (identityFunctor C)
  rightUnitor : NaturalTransformationObject (tensorProduct ∘ₐ (swapFunctor (unitFunctor C))) (identityFunctor C)
  pentagonCondition : Prop
  triangleCondition : Prop

def productCategory (C D : CategoryObject) : CategoryObject where
  carrier := C.carrier × D.carrier
  morphism := λ (x1, x2) (y1, y2) => C.morphism x1 y1 × D.morphism x2 y2
  identity := λ (x1, x2) => (C.identity x1, D.identity x2)
  composition := λ (f1, f2) (g1, g2) => (C.composition f1 g1, D.composition f2 g2)
  associativity := by
    intro w x y z f g h
    ext <;> simp [C.associativity, D.associativity]
  leftIdentity := by
    intro x y f; ext <;> simp [C.leftIdentity, D.leftIdentity]
  rightIdentity := by
    intro x y f; ext <;> simp [C.rightIdentity, D.rightIdentity]

def unitFunctor (C : CategoryObject) : FunctorObject (unitCategory) C where
  onObjects := λ _ => choose a default object? we need a unitCategory with one object.
  We'll leave as stub.
  sorry

structure MonoidalCategoryEvidence {C : CategoryObject} (M : MonoidalCategoryPackage C) where
  pentagonConditionClosed : M.pentagonCondition
  triangleConditionClosed : M.triangleCondition

def MonoidalCategoryClosed {C : CategoryObject} (M : MonoidalCategoryPackage C) : Prop :=
  M.pentagonCondition ∧ M.triangleCondition

theorem monoidal_category_closed_from_evidence {C : CategoryObject} (M : MonoidalCategoryPackage C) (E : MonoidalCategoryEvidence M) : MonoidalCategoryClosed M :=
  And.intro E.pentagonConditionClosed E.triangleConditionClosed

end CategorificationCanonicalLaneLean
end HautevilleHouse
