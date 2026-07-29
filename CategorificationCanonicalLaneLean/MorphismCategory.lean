import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure MorphismCategoryPackage where
  sourceObject : Type
  targetObject : Type
  morphisms : Type
  identityMorphism : morphisms
  compositionLaw : morphisms → morphisms → morphisms
  associativityCondition : Prop
  identityCondition : Prop

structure MorphismCategoryEvidence (M : MorphismCategoryPackage) where
  associativityConditionClosed : M.associativityCondition
  identityConditionClosed : M.identityCondition

def MorphismCategoryClosed (M : MorphismCategoryPackage) : Prop :=
  M.associativityCondition ∧ M.identityCondition

theorem morphism_category_closed_from_evidence (M : MorphismCategoryPackage)
    (E : MorphismCategoryEvidence M) : MorphismCategoryClosed M := by
  exact And.intro E.associativityConditionClosed E.identityConditionClosed

end CategorificationCanonicalLaneLean
end HautevilleHouse