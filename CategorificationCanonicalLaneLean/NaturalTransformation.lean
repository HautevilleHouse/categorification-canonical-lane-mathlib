import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure NaturalTransformationPackage {C D : MorphismCategoryPackage}
    (F G : FunctorPackage C D) where
  componentMap : ∀ (x : C.sourceObject), D.morphisms
  naturalityCondition : Prop

structure NaturalTransformationEvidence {C D : MorphismCategoryPackage}
    {F G : FunctorPackage C D} (N : NaturalTransformationPackage F G) where
  naturalityConditionClosed : N.naturalityCondition

def NaturalTransformationClosed {C D : MorphismCategoryPackage}
    {F G : FunctorPackage C D} (N : NaturalTransformationPackage F G) : Prop :=
  N.naturalityCondition

theorem natural_transformation_closed_from_evidence {C D : MorphismCategoryPackage}
    {F G : FunctorPackage C D} (N : NaturalTransformationPackage F G)
    (E : NaturalTransformationEvidence N) : NaturalTransformationClosed N := by
  exact E.naturalityConditionClosed

end CategorificationCanonicalLaneLean
end HautevilleHouse