import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure QuantumGroupCategorificationPackage (U : Type u) [QuantumGroup U] where
  categorifyingCategory : Type v
  monoidalStructure : MonoidalCategory categorifyingCategory
  representationFunctor : categorifyingCategory ⟶ ModuleCat ℝ
  quantumGroupAction : Prop
  braidingCompatibility : Prop
  quantumGroupActionClosed : quantumGroupAction
  braidingCompatibilityClosed : braidingCompatibility

structure QuantumGroupCategorificationEvidence {U : Type u} [QuantumGroup U] (Q : QuantumGroupCategorificationPackage U) where
  quantumGroupActionClosed : Q.quantumGroupAction
  braidingCompatibilityClosed : Q.braidingCompatibility

def QuantumGroupCategorificationClosed {U : Type u} [QuantumGroup U] (Q : QuantumGroupCategorificationPackage U) : Prop :=
  Q.quantumGroupAction ∧ Q.braidingCompatibility

theorem quantum_group_categorification_closed_from_evidence {U : Type u} [QuantumGroup U] (Q : QuantumGroupCategorificationPackage U) (E : QuantumGroupCategorificationEvidence Q) : QuantumGroupCategorificationClosed Q := by
  exact And.intro E.quantumGroupActionClosed E.braidingCompatibilityClosed

end CategorificationCanonicalLaneLean
end HautevilleHouse