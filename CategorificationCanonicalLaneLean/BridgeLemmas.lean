import CategorificationCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace CategorificationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CategorificationWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CategorificationCanonicalLaneLean
end HautevilleHouse