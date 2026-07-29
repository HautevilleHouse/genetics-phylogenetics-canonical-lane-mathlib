import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsPhylogeneticsCanonicalLaneLean

structure PhylogeneticTreePackage where
  distanceMatrix : Prop
  treeBuildingMethod : Prop
  branchLengthEstimation : Prop
  bootstrapSupport : Prop
  outgroupSelection : Prop

structure PhylogeneticTreeEvidence (P : PhylogeneticTreePackage) where
  distanceMatrixClosed : P.distanceMatrix
  treeBuildingMethodClosed : P.treeBuildingMethod
  branchLengthEstimationClosed : P.branchLengthEstimation
  bootstrapSupportClosed : P.bootstrapSupport
  outgroupSelectionClosed : P.outgroupSelection

def PhylogeneticTreeClosed (P : PhylogeneticTreePackage) : Prop :=
  P.distanceMatrix ∧ P.treeBuildingMethod ∧
  P.branchLengthEstimation ∧ P.bootstrapSupport ∧ P.outgroupSelection

theorem phylogenetic_tree_closed_from_evidence (P : PhylogeneticTreePackage)
    (E : PhylogeneticTreeEvidence P) : PhylogeneticTreeClosed P := by
  exact And.intro E.distanceMatrixClosed
    (And.intro E.treeBuildingMethodClosed
      (And.intro E.branchLengthEstimationClosed
        (And.intro E.bootstrapSupportClosed E.outgroupSelectionClosed)))

end GeneticsPhylogeneticsCanonicalLaneLean
end HautevilleHouse