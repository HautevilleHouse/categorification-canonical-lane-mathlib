import CategorificationCanonicalLaneLean.CategorificationAdmissibleClass

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.hasFiniteLimits ∧ A.object.category.isClosedSymmetricMonoidal

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.conclusion

end CategorificationCanonicalLaneLean
end HautevilleHouse
