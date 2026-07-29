import CategorificationCanonicalLaneLean.CategorificationObjects

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure AdmissibleClass where
  object : AdmittedCategoryObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.category.isClosedSymmetricMonoidal ∧ A.object.hasFiniteLimits ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CategorificationCanonicalLaneLean
end HautevilleHouse
