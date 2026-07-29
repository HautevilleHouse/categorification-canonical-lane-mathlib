import HautevilleHouse.CategorificationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure CategorificationPackage where
  sourceObject : Type u
  targetCategory : Type u
  sourceStructure : Prop
  targetCategoryStructure : Prop
  functorLift : Type v
  liftRespectsStructure : Prop
  liftIsAdjoint : Prop

structure CategorificationEvidence (P : CategorificationPackage) where
  sourceStructureClosed : P.sourceStructure
  targetCategoryStructureClosed : P.targetCategoryStructure
  liftRespectsStructureClosed : P.liftRespectsStructure
  liftIsAdjointClosed : P.liftIsAdjoint

def CategorificationClosed (P : CategorificationPackage) : Prop :=
  P.sourceStructure ∧ P.targetCategoryStructure ∧ P.liftRespectsStructure ∧ P.liftIsAdjoint

theorem categorification_closed_from_evidence (P : CategorificationPackage)
    (E : CategorificationEvidence P) : CategorificationClosed P := by
  exact And.intro E.sourceStructureClosed
    (And.intro E.targetCategoryStructureClosed
      (And.intro E.liftRespectsStructureClosed E.liftIsAdjointClosed))

end CategorificationCanonicalLaneLean
end HautevilleHouse