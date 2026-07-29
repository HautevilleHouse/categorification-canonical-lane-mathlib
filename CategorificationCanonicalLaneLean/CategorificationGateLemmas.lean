import CategorificationCanonicalLaneLean.CategorificationBridgeLemmas

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

end CategorificationCanonicalLaneLean
end HautevilleHouse
