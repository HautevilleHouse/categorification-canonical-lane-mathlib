import canonicalLaneMathlib.AdmissibleClass
import CategorificationCanonicalLaneLean.MonoidalCategories

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure EnrichedCategoryPackage (V : MonoidalCategoryPackage) where
  objects : Type u
  homObjects : objects -> objects -> V.objects
  identityMorphism : (x : objects) -> V.category.morphisms
  compositionMorphism : {x y z : objects} -> V.category.morphisms
  associativityEnriched : Prop
  identityLeftEnriched : Prop
  identityRightEnriched : Prop

structure EnrichedCategoryEvidence {V : MonoidalCategoryPackage} (E : EnrichedCategoryPackage V) where
  associativityEnrichedClosed : E.associativityEnriched
  identityLeftEnrichedClosed : E.identityLeftEnriched
  identityRightEnrichedClosed : E.identityRightEnriched

def EnrichedCategoryClosed {V : MonoidalCategoryPackage} (E : EnrichedCategoryPackage V) : Prop :=
  E.associativityEnriched ∧ E.identityLeftEnriched ∧ E.identityRightEnriched

theorem enriched_category_closed_from_evidence {V : MonoidalCategoryPackage}
    (E : EnrichedCategoryPackage V) (Ev : EnrichedCategoryEvidence E) : EnrichedCategoryClosed E := by
  exact And.intro Ev.associativityEnrichedClosed
    (And.intro Ev.identityLeftEnrichedClosed Ev.identityRightEnrichedClosed)

end CategorificationCanonicalLaneLean
end HautevilleHouse