import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure GrothendieckConstructionPackage (F : FibrationPackage) where
  indexedCategory : Type
  pseudoFunctor : F.baseCategory → Type
  categoryOfElements : Prop
  projectionMorphism : Prop
  equivalenceToOriginal : Prop
  constructionComplete : Prop

structure GrothendieckConstructionEvidence {F : FibrationPackage}
    (G : GrothendieckConstructionPackage F) where
  indexedCategoryClosed : G.indexedCategory
  pseudoFunctorClosed : G.pseudoFunctor
  categoryOfElementsClosed : G.categoryOfElements
  projectionMorphismClosed : G.projectionMorphism
  equivalenceToOriginalClosed : G.equivalenceToOriginal
  constructionCompleteClosed : G.constructionComplete

def GrothendieckConstructionClosed {F : FibrationPackage}
    (G : GrothendieckConstructionPackage F) : Prop :=
  G.indexedCategory ∧ G.pseudoFunctor ∧ G.categoryOfElements ∧
  G.projectionMorphism ∧ G.equivalenceToOriginal ∧ G.constructionComplete

theorem grothendieck_construction_closed_from_evidence
    {F : FibrationPackage} (G : GrothendieckConstructionPackage F)
    (E : GrothendieckConstructionEvidence G) : GrothendieckConstructionClosed G := by
  exact And.intro E.indexedCategoryClosed
    (And.intro E.pseudoFunctorClosed
      (And.intro E.categoryOfElementsClosed
        (And.intro E.projectionMorphismClosed
          (And.intro E.equivalenceToOriginalClosed E.constructionCompleteClosed))))

end CategorificationCanonicalLaneLean
end HautevilleHouse
