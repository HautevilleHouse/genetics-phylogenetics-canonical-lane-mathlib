import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsPhylogeneticsCanonicalLaneLean

structure PopulationGeneticsPackage where
  population : Type u
  genePool : Prop
  selectionPressure : Prop
  geneticDrift : Prop
  mutationRate : Prop
  migrationRate : Prop
  effectivePopulationSize : Prop

structure PopulationGeneticsEvidence (P : PopulationGeneticsPackage) where
  genePoolClosed : P.genePool
  selectionPressureClosed : P.selectionPressure
  geneticDriftClosed : P.geneticDrift
  mutationRateClosed : P.mutationRate
  migrationRateClosed : P.migrationRate
  effectivePopulationSizeClosed : P.effectivePopulationSize

def PopulationGeneticsClosed (P : PopulationGeneticsPackage) : Prop :=
  P.genePool ∧ P.selectionPressure ∧ P.geneticDrift ∧ P.mutationRate ∧ P.migrationRate ∧ P.effectivePopulationSize

theorem population_genetics_closed_from_evidence (P : PopulationGeneticsPackage) (E : PopulationGeneticsEvidence P) : PopulationGeneticsClosed P := by
  exact And.intro E.genePoolClosed (And.intro E.selectionPressureClosed (And.intro E.geneticDriftClosed (And.intro E.mutationRateClosed (And.intro E.migrationRateClosed E.effectivePopulationSizeClosed))))

end GeneticsPhylogeneticsCanonicalLaneLean
end HautevilleHouse