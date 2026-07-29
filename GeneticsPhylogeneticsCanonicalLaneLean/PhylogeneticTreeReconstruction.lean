import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsPhylogeneticsCanonicalLaneLean

structure PhylogeneticTreePackage where
  sequenceData : Type u
  distanceMatrix : Type v
  treeStructure : Type w
  optimalityCriterion : Prop
  branchLengths : Prop
  treeResolved : Prop
  consistencyGuaranteed : Prop

structure PhylogeneticTreeEvidence (P : PhylogeneticTreePackage) where
  optimalityCriterionClosed : P.optimalityCriterion
  branchLengthsClosed : P.branchLengths
  treeResolvedClosed : P.treeResolved
  consistencyGuaranteedClosed : P.consistencyGuaranteed

def PhylogeneticTreeClosed (P : PhylogeneticTreePackage) : Prop := P.optimalityCriterion ∧ P.branchLengths ∧ P.treeResolved ∧ P.consistencyGuaranteed

theorem phylogenetic_tree_closed_from_evidence (P : PhylogeneticTreePackage) (E : PhylogeneticTreeEvidence P) : PhylogeneticTreeClosed P := by
  exact And.intro E.optimalityCriterionClosed (And.intro E.branchLengthsClosed (And.intro E.treeResolvedClosed E.consistencyGuaranteedClosed))

end GeneticsPhylogeneticsCanonicalLaneLean
end HautevilleHouse