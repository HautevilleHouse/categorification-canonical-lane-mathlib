import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure CategoryPackage where
  objects : Type u
  morphisms : Type v
  identity : (x : objects) -> morphisms
  composition : {x y z : objects} -> morphisms -> morphisms -> morphisms
  associativity : Prop
  leftIdentity : Prop
  rightIdentity : Prop

structure CategoryEvidence (C : CategoryPackage) where
  associativityClosed : C.associativity
  leftIdentityClosed : C.leftIdentity
  rightIdentityClosed : C.rightIdentity

def CategoryClosed (C : CategoryPackage) : Prop :=
  C.associativity ∧ C.leftIdentity ∧ C.rightIdentity

theorem category_closed_from_evidence (C : CategoryPackage) (E : CategoryEvidence C) :
    CategoryClosed C := by
  exact And.intro E.associativityClosed (And.intro E.leftIdentityClosed E.rightIdentityClosed)

end CategorificationCanonicalLaneLean
end HautevilleHouse