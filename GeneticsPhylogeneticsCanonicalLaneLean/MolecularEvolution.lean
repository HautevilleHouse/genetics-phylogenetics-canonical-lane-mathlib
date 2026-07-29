import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsPhylogeneticsCanonicalLaneLean

structure MolecularEvolutionPackage where
  mutationRate : Prop
  selectionCoefficient : Prop
  effectivePopulationSize : Prop
  fixationProbability : Prop
  molecularClock : Prop

structure MolecularEvolutionEvidence (M : MolecularEvolutionPackage) where
  mutationRateClosed : M.mutationRate
  selectionCoefficientClosed : M.selectionCoefficient
  effectivePopulationSizeClosed : M.effectivePopulationSize
  fixationProbabilityClosed : M.fixationProbability
  molecularClockClosed : M.molecularClock

def MolecularEvolutionClosed (M : MolecularEvolutionPackage) : Prop :=
  M.mutationRate ∧ M.selectionCoefficient ∧
  M.effectivePopulationSize ∧ M.fixationProbability ∧ M.molecularClock

theorem molecular_evolution_closed_from_evidence (M : MolecularEvolutionPackage)
    (E : MolecularEvolutionEvidence M) : MolecularEvolutionClosed M := by
  exact And.intro E.mutationRateClosed
    (And.intro E.selectionCoefficientClosed
      (And.intro E.effectivePopulationSizeClosed
        (And.intro E.fixationProbabilityClosed E.molecularClockClosed)))

end GeneticsPhylogeneticsCanonicalLaneLean
end HautevilleHouse