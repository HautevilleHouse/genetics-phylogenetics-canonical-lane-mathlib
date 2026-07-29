import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsPhylogeneticsCanonicalLaneLean

structure MolecularClockPackage where
  molecularSequence : Type u
  substitutionRate : Prop
  divergenceTime : Prop
  clockHypothesis : Prop
  rateHeterogeneity : Prop

structure MolecularClockEvidence (M : MolecularClockPackage) where
  substitutionRateClosed : M.substitutionRate
  divergenceTimeClosed : M.divergenceTime
  clockHypothesisClosed : M.clockHypothesis
  rateHeterogeneityClosed : M.rateHeterogeneity

def MolecularClockClosed (M : MolecularClockPackage) : Prop :=
  M.substitutionRate ∧ M.divergenceTime ∧ M.clockHypothesis ∧ M.rateHeterogeneity

theorem molecular_clock_closed_from_evidence (M : MolecularClockPackage) (E : MolecularClockEvidence M) : MolecularClockClosed M := by
  exact And.intro E.substitutionRateClosed (And.intro E.divergenceTimeClosed (And.intro E.clockHypothesisClosed E.rateHeterogeneityClosed))

end GeneticsPhylogeneticsCanonicalLaneLean
end HautevilleHouse