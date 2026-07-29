import canonicalLaneMathlib.AdmissibleClass
import CategorificationCanonicalLaneLean.Categories

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure BicategoryPackage where
  objects : Type u
  morphisms : objects -> objects -> CategoryPackage
  identityMorphism : (x : objects) -> (morphisms x x).objects
  compositionMorphism : {x y z : objects} -> (morphisms y z).objects -> (morphisms x y).objects -> (morphisms x z).objects
  associator : Prop
  leftUnitor : Prop
  rightUnitor : Prop
  pentagonIdentity : Prop
  triangleIdentity : Prop

structure BicategoryEvidence (B : BicategoryPackage) where
  associatorClosed : B.associator
  leftUnitorClosed : B.leftUnitor
  rightUnitorClosed : B.rightUnitor
  pentagonIdentityClosed : B.pentagonIdentity
  triangleIdentityClosed : B.triangleIdentity

def BicategoryClosed (B : BicategoryPackage) : Prop :=
  B.associator ∧ B.leftUnitor ∧ B.rightUnitor ∧ B.pentagonIdentity ∧ B.triangleIdentity

theorem bicategory_closed_from_evidence (B : BicategoryPackage) (E : BicategoryEvidence B) :
    BicategoryClosed B := by
  exact And.intro E.associatorClosed
    (And.intro E.leftUnitorClosed
      (And.intro E.rightUnitorClosed
        (And.intro E.pentagonIdentityClosed E.triangleIdentityClosed)))

end CategorificationCanonicalLaneLean
end HautevilleHouse