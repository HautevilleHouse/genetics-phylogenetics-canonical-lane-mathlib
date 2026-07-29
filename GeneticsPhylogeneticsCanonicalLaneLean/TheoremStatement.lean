import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsPhylogeneticsCanonicalLaneLean

structure PhylogeneticsAdmittedObject where
  taxonSet : Type
  alignedSequences : Type
  substitutionModel : Type
  phylogeneticTree : Type
  observablesAccessible : Prop
  conclusion : observablesAccessible

def PhylogeneticsObservableClosed (O : PhylogeneticsAdmittedObject) : Prop :=
  O.observablesAccessible

end GeneticsPhylogeneticsCanonicalLaneLean
end HautevilleHouse