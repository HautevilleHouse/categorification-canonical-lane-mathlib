import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure KanExtensionPackage where
  sourceCategory : Type
  targetCategory : Type
  functor : sourceCategory → targetCategory
  leftKanExtension : Prop
  rightKanExtension : Prop
  universalPropertyLeft : Prop
  universalPropertyRight : Prop
  pointwiseFormula : Prop

structure KanExtensionEvidence (K : KanExtensionPackage) where
  leftKanExtensionClosed : K.leftKanExtension
  rightKanExtensionClosed : K.rightKanExtension
  universalPropertyLeftClosed : K.universalPropertyLeft
  universalPropertyRightClosed : K.universalPropertyRight
  pointwiseFormulaClosed : K.pointwiseFormula

def KanExtensionClosed (K : KanExtensionPackage) : Prop :=
  K.leftKanExtension ∧ K.rightKanExtension ∧ K.universalPropertyLeft ∧
  K.universalPropertyRight ∧ K.pointwiseFormula

theorem kan_extension_closed_from_evidence (K : KanExtensionPackage)
    (E : KanExtensionEvidence K) : KanExtensionClosed K := by
  exact And.intro E.leftKanExtensionClosed
    (And.intro E.rightKanExtensionClosed
      (And.intro E.universalPropertyLeftClosed
        (And.intro E.universalPropertyRightClosed E.pointwiseFormulaClosed)))

end CategorificationCanonicalLaneLean
end HautevilleHouse
