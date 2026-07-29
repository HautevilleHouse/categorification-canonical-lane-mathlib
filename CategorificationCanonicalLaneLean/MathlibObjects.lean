import CategorificationCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure CategorificationSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure CategorificationAdmittedObject where
  space : CategorificationSpace
  categoricalStructure : Prop
  coherenceConditions : Prop
  modelCategory : Type
  modelTopology : TopologicalSpace modelCategory
  equivalencesToModel : Prop
  conclusion : equivalencesToModel

structure CategorificationEndgameState where
  object : CategorificationAdmittedObject

def CategorificationWitnessClosed (O : CategorificationAdmittedObject) : Prop :=
  O.equivalencesToModel

end CategorificationCanonicalLaneLean
end HautevilleHouse