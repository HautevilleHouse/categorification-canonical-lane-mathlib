import CategorificationCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure AdmissibleClass where
  object : CategorificationAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CategorificationWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CategorificationCanonicalLaneLean
end HautevilleHouse