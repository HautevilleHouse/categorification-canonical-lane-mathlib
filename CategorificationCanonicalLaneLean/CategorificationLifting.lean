import HautevilleHouse.CategorificationCanonicalLaneLean.CategorificationStructures

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure LiftingPackage (P : CategorificationPackage) where
  liftExists : Prop
  liftUnique : Prop
  liftCompositional : Prop
  liftPreservesColimits : Prop

structure LiftingEvidence (P : CategorificationPackage) (L : LiftingPackage P) where
  liftExistsClosed : L.liftExists
  liftUniqueClosed : L.liftUnique
  liftCompositionalClosed : L.liftCompositional
  liftPreservesColimitsClosed : L.liftPreservesColimits

def LiftingClosed (P : CategorificationPackage) (L : LiftingPackage P) : Prop :=
  L.liftExists ∧ L.liftUnique ∧ L.liftCompositional ∧ L.liftPreservesColimits

theorem lifting_closed_from_evidence (P : CategorificationPackage) (L : LiftingPackage P)
    (E : LiftingEvidence P L) : LiftingClosed P L := by
  exact And.intro E.liftExistsClosed
    (And.intro E.liftUniqueClosed
      (And.intro E.liftCompositionalClosed E.liftPreservesColimitsClosed))

end CategorificationCanonicalLaneLean
end HautevilleHouse