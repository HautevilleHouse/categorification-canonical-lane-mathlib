import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure CategorifiedInverseScatteringPackage (M : Type u) [CategoricalManifold M] where
  scatteringData : Type v
  inverseScatteringTransform : scateringData → M
  categorifiedQuantumGroup : Type w
  quantumGroupInvariant : Prop
  spectralCurve : Prop
  quantumGroupInvariantClosed : quantumGroupInvariant
  spectralCurveClosed : spectralCurve

structure CategorifiedInverseScatteringEvidence {M : Type u} [CategoricalManifold M] (S : CategorifiedInverseScatteringPackage M) where
  quantumGroupInvariantClosed : S.quantumGroupInvariant
  spectralCurveClosed : S.spectralCurve

def CategorifiedInverseScatteringClosed {M : Type u} [CategoricalManifold M] (S : CategorifiedInverseScatteringPackage M) : Prop :=
  S.quantumGroupInvariant ∧ S.spectralCurve

theorem categorified_inverse_scattering_closed_from_evidence {M : Type u} [CategoricalManifold M] (S : CategorifiedInverseScatteringPackage M) (E : CategorifiedInverseScatteringEvidence S) : CategorifiedInverseScatteringClosed S := by
  exact And.intro E.quantumGroupInvariantClosed E.spectralCurveClosed

end CategorificationCanonicalLaneLean
end HautevilleHouse