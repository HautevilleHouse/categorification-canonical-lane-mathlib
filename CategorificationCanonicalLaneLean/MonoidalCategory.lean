import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure MonoidalCategoryPackage where
  objectSet : Type
  morphismSet : Type
  tensorProduct : objectSet → objectSet → objectSet
  associator : Prop
  leftUnitor : Prop
  rightUnitor : Prop
  pentagonEquation : Prop
  triangleEquation : Prop

structure MonoidalCategoryEvidence (M : MonoidalCategoryPackage) where
  associatorClosed : M.associator
  leftUnitorClosed : M.leftUnitor
  rightUnitorClosed : M.rightUnitor
  pentagonEquationClosed : M.pentagonEquation
  triangleEquationClosed : M.triangleEquation

def MonoidalCategoryClosed (M : MonoidalCategoryPackage) : Prop :=
  M.associator ∧ M.leftUnitor ∧ M.rightUnitor ∧ M.pentagonEquation ∧ M.triangleEquation

theorem monoidal_category_closed_from_evidence (M : MonoidalCategoryPackage)
    (E : MonoidalCategoryEvidence M) : MonoidalCategoryClosed M := by
  exact And.intro E.associatorClosed
    (And.intro E.leftUnitorClosed
      (And.intro E.rightUnitorClosed
        (And.intro E.pentagonEquationClosed E.triangleEquationClosed)))

end CategorificationCanonicalLaneLean
end HautevilleHouse
