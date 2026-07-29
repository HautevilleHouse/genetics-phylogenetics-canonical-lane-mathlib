import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsPhylogeneticsCanonicalLaneLean

structure PopulationGeneticsPackage where
  alleleFrequencySpectrum : Prop
  effectivePopulationSize : Prop
  selectionCoefficient : Prop
  migrationModel : Prop

structure PopulationGeneticsEvidence (P : PopulationGeneticsPackage) where
  alleleFrequencySpectrumClosed : P.alleleFrequencySpectrum
  effectivePopulationSizeClosed : P.effectivePopulationSize
  selectionCoefficientClosed : P.selectionCoefficient
  migrationModelClosed : P.migrationModel

def PopulationGeneticsClosed (P : PopulationGeneticsPackage) : Prop :=
  P.alleleFrequencySpectrum ∧ P.effectivePopulationSize ∧
  P.selectionCoefficient ∧ P.migrationModel

theorem population_genetics_closed_from_evidence
    (P : PopulationGeneticsPackage)
    (E : PopulationGeneticsEvidence P) : PopulationGeneticsClosed P := by
  exact And.intro E.alleleFrequencySpectrumClosed
    (And.intro E.effectivePopulationSizeClosed
      (And.intro E.selectionCoefficientClosed E.migrationModelClosed))

end GeneticsPhylogeneticsCanonicalLaneLean
end HautevilleHouse