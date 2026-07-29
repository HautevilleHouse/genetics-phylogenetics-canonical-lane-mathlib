import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsPhylogeneticsCanonicalLaneLean

structure SequenceAlignmentPackage where
  sequences : Type u
  scoringScheme : Type v
  gapPenalty : Prop
  alignmentAlgorithm : Prop
  optimalAlignmentFound : Prop
  alignmentScore : Prop

structure SequenceAlignmentEvidence (S : SequenceAlignmentPackage) where
  gapPenaltyClosed : S.gapPenalty
  alignmentAlgorithmClosed : S.alignmentAlgorithm
  optimalAlignmentFoundClosed : S.optimalAlignmentFound
  alignmentScoreClosed : S.alignmentScore

def SequenceAlignmentClosed (S : SequenceAlignmentPackage) : Prop := S.gapPenalty ∧ S.alignmentAlgorithm ∧ S.optimalAlignmentFound ∧ S.alignmentScore

theorem sequence_alignment_closed_from_evidence (S : SequenceAlignmentPackage) (E : SequenceAlignmentEvidence S) : SequenceAlignmentClosed S := by
  exact And.intro E.gapPenaltyClosed (And.intro E.alignmentAlgorithmClosed (And.intro E.optimalAlignmentFoundClosed E.alignmentScoreClosed))

end GeneticsPhylogeneticsCanonicalLaneLean
end HautevilleHouse