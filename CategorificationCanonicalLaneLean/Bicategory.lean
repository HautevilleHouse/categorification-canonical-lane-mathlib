import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure BicategoryPackage (M : MonoidalCategoryPackage) where
  objects : Type
  oneMorphisms : objects → objects → Type
  twoMorphisms : ∀ {a b : objects}, (f g : oneMorphisms a b) → Type
  verticalComposition : Prop
  horizontalComposition : Prop
  associatorTwo : Prop
  leftUnitorTwo : Prop
  rightUnitorTwo : Prop
  pentagonEquationTwo : Prop
  triangleEquationTwo : Prop
  coherenceConditions : Prop

structure BicategoryEvidence {M : MonoidalCategoryPackage} (B : BicategoryPackage M) where
  verticalCompositionClosed : B.verticalComposition
  horizontalCompositionClosed : B.horizontalComposition
  associatorTwoClosed : B.associatorTwo
  leftUnitorTwoClosed : B.leftUnitorTwo
  rightUnitorTwoClosed : B.rightUnitorTwo
  pentagonEquationTwoClosed : B.pentagonEquationTwo
  triangleEquationTwoClosed : B.triangleEquationTwo
  coherenceConditionsClosed : B.coherenceConditions

def BicategoryClosed {M : MonoidalCategoryPackage} (B : BicategoryPackage M) : Prop :=
  B.verticalComposition ∧ B.horizontalComposition ∧ B.associatorTwo ∧
  B.leftUnitorTwo ∧ B.rightUnitorTwo ∧ B.pentagonEquationTwo ∧
  B.triangleEquationTwo ∧ B.coherenceConditions

theorem bicategory_closed_from_evidence {M : MonoidalCategoryPackage}
    (B : BicategoryPackage M) (E : BicategoryEvidence B) : BicategoryClosed B := by
  exact And.intro E.verticalCompositionClosed
    (And.intro E.horizontalCompositionClosed
      (And.intro E.associatorTwoClosed
        (And.intro E.leftUnitorTwoClosed
          (And.intro E.rightUnitorTwoClosed
            (And.intro E.pentagonEquationTwoClosed
              (And.intro E.triangleEquationTwoClosed E.coherenceConditionsClosed))))))

end CategorificationCanonicalLaneLean
end HautevilleHouse
