import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsPhylogeneticsCanonicalLaneLean

structure PopulationGeneticsPackage where
  alleleFrequencySpectrum : Prop
  fixationIndex : Prop
  nucleotideDiversity : Prop
  populationSubdivision : Prop
  geneFlow : Prop

structure PopulationGeneticsEvidence (P : PopulationGeneticsPackage) where
  alleleFrequencySpectrumClosed : P.alleleFrequencySpectrum
  fixationIndexClosed : P.fixationIndex
  nucleotideDiversityClosed : P.nucleotideDiversity
  populationSubdivisionClosed : P.populationSubdivision
  geneFlowClosed : P.geneFlow

def PopulationGeneticsClosed (P : PopulationGeneticsPackage) : Prop :=
  P.alleleFrequencySpectrum ∧ P.fixationIndex ∧
  P.nucleotideDiversity ∧ P.populationSubdivision ∧ P.geneFlow

theorem population_genetics_closed_from_evidence (P : PopulationGeneticsPackage)
    (E : PopulationGeneticsEvidence P) : PopulationGeneticsClosed P := by
  exact And.intro E.alleleFrequencySpectrumClosed
    (And.intro E.fixationIndexClosed
      (And.intro E.nucleotideDiversityClosed
        (And.intro E.populationSubdivisionClosed E.geneFlowClosed)))

end GeneticsPhylogeneticsCanonicalLaneLean
end HautevilleHouse