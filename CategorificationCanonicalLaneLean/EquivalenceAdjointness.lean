import CategorificationCanonicalLaneLean.CategoryFundamentals

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure EquivalencePackage {C D : CategoryPackage} where
  functor : C.objects → D.objects
  inverse : D.objects → C.objects
  unit : ∀ X : C.objects, C.morphisms X (inverse (functor X))
  counit : ∀ Y : D.objects, D.morphisms (functor (inverse Y)) Y
  triangle1 : Prop
  triangle2 : Prop

structure EquivalenceEvidence {C D : CategoryPackage} (E : EquivalencePackage C D) where
  triangle1Closed : E.triangle1
  triangle2Closed : E.triangle2

def EquivalenceClosed {C D : CategoryPackage} (E : EquivalencePackage C D) : Prop :=
  E.triangle1 ∧ E.triangle2

theorem equivalence_closed_from_evidence {C D : CategoryPackage} (E : EquivalencePackage C D) (Ev : EquivalenceEvidence E) :
    EquivalenceClosed E := by
  exact And.intro Ev.triangle1Closed Ev.triangle2Closed

end CategorificationCanonicalLaneLean
end HautevilleHouse