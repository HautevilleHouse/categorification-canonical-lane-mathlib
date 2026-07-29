import canonicalLaneMathlib.AdmissibleClass
import CategorificationCanonicalLaneLean.Categories

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure MonoidalCategoryPackage (C : CategoryPackage) where
  tensorProduct : C.objects -> C.objects -> C.objects
  unitObject : C.objects
  associator : Prop
  leftUnitor : Prop
  rightUnitor : Prop
  pentagonIdentity : Prop
  triangleIdentity : Prop

structure MonoidalCategoryEvidence {C : CategoryPackage} (M : MonoidalCategoryPackage C) where
  associatorClosed : M.associator
  leftUnitorClosed : M.leftUnitor
  rightUnitorClosed : M.rightUnitor
  pentagonIdentityClosed : M.pentagonIdentity
  triangleIdentityClosed : M.triangleIdentity

def MonoidalCategoryClosed {C : CategoryPackage} (M : MonoidalCategoryPackage C) : Prop :=
  M.associator ∧ M.leftUnitor ∧ M.rightUnitor ∧ M.pentagonIdentity ∧ M.triangleIdentity

theorem monoidal_category_closed_from_evidence {C : CategoryPackage} (M : MonoidalCategoryPackage C)
    (E : MonoidalCategoryEvidence M) : MonoidalCategoryClosed M := by
  exact And.intro E.associatorClosed
    (And.intro E.leftUnitorClosed
      (And.intro E.rightUnitorClosed
        (And.intro E.pentagonIdentityClosed E.triangleIdentityClosed)))

end CategorificationCanonicalLaneLean
end HautevilleHouse