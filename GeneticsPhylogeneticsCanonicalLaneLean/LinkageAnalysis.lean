import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsPhylogeneticsCanonicalLaneLean

structure LinkageAnalysisPackage where
  geneticMarkers : Type u
  recombinationFraction : Type v
  lodScore : Prop
  linkageGroup : Prop
  markerOrder : Prop
  mapDistance : Prop
  significantLinkage : Prop

structure LinkageAnalysisEvidence (L : LinkageAnalysisPackage) where
  lodScoreClosed : L.lodScore
  linkageGroupClosed : L.linkageGroup
  markerOrderClosed : L.markerOrder
  mapDistanceClosed : L.mapDistance
  significantLinkageClosed : L.significantLinkage

def LinkageAnalysisClosed (L : LinkageAnalysisPackage) : Prop := L.lodScore ∧ L.linkageGroup ∧ L.markerOrder ∧ L.mapDistance ∧ L.significantLinkage

theorem linkage_analysis_closed_from_evidence (L : LinkageAnalysisPackage) (E : LinkageAnalysisEvidence L) : LinkageAnalysisClosed L := by
  exact And.intro E.lodScoreClosed (And.intro E.linkageGroupClosed (And.intro E.markerOrderClosed (And.intro E.mapDistanceClosed E.significantLinkageClosed)))

end GeneticsPhylogeneticsCanonicalLaneLean
end HautevilleHouse