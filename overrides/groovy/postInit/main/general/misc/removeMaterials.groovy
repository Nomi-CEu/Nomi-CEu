package postInit.main.general.misc

import com.nomiceu.nomilabs.util.LabsModeHelper
import gregtech.api.unification.material.Material

import static com.nomiceu.nomilabs.groovy.GroovyHelpers.MaterialHelpers.*
import static com.nomiceu.nomilabs.gregtech.material.registry.LabsMaterials.*

// Hide GT Mana Infused/Mithril (Deprecated) from JEI
// Can't remap, as rods cannot be remapped.
hideMaterial(Mithril, false)

// Hide GT Infinity (Deprecated) from JEI
// Can't remap, as double plates cannot be remapped.
hideMaterial(Infinity, false)

// Normal Mode Specific (Hiding Hard Mode Materials)
if (!LabsModeHelper.isNormal()) return

Material[] materials = [
	// Elemental Materials
	Taranium,
	// Chemical Materials
	TungstenTrioxide,
	BerylliumOxide,
	NiobiumPentoxide,
	TantalumPentoxide,
	ManganeseDifluoride,
	MolybdenumTrioxide,
	LeadChloride,
	Wollastonite,
	SodiumMetavanadate,
	VanadiumPentoxide,
	AmmoniumMetavanadate,
	PhthalicAnhydride,
	Ethylanthraquinone,
	HydrogenPeroxide,
	Hydrazine,
	AcetoneAzine,
	GrapheneOxide,
	Durene,
	PyromelliticDianhydride,
	Dimethylformamide,
	Aminophenol,
	Oxydianiline,
	AntimonyPentafluoride,
	LeadMetasilicate,
	Butanol,
	PhosphorusTrichloride,
	PhosphorylChloride,
	TributylPhosphate,
	// Naq Line Materials
	NaquadahOxide,
	Pyromorphite,
	NaquadahHydroxide,
	CaesiumHydroxide,
	Neocryolite,
	NaquadahOxidePetroSolution,
	NaquadahOxideAeroSolution,
	HotNaquadahOxideNeocryoliteSolution,
	// Taranium Line Materials
	HexafluorosilicicAcid,
	DirtyHexafluorosilicicAcid,
	StoneResidue,
	UncommonResidue,
	OxidisedResidue,
	RefinedResidue,
	CleanInertResidue,
	UltraacidicResidue,
	XenicAcid,
	DustyHelium,
	TaraniumEnrichedHelium,
	TaraniumDepletedHelium,
	TritiumHydride,
	HeliumHydride,
	DioxygenDifluoride,
	// Platinum Line Materials
	PlatinumMetallic,
	PalladiumMetallic,
	AmmoniumHexachloroplatinate,
	ChloroplatinicAcid,
	PotassiumBisulfate,
	PotassiumPyrosulfate,
	PotassiumSulfate,
	ZincSulfate,
	SodiumNitrate,
	RhodiumNitrate,
	SodiumRuthenate,
	SodiumPeroxide,
	IridiumDioxideResidue,
	AmmoniumHexachloroiridiate,
	PlatinumGroupResidue,
	PalladiumRichAmmonia,
	CrudePlatinumResidue,
	CrudePalladiumResidue,
	IridiumGroupSludge,
	RhodiumSulfateSolution,
	CrudeRhodiumResidue,
	RhodiumSalt,
	AcidicIridiumDioxideSolution,
	PlatinumPalladiumLeachate,
	MethylFormate,
	FormicAcid,
	SodiumMethoxide,
	// Microverse Materials
	Snowchestite,
	Dulysite,
	// Endgame Materials
	KaptonK
]

for (def material : materials) {
	yeetMaterial(material, false)
}
