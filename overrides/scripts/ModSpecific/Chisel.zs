import mods.chisel.Carving;

//Graciously adapted from Divine Journey 2 https://github.com/Divine-Journey-2/Divine-Journey-2/blob/main/overrides/scripts/ModSpecific/Chisel.zs

// Add a number of colored items as chisel groups
val colors as string[] = ["white", "orange", "magenta", "lightblue", "yellow", "lime", "pink", "gray", "light_gray", "cyan", "purple", "blue", "brown", "green", "red", "black"] as string[];

// AE2 Cable
Carving.addGroup("ae2glasscable");
for i in 0 to 17 {
    Carving.addVariation("ae2glasscable", <appliedenergistics2:part>.withDamage(i));
}

// AE2 Covered Cable
Carving.addGroup("ae2coveredcable");
for i in 20 to 37 {
    Carving.addVariation("ae2coveredcable", <appliedenergistics2:part>.withDamage(i));
}

// AE2 Smart Cable
Carving.addGroup("ae2smartcable");
for i in 40 to 57 {
    Carving.addVariation("ae2smartcable", <appliedenergistics2:part>.withDamage(i));
}

// AE2 Dense Smart Cable
Carving.addGroup("ae2densesmartcable");
for i in 60 to 77 {
    Carving.addVariation("ae2densesmartcable", <appliedenergistics2:part>.withDamage(i));
}

// AE2 Dense Cable
Carving.addGroup("ae2densecable");
for i in 500 to 517 {
    Carving.addVariation("ae2densecable", <appliedenergistics2:part>.withDamage(i));
}