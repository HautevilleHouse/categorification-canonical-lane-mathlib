import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

structure KhovanovHomologyPackage where
  link : Type u
  chainComplex : Type v
  homology : Type w
  wellDefinedness : Prop
  functoriality : Prop
  linkInvariance : Prop

structure KhovanovHomologyEvidence (K : KhovanovHomologyPackage) where
  wellDefinednessClosed : K.wellDefinedness
  functorialityClosed : K.functoriality
  linkInvarianceClosed : K.linkInvariance

def KhovanovHomologyClosed (K : KhovanovHomologyPackage) : Prop :=
  K.wellDefinedness ∧ K.functoriality ∧ K.linkInvariance

theorem khovanov_homology_closed_from_evidence (K : KhovanovHomologyPackage) (E : KhovanovHomologyEvidence K) : KhovanovHomologyClosed K := by
  exact And.intro E.wellDefinednessClosed (And.intro E.functorialityClosed E.linkInvarianceClosed)

structure CategorifiedQuantumGroupPackage where
  quantumGroup : Type u
  categorification : Type v
  representationCategory : Type w
  categorificationAxioms : Prop
  equivalenceWithClassical : Prop

structure CategorifiedQuantumGroupEvidence (C : CategorifiedQuantumGroupPackage) where
  categorificationAxiomsClosed : C.categorificationAxioms
  equivalenceWithClassicalClosed : C.equivalenceWithClassical

def CategorifiedQuantumGroupClosed (C : CategorifiedQuantumGroupPackage) : Prop :=
  C.categorificationAxioms ∧ C.equivalenceWithClassical

theorem categorified_quantum_group_closed_from_evidence (C : CategorifiedQuantumGroupPackage) (E : CategorifiedQuantumGroupEvidence C) : CategorifiedQuantumGroupClosed C := by
  exact And.intro E.categorificationAxiomsClosed E.equivalenceWithClassicalClosed

end CategorificationCanonicalLaneLean
end HautevilleHouse