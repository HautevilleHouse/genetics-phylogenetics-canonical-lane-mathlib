import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GeneticsPhylogeneticsCanonicalLaneLean

structure PopulationParameters where
  populationSize : Nat
  mutationRate : Float
  selectionCoefficient : Float
  migrationRate : Float

structure BottleneckEvent (P : PopulationParameters) where
  reducedSize : Nat
  duration : Nat
  severity : Prop
  effectOnDiversity : Prop

structure CoalescentPackage (P : PopulationParameters)
    (B : BottleneckEvent P) where
  coalescenceTime : Type u
  effectivePopulationSize : Type v
  genealogyStructure : Prop
  coalescenceTimeClosed : coalescenceTime
  effectivePopulationSizeClosed : effectivePopulationSize
  genealogyStructureClosed : genealogyStructure

structure CoalescentEvidence (P : PopulationParameters)
    (B : BottleneckEvent P) (C : CoalescentPackage P B) where
  coalescenceTimeClosed : C.coalescenceTime
  effectivePopulationSizeClosed : C.effectivePopulationSize
  genealogyStructureClosed : C.genealogyStructure

def CoalescentClosed (P : PopulationParameters)
    (B : BottleneckEvent P) (C : CoalescentPackage P B) : Prop :=
  C.coalescenceTime ∧ C.effectivePopulationSize ∧ C.genealogyStructure

theorem coalescent_closed_from_evidence
    (P : PopulationParameters) (B : BottleneckEvent P)
    (C : CoalescentPackage P B) (E : CoalescentEvidence P B C) :
    CoalescentClosed P B C := by
  exact And.intro E.coalescenceTimeClosed
    (And.intro E.effectivePopulationSizeClosed E.genealogyStructureClosed)

end HautevilleHouse
end GeneticsPhylogeneticsCanonicalLaneLean
