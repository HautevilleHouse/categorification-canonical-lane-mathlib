import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure BicategoryPackage where
  objects : Type u
  arrows : objects → objects → Type v
  twoCells : ∀ {a b : objects}, arrows a b → arrows a b → Type w
  compositionHorizontal : ∀ {a b c : objects}, arrows a b → arrows b c → arrows a c
  compositionVertical : ∀ {a b : objects} {f g h : arrows a b}, twoCells g h → twoCells f g → twoCells f h
  associativityCoherence : Prop
  unitCoherence : Prop
  exchangeLaw : Prop

structure BicategoryEvidence (B : BicategoryPackage) where
  associativityCoherenceClosed : B.associativityCoherence
  unitCoherenceClosed : B.unitCoherence
  exchangeLawClosed : B.exchangeLaw

def BicategoryClosed (B : BicategoryPackage) : Prop :=
  B.associativityCoherence ∧ B.unitCoherence ∧ B.exchangeLaw

theorem bicategory_closed_from_evidence (B : BicategoryPackage) (E : BicategoryEvidence B) : BicategoryClosed B := by
  exact And.intro E.associativityCoherenceClosed (And.intro E.unitCoherenceClosed E.exchangeLawClosed)

structure WeakEquivalencePackage where
  sourceBicategory : BicategoryPackage
  targetBicategory : BicategoryPackage
  functorObject : sourceBicategory.objects → targetBicategory.objects
  functorArrow : ∀ {a b : sourceBicategory.objects}, sourceBicategory.arrows a b → targetBicategory.arrows (functorObject a) (functorObject b)
  functorTwoCell : ∀ {a b : sourceBicategory.objects} {f g : sourceBicategory.arrows a b}, sourceBicategory.twoCells f g → targetBicategory.twoCells (functorArrow f) (functorArrow g)
  weakEquivalenceCondition : Prop

structure WeakEquivalenceEvidence (W : WeakEquivalencePackage) where
  weakEquivalenceConditionClosed : W.weakEquivalenceCondition

def WeakEquivalenceClosed (W : WeakEquivalencePackage) : Prop :=
  W.weakEquivalenceCondition

theorem weak_equivalence_closed_from_evidence (W : WeakEquivalencePackage) (E : WeakEquivalenceEvidence W) : WeakEquivalenceClosed W := by
  exact E.weakEquivalenceConditionClosed

end CategorificationCanonicalLaneLean
end HautevilleHouse