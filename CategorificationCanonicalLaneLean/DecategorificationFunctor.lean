import CategorificationCanonicalLaneLean.CategorificationObjects

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure DecategorificationFunctor where
  sourceCategory : Type u
  targetSet : Type v
  functorMap : sourceCategory → targetSet
  respectsStructure : Prop
  witnessesInvariant : Prop

structure DecategorificationEvidence (F : DecategorificationFunctor) where
  respectsStructureClosed : F.respectsStructure
  witnessesInvariantClosed : F.witnessesInvariant

def DecategorificationClosed (F : DecategorificationFunctor) : Prop :=
  F.respectsStructure ∧ F.witnessesInvariant

theorem decategorification_closed_from_evidence (F : DecategorificationFunctor)
    (E : DecategorificationEvidence F) : DecategorificationClosed F := by
  exact And.intro E.respectsStructureClosed E.witnessesInvariantClosed

end CategorificationCanonicalLaneLean
end HautevilleHouse