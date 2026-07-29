import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsPhylogeneticsCanonicalLaneLean

structure LinkageDisequilibriumPackage where
  haplotypeFrequencies : Prop
  linkageDisequilibriumCoefficient : Prop
  recombinationRate : Prop
  populationGeneticsModel : Prop

structure LinkageDisequilibriumEvidence (L : LinkageDisequilibriumPackage) where
  haplotypeFrequenciesClosed : L.haplotypeFrequencies
  linkageDisequilibriumCoefficientClosed : L.linkageDisequilibriumCoefficient
  recombinationRateClosed : L.recombinationRate
  populationGeneticsModelClosed : L.populationGeneticsModel

def LinkageDisequilibriumClosed (L : LinkageDisequilibriumPackage) : Prop :=
  L.haplotypeFrequencies ∧ L.linkageDisequilibriumCoefficient ∧
  L.recombinationRate ∧ L.populationGeneticsModel

theorem linkage_disequilibrium_closed_from_evidence
    (L : LinkageDisequilibriumPackage)
    (E : LinkageDisequilibriumEvidence L) : LinkageDisequilibriumClosed L := by
  exact And.intro E.haplotypeFrequenciesClosed
    (And.intro E.linkageDisequilibriumCoefficientClosed
      (And.intro E.recombinationRateClosed E.populationGeneticsModelClosed))

end GeneticsPhylogeneticsCanonicalLaneLean
end HautevilleHouse