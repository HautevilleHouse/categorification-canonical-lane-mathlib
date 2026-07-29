import CategorificationCanonicalLaneLean.CategorificationGateLemmas

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

def ConstrainedCategorificationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_categorification_endgame (A : AdmissibleClass) : ConstrainedCategorificationClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategorificationCanonicalLaneLean
end HautevilleHouse
