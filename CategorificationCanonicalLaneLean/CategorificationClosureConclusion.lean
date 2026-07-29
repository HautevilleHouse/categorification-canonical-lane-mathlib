import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategorificationCanonicalLaneLean.CategorificationHigherStructures
import HautevilleHouse.CategorificationCanonicalLaneLean.CategorificationInvariantModels

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

def CategorificationAdmissibleClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem categorification_endgame (A : AdmissibleClass) : CategorificationAdmissibleClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategorificationCanonicalLaneLean
end HautevilleHouse