import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsPhylogeneticsCanonicalLaneLean

structure HardyWeinbergPackage where
  alleleFrequencies : Type u
  expectedGenotypeFrequencies : Type v
  populationInfinite : Prop
  randomMating : Prop
  noSelection : Prop
  noMutation : Prop
  noMigration : Prop
  equilibriumAttained : Prop

structure HardyWeinbergEvidence (H : HardyWeinbergPackage) where
  populationInfiniteClosed : H.populationInfinite
  randomMatingClosed : H.randomMating
  noSelectionClosed : H.noSelection
  noMutationClosed : H.noMutation
  noMigrationClosed : H.noMigration
  equilibriumAttainedClosed : H.equilibriumAttained

def HardyWeinbergClosed (H : HardyWeinbergPackage) : Prop := H.populationInfinite ∧ H.randomMating ∧ H.noSelection ∧ H.noMutation ∧ H.noMigration ∧ H.equilibriumAttained

theorem hardy_weinberg_closed_from_evidence (H : HardyWeinbergPackage) (E : HardyWeinbergEvidence H) : HardyWeinbergClosed H := by
  exact And.intro E.populationInfiniteClosed (And.intro E.randomMatingClosed (And.intro E.noSelectionClosed (And.intro E.noMutationClosed (And.intro E.noMigrationClosed E.equilibriumAttainedClosed))))

end GeneticsPhylogeneticsCanonicalLaneLean
end HautevilleHouse