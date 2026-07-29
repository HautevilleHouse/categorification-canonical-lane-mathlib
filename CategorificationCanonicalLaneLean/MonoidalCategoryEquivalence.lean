import CategorificationCanonicalLaneLean.AdjointFunctorBridge

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure MonoidalCategoryEquivalence (C D : Type) [MonoidalCategory C] [MonoidalCategory D] where
  tensorPreservingFunctor : C → D
  coherenceNaturalIsomorphism : Prop
  coherenceNaturalIsomorphismTerm : coherenceNaturalIsomorphism
  unitIsomorphism : Prop
  unitIsomorphismTerm : unitIsomorphism

def MonoidalCategoryEquivalenceClosed {C D : Type} [MonoidalCategory C] [MonoidalCategory D] (E : MonoidalCategoryEquivalence C D) : Prop :=
  E.coherenceNaturalIsomorphism ∧ E.unitIsomorphism

theorem monoidal_category_equivalence_closed (C D : Type) [MonoidalCategory C] [MonoidalCategory D] (E : MonoidalCategoryEquivalence C D) :
    MonoidalCategoryEquivalenceClosed E := by
  exact And.intro E.coherenceNaturalIsomorphismTerm E.unitIsomorphismTerm

end CategorificationCanonicalLaneLean
end HautevilleHouse