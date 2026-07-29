import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure AdjointPackage (C D : MorphismCategoryPackage)
    (F : FunctorPackage C D) (G : FunctorPackage D C) where
  unitTransformation : NaturalTransformationPackage (functorId C) (G ∘ F)
  counitTransformation : NaturalTransformationPackage (F ∘ G) (functorId D)
  triangleIdentities : Prop

structure AdjunctionEvidence {C D : MorphismCategoryPackage}
    {F : FunctorPackage C D} {G : FunctorPackage D C}
    (Adj : AdjointPackage C D F G) where
  triangleIdentitiesClosed : Adj.triangleIdentities

def AdjunctionClosed {C D : MorphismCategoryPackage}
    {F : FunctorPackage C D} {G : FunctorPackage D C}
    (Adj : AdjointPackage C D F G) : Prop :=
  Adj.triangleIdentities

theorem adjunction_closed_from_evidence {C D : MorphismCategoryPackage}
    {F : FunctorPackage C D} {G : FunctorPackage D C}
    (Adj : AdjointPackage C D F G) (E : AdjunctionEvidence Adj) :
    AdjunctionClosed Adj := by
  exact E.triangleIdentitiesClosed

end CategorificationCanonicalLaneLean
end HautevilleHouse