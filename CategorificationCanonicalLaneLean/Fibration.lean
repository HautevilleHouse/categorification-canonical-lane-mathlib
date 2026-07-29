import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure FibrationPackage where
  baseCategory : Type
  fiberCategory : Type
  totalCategory : Type
  projectionFunctor : Prop
  liftingProperty : Prop
  cartesianMorphisms : Prop
  cleavages : Prop
  fibrationAxioms : Prop

structure FibrationEvidence (F : FibrationPackage) where
  projectionFunctorClosed : F.projectionFunctor
  liftingPropertyClosed : F.liftingProperty
  cartesianMorphismsClosed : F.cartesianMorphisms
  cleavagesClosed : F.cleavages
  fibrationAxiomsClosed : F.fibrationAxioms

def FibrationClosed (F : FibrationPackage) : Prop :=
  F.projectionFunctor ∧ F.liftingProperty ∧ F.cartesianMorphisms ∧
  F.cleavages ∧ F.fibrationAxioms

theorem fibration_closed_from_evidence (F : FibrationPackage)
    (E : FibrationEvidence F) : FibrationClosed F := by
  exact And.intro E.projectionFunctorClosed
    (And.intro E.liftingPropertyClosed
      (And.intro E.cartesianMorphismsClosed
        (And.intro E.cleavagesClosed E.fibrationAxiomsClosed)))

end CategorificationCanonicalLaneLean
end HautevilleHouse
