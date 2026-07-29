import canonicalLaneMathlib.AdmissibleClass
import CategorificationCanonicalLaneLean.Functors

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure KanExtensionPackage {A B C : CategoryPackage} (F : FunctorPackage A C) (G : FunctorPackage A B) where
  extensionFunctor : FunctorPackage B C
  naturalTransformation : Prop
  universality : Prop

structure KanExtensionEvidence {A B C : CategoryPackage} {F : FunctorPackage A C} {G : FunctorPackage A B}
    (K : KanExtensionPackage F G) where
  naturalTransformationClosed : K.naturalTransformation
  universalityClosed : K.universality

def KanExtensionClosed {A B C : CategoryPackage} {F : FunctorPackage A C} {G : FunctorPackage A B}
    (K : KanExtensionPackage F G) : Prop :=
  K.naturalTransformation ∧ K.universality

theorem kan_extension_closed_from_evidence {A B C : CategoryPackage} {F : FunctorPackage A C} {G : FunctorPackage A B}
    (K : KanExtensionPackage F G) (E : KanExtensionEvidence K) : KanExtensionClosed K := by
  exact And.intro E.naturalTransformationClosed E.universalityClosed

end CategorificationCanonicalLaneLean
end HautevilleHouse