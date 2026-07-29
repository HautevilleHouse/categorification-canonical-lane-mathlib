import CategorificationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure AdjointFunctorPair (A B : Type) [Category A] [Category B] where
  leftAdjoint : A → B
  rightAdjoint : B → A
  adjunctionUnit : ∀ (x : A), x → rightAdjoint (leftAdjoint x)
  adjunctionCounit : ∀ (y : B), leftAdjoint (rightAdjoint y) → y
  triangleIdentities : Prop
  triangleIdentitiesTerm : triangleIdentities

def AdjointFunctorClosed {A B : Type} [Category A] [Category B] (F : AdjointFunctorPair A B) : Prop :=
  F.triangleIdentities

theorem adjoint_functor_bridge (A B : Type) [Category A] [Category B] (F : AdjointFunctorPair A B) :
    AdjointFunctorClosed F := by
  exact F.triangleIdentitiesTerm

end CategorificationCanonicalLaneLean
end HautevilleHouse