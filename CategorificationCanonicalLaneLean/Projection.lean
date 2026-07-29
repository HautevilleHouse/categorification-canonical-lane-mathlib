import CategorificationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def categorificationProjection : Projection CategorificationEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem categorification_projection_idempotent (x : CategorificationEndgameState) :
    categorificationProjection.toFun (categorificationProjection.toFun x) = categorificationProjection.toFun x := by
  exact categorificationProjection.idempotent x

end CategorificationCanonicalLaneLean
end HautevilleHouse