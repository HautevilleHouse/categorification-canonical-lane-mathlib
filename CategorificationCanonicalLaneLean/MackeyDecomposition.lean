import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure MackeyDecompositionPackage (G : Type u) [CategoricalGroup G] where
  subgroup : SubcategoricalEntity G
  representativeSet : Set G
  orbitDecomposition : Prop
  doubleCosetDecomposition : Prop
  orbitDecompositionClosed : orbitDecomposition
  doubleCosetDecompositionClosed : doubleCosetDecomposition

structure MackeyDecompositionEvidence {G : Type u} [CategoricalGroup G] (M : MackeyDecompositionPackage G) where
  orbitDecompositionClosed : M.orbitDecomposition
  doubleCosetDecompositionClosed : M.doubleCosetDecomposition

def MackeyDecompositionClosed {G : Type u} [CategoricalGroup G] (M : MackeyDecompositionPackage G) : Prop :=
  M.orbitDecomposition ∧ M.doubleCosetDecomposition

theorem mackey_decomposition_closed_from_evidence {G : Type u} [CategoricalGroup G] (M : MackeyDecompositionPackage G) (E : MackeyDecompositionEvidence M) : MackeyDecompositionClosed M := by
  exact And.intro E.orbitDecompositionClosed E.doubleCosetDecompositionClosed

end CategorificationCanonicalLaneLean
end HautevilleHouse