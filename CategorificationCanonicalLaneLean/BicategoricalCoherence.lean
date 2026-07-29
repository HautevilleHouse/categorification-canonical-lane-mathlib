import CategorificationCanonicalLaneLean.MonoidalCategoryEquivalence

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure BicategoricalCoherence (B : Type) [Bicategory B] where
  associativityCoherence : Prop
  leftUnitorCoherence : Prop
  rightUnitorCoherence : Prop
  pentagonIdentity : Prop
  triangleIdentity : Prop
  associativityCoherenceTerm : associativityCoherence
  leftUnitorCoherenceTerm : leftUnitorCoherence
  rightUnitorCoherenceTerm : rightUnitorCoherence
  pentagonIdentityTerm : pentagonIdentity
  triangleIdentityTerm : triangleIdentity

def BicategoricalCoherenceClosed (B : Type) [Bicategory B] (C : BicategoricalCoherence B) : Prop :=
  C.associativityCoherence ∧ C.leftUnitorCoherence ∧ C.rightUnitorCoherence ∧
  C.pentagonIdentity ∧ C.triangleIdentity

theorem bicategorical_coherence_closed (B : Type) [Bicategory B] (C : BicategoricalCoherence B) :
    BicategoricalCoherenceClosed B C := by
  exact And.intro C.associativityCoherenceTerm
    (And.intro C.leftUnitorCoherenceTerm
      (And.intro C.rightUnitorCoherenceTerm
        (And.intro C.pentagonIdentityTerm C.triangleIdentityTerm)))

end CategorificationCanonicalLaneLean
end HautevilleHouse