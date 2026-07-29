import CategorificationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure EnrichedCategoryPackage (V : Type u) [MonoidalCategoryPackage V] where
  homObject : V → V → V
  composition : ∀ {X Y Z : V}, V.monoidalProduct (homObject Y Z) (homObject X Y) → homObject X Z
  identity : ∀ {X : V}, V.unitObject → homObject X X
  associativityCondition : Prop
  leftUnitCondition : Prop
  rightUnitCondition : Prop
  associativityConditionTerm : associativityCondition
  leftUnitConditionTerm : leftUnitCondition
  rightUnitConditionTerm : rightUnitCondition

structure EnrichedCategoryEvidence {V : Type u} [MonoidalCategoryPackage V]
    (E : EnrichedCategoryPackage V) where
  associativityClosed : E.associativityCondition
  leftUnitClosed : E.leftUnitCondition
  rightUnitClosed : E.rightUnitCondition

def EnrichedCategoryClosed {V : Type u} [MonoidalCategoryPackage V]
    (E : EnrichedCategoryPackage V) : Prop :=
  E.associativityCondition ∧ E.leftUnitCondition ∧ E.rightUnitCondition

theorem enriched_category_closed_from_evidence {V : Type u} [MonoidalCategoryPackage V]
    (E : EnrichedCategoryPackage V) (Ev : EnrichedCategoryEvidence E) :
    EnrichedCategoryClosed E := by
  exact And.intro Ev.associativityClosed (And.intro Ev.leftUnitClosed Ev.rightUnitClosed)

end CategorificationCanonicalLaneLean
end HautevilleHouse