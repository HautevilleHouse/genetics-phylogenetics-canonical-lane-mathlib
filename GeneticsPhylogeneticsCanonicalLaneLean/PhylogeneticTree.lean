import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsPhylogeneticsCanonicalLaneLean

structure PhylogeneticTreePackage where
  taxa : List String
  treeTopology : Type u
  branchLengths : List Float
  likelihood : Float
  bootstrapSupport : Float

def PhylogeneticTreeClosed (P : PhylogeneticTreePackage) : Prop :=
  P.likelihood > -Float.inf  -- positive likelihood
  P.bootstrapSupport ≥ 0.7

structure PhylogeneticTreeEvidence (P : PhylogeneticTreePackage) where
  likelihoodFinite : P.likelihood > -Float.inf
  bootstrapSupportClosed : P.bootstrapSupport ≥ 0.7

theorem phylogenetic_tree_closed_from_evidence (P : PhylogeneticTreePackage) (E : PhylogeneticTreeEvidence P) :
    PhylogeneticTreeClosed P := by
  exact And.intro E.likelihoodFinite E.bootstrapSupportClosed

end GeneticsPhylogeneticsCanonicalLaneLean
end HautevilleHouse
