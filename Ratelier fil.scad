// Support de câbles USB ou cordons de test faciles © 2025 - Version 1.0
// par D.H.Borg sous licence CC BY 4.0 
// https://creativecommons.org/licenses/by/4.0/
// Vous êtes libre de :
//   Partager — copier et redistribuer le matériel sous tout format ou support, même commercialement.
//   Adapter — remixer, transformer et créer à partir du matériel, même commercialement.
//   Attribution — Vous devez créditer le créateur, fournir un lien vers la licence et indiquer si des modifications ont été faites.
//   Aucune restriction supplémentaire — Vous ne pouvez pas appliquer de termes légaux ou de mesures technologiques restreignant autrui.
//   Sans garantie — Ce modèle 3D est fourni "tel quel" sans garantie expresse ou implicite.

/* [Style et imprimante] */
// au-delà, coupe en morceaux à queues d'aronde
// Largeur max. de l'imprimante (mm)
Largeur_Max_Imprimante = 256; //[100:1:500]
printerMaxWidth = Largeur_Max_Imprimante;
// Morceau affiché / exporté
Morceau_Affiche = 0; //[0:Tous (écartés), 1:Morceau 1, 2:Morceau 2, 3:Morceau 3, 4:Morceau 4]
pieceShown = Morceau_Affiche;
// Jeu d'assemblage (mm)
Jeu_Assemblage = 0.2; //[0.0:0.05:0.5]
jointGap = Jeu_Assemblage;
// Modèle à imprimer
MODEL = "P1R"; //[P1R:Support - Normal, P1S:Support - Petit, P4R:Gabarit de perçage Normal, P4S:Gabarit de perçage Petit]

/* [Géométrie commune] */
// Nombre de supports
Nombre_de_Supports = 20; //[0:1:50]
numberOfBrackets = Nombre_de_Supports;
// Épaisseur de la plaque (mm)
Epaisseur_Plaque = 4; //[3:1:10]
bpThickness = Epaisseur_Plaque;
// Largeur d'un support (mm)
Largeur_support = 10; //[2:1:50]
bracketTop = Largeur_support;
// Épaisseur d'un support (mm)
Epaisseur_Support = 4; //[2:1:10]
bracketT = Epaisseur_Support;
// Espace entre supports (mm)
Espace_Entre_Support = 5; //[0:1:50]
bracketSpaces = Espace_Entre_Support;

/* [Géométrie modèle normal] */
// Distance 1er support ↔ bord de plaque (mm)
Distance_1e_support_bord_plaque = 6; //[0:1:50]
startFirstBracket = Distance_1e_support_bord_plaque;
// Hauteur de la plaque (mm)
Hauteur_Plaque = 60; //[0:1:100]
bpHeight = Hauteur_Plaque;
// Hauteur d'un support (mm)
Hauteur_Support = 25; //[5:1:50]
bracketH = Hauteur_Support;
// Longueur d'un support (mm)
Longueur_Support = 75; //[5:1:150]
bracketL = Longueur_Support;

/* [Géométrie petit modèle] */
// Distance 1er support ↔ bord de plaque (mm)
Distance_1e_support_bord_plaque_Petit = 20; //[0:1:50]
startFirstBracketSmall = Distance_1e_support_bord_plaque_Petit;
// Hauteur de la plaque (mm)
Hauteur_Plaque_Petite = 22; //[0:1:100]
bpHeightSmall = Hauteur_Plaque_Petite;
// Hauteur d'un support (mm)
Hauteur_Support_Petit = 20; //[5:1:50]
bracketHSmall = Hauteur_Support_Petit;
// Longueur d'un support (mm)
Longueur_Support_Petit = 40; //[5:1:150]
bracketLSmall = Longueur_Support_Petit;




/* [Trou de fixation] */
// Taille de vis
Taille_Vis = "S2"; //[S1:M3, S2:Vis Placo 3.5mm, S3:M4, S4:M5]
screwSize = Taille_Vis;
// Tolérance de perçage (mm)
Tolerance_Percage = 0.5; //[0.0:Ajustement exact = 0.0, 0.125:Serré = 0.125, 0.25:Normal = 0.25, 0.5:Jeu = 0.5]
drillTolerance = Tolerance_Percage;
// Nombre de trous
Nombre_de_Trous = 2; //[2, 4]
holeCount = Nombre_de_Trous;
// Emplacement des trous — coins : hauts (2) ou les 4 ; supports : sous la partie horizontale (+ 2 en bas)
Emplacement_Trous = "S"; //[C:Dans les coins, S:Sous les supports]
holePlacement = Emplacement_Trous;
// Entraxe des trous (mm) — « Sous les supports » seulement, recalé entre deux supports
Entraxe_Trous = 420; //[10:1:1000]
holeSpacing = Entraxe_Trous;

/* [Divers] */
// Débord anti-scintillement des surfaces confondues (mm)
zBuffer = 0.1;
// Ajustement avec jeu (mm)
looseFit = 0.5;
// Ajustement normal (mm)
normalFit = 0.25;
// Ajustement serré (mm)
tightFit = 0.125;
// Ajustement exact (mm)
exactFit = 0.0;

// Calcul de la longueur totale de la plaque de base
bpTotalLength = startFirstBracket * 2 + (numberOfBrackets - 1) * (bracketTop + bracketSpaces);
bpTotalLengthSmall = startFirstBracketSmall * 2 + (numberOfBrackets - 1) * (bracketTop + bracketSpaces);

// Vis placo 3,5 : diamètre du corps (mm)
screwShaftDiameter = 3.5;
// Vis placo 3,5 : diamètre de la tête (mm)
screwHeadDiameter = 7.0;
// Vis placo 3,5 : profondeur de fraisage (mm)
countersinkDepth = 2.0;

// Placement des trous — repère « vue de face » (supports vers soi, partie horizontale en haut)
headDiaTol = getScrewData(screwSize)[1] + drillTolerance;
headDepthTol = getScrewData(screwSize)[2] + drillTolerance;
holeEdge = headDiaTol / 2 + 2.5;    // distance centre de trou ↔ bord de plaque
// Demi-course du trou oblong (mm)
oblongMax = 3;
bracketStepAll = bracketTop + bracketSpaces;
braceGap = bracketStepAll - bracketT; // jour entre deux jambes de force, au ras de la plaque

// Demi-course réelle : sous les supports, l'oblong doit tenir entre deux jambes de force
function oblongHalf() =
    holePlacement == "C" || numberOfBrackets < 3 ? oblongMax
    : min(oblongMax, max(0, (braceGap - headDiaTol) / 2 - 0.5));

// X des deux colonnes [gauche = oblong, droite = rond]
function holeColumnsX(length, first) =
    holePlacement == "C" ? [holeEdge + oblongHalf(), length - holeEdge - oblongHalf()]
    : numberOfBrackets < 3 ? [(length - holeSpacing) / 2, (length + holeSpacing) / 2]
    : let(
        n = numberOfBrackets,
        kr = min(n - 2, max(floor(n / 2), round((length / 2 + holeSpacing / 2 - first) / bracketStepAll - 0.5))),
        kl = n - 2 - kr
      )
      [first + (kl + 0.5) * bracketStepAll, first + (kr + 0.5) * bracketStepAll];

// Y des rangées de trous (haut d'abord)
function holeRowsY(height, bH) =
    let(
        top = holePlacement == "C" ? height - holeEdge
            : (height + bH) / 2 - bracketT - headDiaTol / 2 - 1  // juste sous la partie horizontale
    )
    holeCount == 4 ? [top, holeEdge] : [top];

// [x, y, demi-course oblong] de chaque trou
function holeList(length, height, first, bH) =
    let(xs = holeColumnsX(length, first), ys = holeRowsY(height, bH), h = oblongHalf())
    [for (y = ys) for (c = [0, 1]) [xs[c], y, c == 0 ? h : 0]];

// Hauteur de plaque mini pour que les têtes de vis ne mordent pas sur les supports
function minPlateHeight(bH) =
    holePlacement == "C" ? bH + 2 * (holeEdge + headDiaTol / 2)
    : max(bH, 2 * (bracketT + headDiaTol / 2 + 1 + holeEdge + (holeCount == 4 ? headDiaTol + 1 : 0)) - bH);

module holeReport(length, height, first, bH, yText){
    xs = holeColumnsX(length, first);
    ys = holeRowsY(height, bH);
    hMin = minPlateHeight(bH);
    color("Red"){
        translate([0, yText, 0])
            text(str("Entraxe horizontal des vis : ", xs[1] - xs[0], " mm (trou oblong à gauche)"), size = 5);
        if (holeCount == 4)
            translate([0, yText - 8, 0])
                text(str("Entraxe vertical des vis : ", ys[0] - ys[1], " mm"), size = 5);
    }
    echo(str("Épaisseur de plaque mini : ", ceil(headDepthTol + 1), " mm — hauteur de plaque mini : ", ceil(hMin), " mm"));
    if (height < hMin)
        echo(str("ATTENTION : hauteur de plaque ", height, " mm < mini ", ceil(hMin), " mm, les trous mordent sur les supports"));
    if (holePlacement == "S" && braceGap < headDiaTol + 1)
        echo(str("ATTENTION : jour entre supports ", braceGap, " mm trop petit pour une tête de ", headDiaTol, " mm"));
}

// Découpe si la plaque dépasse la largeur d'impression — repère « vue de face »
// Assemblage par queues d'aronde traversantes alternées (type puzzle) : s'imprime à plat sans support,
// bloque en X, Y et en rotation, se colle ; la coupe passe toujours dans le jour entre deux supports.
// Dépouille des queues d'aronde (°)
dovetailAngle = 20;
dovetailDepth = min(8, braceGap - 2);        // profondeur totale, tient dans le jour entre jambes de force
dovetailOK = dovetailDepth >= 3;
// Écart entre morceaux à l'affichage (mm)
pieceSpread = 15;

function gapX(first, k) = first + (k + 0.5) * bracketStepAll;

// Jour utilisable pour une coupe : aucun trou de fixation à portée des queues
function gapFree(length, first, k) =
    let(xs = holeColumnsX(length, first), r = dovetailDepth / 2 + headDiaTol / 2 + oblongHalf() + 1)
    abs(gapX(first, k) - xs[0]) > r && abs(gapX(first, k) - xs[1]) > r;

// Jour libre le plus proche de la position visée t
function cutGap(length, first, t) =
    let(
        free = numberOfBrackets < 2 ? [] : [for (k = [0:numberOfBrackets - 2]) if (gapFree(length, first, k)) k],
        dists = [for (k = free) abs(gapX(first, k) - t)]
    )
    len(free) == 0 ? undef : free[[for (i = [0:len(dists) - 1]) if (dists[i] == min(dists)) i][0]];

function cutsFor(length, first, n) =
    n < 2 ? [] : [for (i = [1:n - 1]) gapX(first, cutGap(length, first, i * length / n))];

// Largeur de chaque morceau, queues comprises
function pieceWidths(length, cuts) =
    let(b = concat([0], cuts, [length]), m = len(cuts))
    [for (i = [0:m]) b[i + 1] - b[i] + (i > 0 ? dovetailDepth / 2 : 0) + (i < m ? dovetailDepth / 2 : 0)];

function cutsValid(length, cuts) =
    len([for (c = cuts) if (c == undef) 1]) == 0
    && len([for (i = [1:1:len(cuts) - 1]) if (cuts[i] <= cuts[i - 1]) 1]) == 0
    && max(pieceWidths(length, cuts)) <= printerMaxWidth;

// Plus petit nombre de morceaux qui passe dans l'imprimante
function pieceCount(length, first, n) =
    n >= numberOfBrackets || cutsValid(length, cutsFor(length, first, n)) ? n : pieceCount(length, first, n + 1);

function rackCuts(length, first) =
    length <= printerMaxWidth ? [] : cutsFor(length, first, pieceCount(length, first, ceil(length / printerMaxWidth)));

// Bord du morceau gauche le long d'une zone [y0, y1] : queues alternées, ou droit si la zone est trop courte
function tailZone(c, y0, y1) =
    let(d = dovetailDepth, z = y1 - y0, n = (!dovetailOK || z < 1.5 * d) ? 0 : max(1, floor(z / (3 * d))))
    n == 0 ? [[c, y0], [c, y1]]
    : let(p = z / n, wt = p / 2 + d * tan(dovetailAngle), a = c - d / 2, b = c + d / 2)
      concat(
          [[c, y0]],
          [for (k = [0:n - 1]) let(y = y0 + k * p)
              each [[a, y], [a, y + wt / 2], [b, y + p / 2 - wt / 2], [b, y + p / 2 + wt / 2], [a, y + p - wt / 2]]],
          [[a, y1], [c, y1]]);

// Profil de coupe : droit au droit de la partie horizontale (jour = espace entre supports), queues ailleurs
function cutProfile(c, height, bH) =
    let(armLow = max(0, (height + bH) / 2 - bracketT - 1), armHigh = min(height, (height + bH) / 2 + 1))
    concat([[c, -1]], tailZone(c, 0, armLow), tailZone(c, armHigh, height), [[c, height + 1]]);

module cutRegion(c, height, bH){
    polygon(concat([[-1000, -1]], cutProfile(c, height, bH), [[-1000, height + 1]]));
}

module pieceRegion(cuts, i, height, bH){
    difference(){
        if (i < len(cuts)) cutRegion(cuts[i], height, bH);
        else translate([-1000, -10]) square([3000, height + 20]);
        if (i > 0) cutRegion(cuts[i - 1], height, bH);
    }
}

// Support complet en vue de face (plaque + supports)
module Rack(length, height, first, bH, bL){
    bracketOffsetY = (height + bH) / 2;

    translate([length, height, 0])
    rotate([0, 0, 180]){
        Baseplate(length, height, first, bH);

        for(i = [0:1:numberOfBrackets - 1]){
            translate([first + i * bracketStepAll, bracketOffsetY, bpThickness])
                rotate([90, 0, -90]){
                    Bracket(bH, bL);
                }
        }
    }
}

// Support découpé en morceaux, écartés à l'affichage
module SplitRack(length, height, first, bH, bL){
    cuts = rackCuts(length, first);
    if (len(cuts) == 0)
        Rack(length, height, first, bH, bL);
    else
        for (i = [0:len(cuts)])
            if (pieceShown == 0 || pieceShown == i + 1)
                translate([pieceShown == 0 ? i * pieceSpread : 0, 0, 0])
                    intersection(){
                        Rack(length, height, first, bH, bL);
                        translate([0, 0, -1])
                            linear_extrude(1000)
                                offset(delta = -jointGap / 2)
                                    pieceRegion(cuts, i, height, bH);
                    }
}

module splitReport(length, height, first, yText){
    cuts = rackCuts(length, first);
    if (len(cuts) > 0){
        widths = pieceWidths(length, cuts);
        xs = holeColumnsX(length, first);
        b = concat([0], cuts, [length]);
        color("Red")
            translate([0, yText, 0])
                text(str("Coupé en ", len(cuts) + 1, " morceaux, largeurs (mm) : ", widths), size = 5);
        if (!cutsValid(length, cuts))
            echo(str("ATTENTION : impossible de tenir dans ", printerMaxWidth, " mm (largeurs ", widths, ")"));
        if (!dovetailOK)
            echo("ATTENTION : jour entre supports trop étroit pour des queues d'aronde, coupe droite");
        for (i = [0:len(cuts)])
            if (len([for (x = xs) if (x > b[i] && x < b[i + 1]) 1]) == 0)
                echo(str("ATTENTION : le morceau ", i + 1, " n'a aucun trou de fixation"));
    }
}

// Affichage du modèle sélectionné
if (MODEL == "P1R") {
    SplitRack(bpTotalLength, bpHeight, startFirstBracket, bracketH, bracketL);

    color("Red")
        translate([0, -10, 0])
            text(str("Longueur totale du support : ", bpTotalLength, " mm"), size = 5);
    holeReport(bpTotalLength, bpHeight, startFirstBracket, bracketH, -18);
    splitReport(bpTotalLength, bpHeight, startFirstBracket, holeCount == 4 ? -34 : -26);
}

if (MODEL == "P1S") {
    SplitRack(bpTotalLengthSmall, bpHeightSmall, startFirstBracketSmall, bracketHSmall, bracketLSmall);

    color("Red")
        translate([0, -10, 0])
            text(str("Longueur totale du support : ", bpTotalLengthSmall, " mm"), size = 5);
    holeReport(bpTotalLengthSmall, bpHeightSmall, startFirstBracketSmall, bracketHSmall, -18);
    splitReport(bpTotalLengthSmall, bpHeightSmall, startFirstBracketSmall, holeCount == 4 ? -34 : -26);
}

// Gabarit projeté dans la même orientation que la pièce vue de face
if (MODEL == "P4R") {
    projection(cut=false)
        translate([bpTotalLength, bpHeight, 0])
            rotate([0, 0, 180])
                Baseplate(bpTotalLength, bpHeight, startFirstBracket, bracketH);

    color("Red"){
        translate([0, -10, 0])
            text(str("Gabarit de perçage - Rendre cette projection et exporter."), size = 5);
        translate([0, -18, 0])
            text(str("Dimensions extérieures (mm) : ", bpTotalLength, " x ", bpHeight), size = 5);
        translate([0, -34 - (holeCount == 4 ? 8 : 0), 0])
            text(str("*** RAPPEL : Imprimer le PDF à taille réelle (échelle 100%)"), size = 5);
    }
    holeReport(bpTotalLength, bpHeight, startFirstBracket, bracketH, -26);
}

if (MODEL == "P4S") {
    projection(cut=false)
        translate([bpTotalLengthSmall, bpHeightSmall, 0])
            rotate([0, 0, 180])
                Baseplate(bpTotalLengthSmall, bpHeightSmall, startFirstBracketSmall, bracketHSmall);

    color("Red"){
        translate([0, -10, 0])
            text(str("Gabarit de perçage - Rendre cette projection et exporter."), size = 5);
        translate([0, -18, 0])
            text(str("Dimensions extérieures (mm) : ", bpTotalLengthSmall, " x ", bpHeightSmall), size = 5);
        translate([0, -34 - (holeCount == 4 ? 8 : 0), 0])
            text(str("*** RAPPEL : Imprimer le PDF à taille réelle (échelle 100%)"), size = 5);
    }
    holeReport(bpTotalLengthSmall, bpHeightSmall, startFirstBracketSmall, bracketHSmall, -26);
}

module Baseplate(length, height, first, bH){
    difference(){
        chamferredCube(length, height, bpThickness, 1);
        // Trous calculés en vue de face, ramenés dans le repère de la plaque (rotation 180°)
        translate([length, height, 0])
            rotate([0, 0, 180])
                drillPlacoHoles(length, height, first, bH);
    }
}

// Perçage : colonne de gauche oblongue (réglage horizontal), colonne de droite ronde
module drillPlacoHoles(length, height, first, bH){
    for (p = holeList(length, height, first, bH)){
        translate([p[0], p[1], 0]){
            if (p[2] > 0)
                hull(){
                    translate([-p[2], 0, 0]) drillHole();
                    translate([p[2], 0, 0]) drillHole();
                }
            else
                drillHole();
        }
    }
}

module Bracket(height, length){
    top(height, length);
    brace(height, length);
}

module top(height, length){
    chamfer = 1;
    diagonal = chamfer / sin(45);
    bracketWitdth = bracketTop - diagonal;
    thickness = bracketT - diagonal;
    offsetX = height - bracketT + diagonal / 2;
    offsetY = chamfer / 2;
    
    translate([offsetX, offsetY, 0])
        rotate([180, 0, 90]){
            minkowski(){
                linear_extrude(bracketWitdth, center = true)
                    topCurve(thickness, length);
                rotate([45,0,0])
                    cube(1, center = true);                
            }
        }
}

module topCurve(thickness, length){
    coneA = 30;
    spoutA = 0;

    t = thickness;
    neckRadius = 25;
    neckCurvatureFragments = 15 + sqrt(neckRadius); 
    
    baseAngle = -90;
    endA = coneA + baseAngle;
    startA = spoutA + baseAngle;
    
    neckR = neckRadius;
    neckRt = neckRadius - t;
    steps  =  (endA  -  startA) / neckCurvatureFragments;

    arcL = abs(neckR * cos(endA));
    
    p0x = 0;
    p0y = 0;
    p1x = p0x + length - arcL;
    p1y = p0y + 0;
    p2x = p1x;
    p2y = p1y + neckR;   
    pLastx = 0;
    pLasty = t;
    
    points  =  [
        [p0x,p0y],
        [p1x,p1y],
        for (i  =  [0:1:neckCurvatureFragments])
            [p2x + neckR * cos(startA + i * steps), p2y + neckR * sin(startA + i * steps)],
            
        for (j  =  [0:1:neckCurvatureFragments])
            [p2x + neckRt * cos(endA - j * steps), p2y + neckRt * sin(endA - j * steps)],
            
        [pLastx, pLasty], 
    ];
    
    polygon(points);
}

module brace(height, length){
    diagonal = 1 / sin(45);
    xDim = height - diagonal;
    yDim = length * 0.75 - diagonal;
    thickness = bracketT - diagonal;
    points = 50;

    a = yDim / xDim^2;
    step = xDim / points;

    brace = [
        [0,0],
        for (x = [0:step:xDim])
            [x, a * x^2],
        [xDim, 0]
    ];

    minkowski(){
        linear_extrude(thickness, center = true)
            polygon(brace);
            rotate([0,45,0])
            cube(1);
    }
}

module fillettedCube(x, y, z, r){
    d = r * 2;
    x1 = max( 0.001, x - d);
    y1 = max( 0.001, y - d);
    z1 = max( 0.001, z - d);
    
    translate([r, r, r])
        minkowski(){
            cube([x1, y1, z1]);
            sphere(r, $fn = 30);
        }
}

module chamferredCubeMinkowski(x, y, z, c){
    diagonal = c / sin(45);
    x1 = max( 0.001, x - c * 4 - diagonal);
    y1 = max( 0.001, y - c * 4 - diagonal);
    z1 = max( 0.001, z - c * 4 - diagonal);
    
    translate([c, c, c])
        minkowski(){
            cube([x1, y1, z1]);
            rotate([0, 45, 0])
                cube([diagonal, diagonal, diagonal]);
            rotate([45, 0, 0])
                cube([diagonal, diagonal, diagonal]);
            rotate([0, 0, 45])
                cube([diagonal, diagonal, diagonal]);
        }
}

module chamferredCube(x, y, z, chamfer, centered = false) {
    zBuffer = 0.01;
    diagonal = chamfer / sin(45);
    offsetX = x / 2;
    offsetY = y / 2;
    offsetZ = z / 2;
    centerX = centered ? 0 : offsetX;
    centerY = centered ? 0 : offsetY;
    centerZ = centered ? 0 : offsetZ;

    translate([centerX, centerY, centerZ])
    difference() {
        cube([x, y, z], true);

        for (signY = [-1, 1]) {
            for (signZ = [-1, 1]) {
                translate([0, signY * offsetY, signZ * offsetZ])
                    rotate([45, 0, 0])
                        cube([x + zBuffer * 2, diagonal, diagonal], true);
            }
        }

        for (signX = [-1, 1]) {
            for (signZ = [-1, 1]) {
                translate([signX * offsetX, 0, signZ * offsetZ])
                    rotate([0, 45, 0])
                        cube([diagonal, y + zBuffer * 2, diagonal], true);
            }
        }
        
        for (signX = [-1, 1]) {
            for (signY = [-1, 1]) {
                translate([signX * offsetX, signY * offsetY, 0])
                    rotate([0, 0, 45])
                        cube([diagonal, diagonal, z + zBuffer * 2], true);            
            }
        }
    }
}

module differenceChamferredCylinder(height, diameter, cTop, cBottom){
    dTopC = diameter + cTop * 2;
    dBottomC = diameter + cBottom * 2;
    hMid = height - cTop - cBottom;
    offset1 = cBottom;
    offset2 = cBottom + hMid;

    cylinder(h = cBottom, d1 = dTopC, d2 = diameter, $fn = 30);
    translate([0, 0, offset1 - zBuffer])
        cylinder(h = hMid + zBuffer * 2, d = diameter, $fn = 30);
    translate([0, 0, offset2])
        cylinder(h = cTop, d1 = diameter, d2 = dTopC, $fn = 30);
}

module drillHole(){
    screw = getScrewData(screwSize);

    shank = screw[0] + drillTolerance;
    headDia = screw[1] + drillTolerance;
    headDepth = screw[2] + drillTolerance;

    translate([0, 0, -zBuffer])
        cylinder(d = shank, h = bpThickness + zBuffer * 2, $fn = 30);
        
    translate([0,0,bpThickness-headDepth - zBuffer])
        cylinder(d1 = shank, d2 = headDia, h = headDepth + zBuffer * 2, $fn=30);
}

function getScrewData(string) =
    string == "S1" ? [3.0, 5.72, 1.65] :       // M3
    string == "S2" ? [3.5, 7.0, 2.0] :         // Vis Placo 3.5 mm
    string == "S3" ? [4.17, 8.43, 2.2] :      // M4
    string == "S4" ? [5.0, 9.78, 2.5] :       // M5
    [3.5, 7.0, 2.0];                           // Valeur par défaut : Vis Placo 3.5 mm