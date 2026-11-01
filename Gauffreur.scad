// GAUFFREUR DE PAPIER v1.6 - OpenSCAD 2021.01 autonome / MakerWorld
// Imprimer ouvert, les deux dos sur le plateau. Aucune bibliothèque externe.
// Prototype : géométrie vérifiée ; charnière et gaufrage du papier à tester par impression.
// Le même contour maître génère les deux matrices. Ne pas les retourner séparément.
// Import SVG facultatif, désactivé par défaut. Aucun marquage ni lien externe dans la géométrie.

/* [01 Sortie] */
// L'impression ouverte est la seule orientation d'impression de l'outil complet.
//Mode d'affichage
output_mode = "Impression ouverte"; // [Impression ouverte,Aperçu fermé,Aperçu de l'ouverture,Demi-partie inférieure,Demi-partie supérieure,Test de charnière]
// Utilisé uniquement pour l'aperçu de l'ouverture. 0 = fermé, 180 = ouvert à plat.
// Angle d'ouverture
opening_angle = 45; // [0:5:180]
// Couleur d'affichage seulement (nom CSS ou "#RRGGBB"). Sans effet sur l'impression.
// Couleur de la demi-partie inférieure
lower_color = "LightSteelBlue";
// Couleur de la demi-partie supérieure
upper_color = "SteelBlue";

/* [02 Corps] */
// Dimension de la charnière jusqu'au bord ouvert du papier, en mm.
// Longueur de la plaque
plate_length = 60; // [40:1:90]
// Largeur de la plaque
plate_width = 42; // [30:1:70]
// Épaisseur de la plaque
plate_thickness = 4.0; // [4:0.5:8]
// Rayon des coins
corner_radius = 5; // [2:0.5:8]
// Bordure sans motif, également réservée aux guides de repérage.
// Marge du motif
design_margin = 7; // [6:0.5:12]

/* [02.1 Disposition - texte et SVG] */
// Si le texte et le SVG sont activés : les disposer sans chevauchement ou les positionner librement.
// Les dispositions automatiques ajustent les deux éléments à la zone utile et ignorent les décalages X/Y.
// Disposition du texte et du SVG
content_layout = "Texte sous SVG"; // [Texte sous SVG,Texte au-dessus du SVG,Positionnement libre]
// DISPOSITION AUTOMATIQUE UNIQUEMENT. Espace entre le texte et le logo, en mm.
// Écart entre les éléments
layout_gap = 2; // [0:0.5:8]
// POSITIONNEMENT LIBRE (ou un seul élément) : conserver la taille limite le déplacement au bord.
// Réduire près du bord permet un déplacement plus grand en diminuant la taille de l'élément.
// Ajustement près du bord
edge_behavior = "Garder la taille"; // [Garder la taille,Réduire près du bord]

/* [03 Texte] */
// Activer le texte
text_enabled = true;
// Ligne de texte 1
text_line_1 = "Gaufreur";
// Ligne de texte 2
text_line_2 = "papier";
// Police
text_font = "Liberation Sans:style=Bold"; // police
// Boîte englobante visée pour le texte COMPLET sur deux lignes.
// Largeur du texte
text_width = 42; // [5:0.5:75]
// Hauteur du texte
text_height = 14; // [3:0.5:40]
// Conserver les proportions des lettres. Désactivé : étirer le texte jusqu'à la boîte visée.
// Conserver les proportions
text_keep_aspect = true;
// Espacement des lettres
text_spacing = 1; // [0.7:0.05:1.5]
// Écart entre les lignes en unités nominales de police (taille de police : 10).
// Écart entre les lignes
text_line_distance = 14; // [10:0.5:25]
// La rotation s'applique aussi aux dispositions automatiques.
// Rotation du texte
text_rotation = 0; // [0:5:355]

/* [03.1 Position du texte] */
// Ignoré si le texte et le SVG utilisent une disposition automatique. +X = droite, -X = gauche.
// Décalage horizontal du texte
text_offset_x = 0; // [-25:0.5:25]
// +Y = haut, -Y = bas. Conserver la taille limite le déplacement au bord de la zone utile.
// Décalage vertical du texte
text_offset_y = 0; // [-20:0.5:20]

/* [04 Logo SVG] */
// Fichier SVG
svg_file = "default.svg";
// Désactivé : ignorer tous les SVG, y compris ceux importés précédemment.
// Activer le SVG
svg_enabled = true;
// Largeur du SVG
svg_width = 26; // [3:0.5:75]
// Hauteur du SVG
svg_height = 26; // [3:0.5:55]
// Conserver les proportions
svg_keep_aspect = true;
// La rotation s'applique aussi aux dispositions automatiques.
// Rotation du SVG
svg_rotation = 0; // [0:5:355]
// Épaississement du contour APRÈS mise à l'échelle, en mm ; peut fermer les petits trous.
// Épaississement du contour
svg_line_boost = 0; // [0:0.02:0.3]

/* [04.1 Position du SVG] */
// Ignoré si le texte et le SVG utilisent une disposition automatique. +X = droite, -X = gauche.
// Décalage horizontal du SVG
svg_offset_x = 0; // [-25:0.5:25]
// +Y = haut, -Y = bas. Conserver la taille limite le déplacement au bord de la zone utile.
// Décalage vertical du SVG
svg_offset_y = 0; // [-20:0.5:20]

/* [05 Motif] */
// La bordure facultative fait partie du motif de gaufrage, pas du corps.
// Bordure
border = "Aucune"; // [Aucune,Rectangle arrondi,Ellipse]
// Épaisseur de la bordure
border_line_width = 0.65; // [0.4:0.05:1.5]
// Retourner l'ensemble du motif sur le papier. En général, laisser désactivé.
// Miroir du motif
mirror_design = false;

/* [06 Papier et ajustement des matrices] */
// Hauteur du motif en relief, en mm. Indépendante de la taille du texte/logo et du mode de profondeur de la cavité.
// Hauteur du relief
emboss_height = 0.6; // [0.2:0.05:2]
// Élargissement de la cavité femelle PAR CÔTÉ, et non de la différence totale de diamètre.
// Jeu des matrices
die_clearance = 0.22; // [0.1:0.02:0.5]
// Distance nominale entre les faces à la fermeture. Limitée mécaniquement uniquement si les butées sont activées.
// Écart entre les faces
paper_gap = 0.12; // [0.08:0.02:0.4]
// PROFONDEUR AUTOMATIQUE UNIQUEMENT : distance finale entre la pointe mâle et le fond de la cavité femelle.
// Jeu de la pointe
tip_clearance = 0.18; // [0.1:0.02:0.5]
// Chanfreine les pointes mâles et les entrées femelles pour réduire le risque de couper le papier.
// Adoucissement des bords
edge_softening = 0.12; // [0:0.02:0.2]

/* [06.2 Profondeur de la cavité femelle] */
// Le mode automatique suit emboss_height + tip_clearance - paper_gap. Le mode manuel utilise female_depth.
// Mode de profondeur
female_depth_mode = "Automatique"; // [Automatique,Manuelle]
// MODE MANUEL UNIQUEMENT. Profondeur sous la face femelle plane, en mm. Ne modifie pas le motif en relief.
// Laisser au moins 2 mm de fond et éviter toute collision avec la pointe mâle.
// Profondeur de la cavité
female_depth = 0.66; // [0.2:0.02:3]

/* [07 Charnière imprimée en place] */
// Jeu radial de l'axe. Indépendant de la tolérance de gaufrage.
// Jeu radial de la charnière
hinge_clearance = 0.3; // [0.2:0.05:0.5]
// Espace entre les charnons voisins le long de l'axe de la charnière.
// Écart entre les charnons
hinge_axial_gap = 0.35; // [0.25:0.05:0.6]
// Résolution du modèle
quality = 48; // [32:16:96]

/* [08 Guides et butées - facultatifs] */
// Activé : cônes d'alignement ET logements correspondants. Peuvent marquer le papier posé dessus.
// Désactivé : retirer les cônes et leurs logements.
// Guides de repérage
registration_guides = false;
// Activé : de petites butées limitent la fermeture à paper_gap. Peuvent marquer le papier qui les recouvre.
// Désactivé : retirer les butées ; la distance de fermeture dépend alors du jeu de la charnière et de la pression.
// Butées de fermeture
face_stops = false;

/* [Masqué] */
$fn = quality;
eps = 0.015;
T = plate_thickness;
G = paper_gap;
H = T + G/2;
R = H;
start = R + 1.5;
cx = start + plate_length/2;
W = plate_width;
L = plate_length;
M = design_margin;
AW = L-2*M;
AH = W-2*M;
depth = female_depth_mode=="Manuelle" ? female_depth : emboss_height + tip_clearance-G;
effective_tip_clearance = G + depth - emboss_height;
soft = min(edge_softening,emboss_height/3);
pin_r = 1.7;
segment = W/7;

assert(L>=40 && W>=30 && T>=4, "Corps inférieur aux dimensions minimales sûres.");
assert(AW>8 && AH>8, "La marge du motif ne laisse aucune zone utile.");
assert(depth>0 && depth<=T-2, "La cavité femelle doit laisser au moins 2 mm de fond. Réduisez sa profondeur ou augmentez l'épaisseur de la plaque.");
assert(effective_tip_clearance>=0.02, "Cavité femelle trop peu profonde : augmentez female_depth ou réduisez emboss_height. Un jeu de pointe d'au moins 0,02 mm est requis.");
assert(hinge_clearance>=0.2 && hinge_clearance<=0.5, "Jeu de charnière hors de la plage testée.");
assert(hinge_axial_gap>=0.25 && hinge_axial_gap<segment/3, "Écartement des charnons invalide.");
assert(die_clearance>=0.1 && die_clearance<=0.5, "Jeu des matrices invalide.");
assert(soft<=die_clearance, "L'adoucissement des bords ne doit pas dépasser le jeu des matrices.");

function bw(a,w,h)=abs(cos(a))*w+abs(sin(a))*h;
function bh(a,w,h)=abs(sin(a))*w+abs(cos(a))*h;

module rounded2(w,h,r) {
    offset(r=r) square([w-2*r,h-2*r],center=true);
}

// Ajustement proportionnel exact repris du rouleau v1.13.
// La géométrie de référence se trouve au-dessus de Z=0 et disparaît dans la projection de découpe.
module fit2(w,h,keep=true) {
    if(keep)
        projection(cut=true)
            resize([0,h,0],auto=true)
                union() {
                    linear_extrude(1,center=true)
                        resize([w,0],auto=true) children();
                    translate([0,0,2]) cube([0.01,h,1],center=true);
                }
    else resize([w,h]) children();
}

// Le positionnement utilise des boîtes englobantes tournées prudentes, y compris l'épaississement SVG.
// En mode « Garder la taille », l'échelle d'ajustement est indépendante des décalages.
function bounded(v,limit) = min(max(v,-max(0,limit)),max(0,limit));
function center_fit(w,h,a) = min(1,(AW-2)/bw(a,w,h),(AH-2)/bh(a,w,h));
module placed(w,h,a,x,y) {
    rw=bw(a,w,h); rh=bh(a,w,h);
    px=bounded(x,(AW-2-0.2)/2);
    py=bounded(y,(AH-2-0.2)/2);
    k=edge_behavior=="Réduire près du bord" ?
        min(1,(AW-2-2*abs(px))/rw,(AH-2-2*abs(py))/rh) :
        center_fit(w,h,a);
    tx=edge_behavior=="Réduire près du bord" ? px : bounded(x,(AW-2-k*rw)/2);
    ty=edge_behavior=="Réduire près du bord" ? py : bounded(y,(AH-2-k*rh)/2);
    translate([tx,ty]) scale([k,k]) rotate(a) children();
}

has_text = text_enabled && (text_line_1!="" || text_line_2!="");
auto_layout = has_text && svg_enabled && content_layout!="Positionnement libre";
text_box_w = bw(text_rotation,text_width,text_height);
text_box_h = bh(text_rotation,text_width,text_height);
svg_box_w = bw(svg_rotation,svg_width+2*svg_line_boost,svg_height+2*svg_line_boost);
svg_box_h = bh(svg_rotation,svg_width+2*svg_line_boost,svg_height+2*svg_line_boost);
safe_layout_gap = min(layout_gap,(AH-2)/3);
// Une échelle commune conserve les tailles relatives demandées. L'écart reste en mm.
layout_scale = min(1,(AW-2)/max(text_box_w,svg_box_w),
                   (AH-2-safe_layout_gap)/(text_box_h+svg_box_h));
text_layout_y = (content_layout=="Texte sous SVG" ? -1 : 1)*
                (safe_layout_gap+layout_scale*svg_box_h)/2;
svg_layout_y = (content_layout=="Texte sous SVG" ? 1 : -1)*
               (safe_layout_gap+layout_scale*text_box_h)/2;

module position_text() {
    if(auto_layout)
        translate([0,text_layout_y]) scale([layout_scale,layout_scale])
            rotate(text_rotation) children();
    else placed(text_width,text_height,text_rotation,text_offset_x,text_offset_y) children();
}
module position_svg() {
    if(auto_layout)
        translate([0,svg_layout_y]) scale([layout_scale,layout_scale])
            rotate(svg_rotation) children();
    else placed(svg_width+2*svg_line_boost,svg_height+2*svg_line_boost,
                svg_rotation,svg_offset_x,svg_offset_y) children();
}

module raw_text() {
    if(text_line_1!="" && text_line_2!="") {
        translate([0,text_line_distance/2]) text(text_line_1,size=10,font=text_font,spacing=text_spacing,halign="center",valign="center");
        translate([0,-text_line_distance/2]) text(text_line_2,size=10,font=text_font,spacing=text_spacing,halign="center",valign="center");
    } else
        text(text_line_1!=""?text_line_1:text_line_2,size=10,font=text_font,spacing=text_spacing,halign="center",valign="center");
}

module artwork() {
    if(has_text)
        position_text()
            fit2(text_width,text_height,text_keep_aspect) raw_text();
    if(svg_enabled)
        position_svg()
            offset(delta=svg_line_boost)
                fit2(svg_width,svg_height,svg_keep_aspect)
                    import(svg_file,center=true);
    if(border!="Aucune")
        difference() {
            if(border=="Ellipse") scale([AW/2-1,AH/2-1]) circle(r=1);
            else rounded2(AW-2,AH-2,3);
            offset(delta=-border_line_width)
                if(border=="Ellipse") scale([AW/2-1,AH/2-1]) circle(r=1);
                else rounded2(AW-2,AH-2,3);
        }
}

module master() {
    // Même délimitation et même transformation miroir pour les deux matrices.
    intersection() {
        rounded2(AW,AH,3);
        scale([mirror_design?-1:1,1]) artwork();
    }
}

module relief() {
    translate([cx,0,T-eps]) {
        linear_extrude(emboss_height-soft+eps) master();
        if(soft>0)
            hull_layers();
    }
}
module hull_layers() {
    // Contour en gradins : chaque petite couche se rétrécit vers la pointe.
    for(i=[0:3])
        translate([0,0,emboss_height-soft+i*soft/4])
            linear_extrude(soft/4+eps)
                offset(delta=-(i+1)*soft/4) master();
}

module blank() {
    translate([cx,0,0]) linear_extrude(T)
        rounded2(L,W,min(corner_radius,W/3));
}

// Cylindres horizontaux le long de Y.
module along_y(y0,length) {
    translate([0,y0,H]) rotate([-90,0,0])
        linear_extrude(length) children();
}
module barrel_outline() {
    // Surface plane sur le plateau et chanfreins à 45 degrés, plutôt qu'un dessous arrondi.
    polygon([[-R,-0.4*R],[-0.4*R,-R],[0.4*R,-R],[R,-0.4*R],
             [R,0.4*R],[0.4*R,R],[-0.4*R,R],[-R,0.4*R]]);
}
module bore_outline() {
    // Toit et plancher symétriques en forme de goutte : permettent une rotation de 180 degrés.
    r=pin_r+hinge_clearance;
    union() {
        circle(r=r);
        polygon([[-r/sqrt(2),-r/sqrt(2)],[0,-r*sqrt(2)],[r/sqrt(2),-r/sqrt(2)],
                 [r/sqrt(2),r/sqrt(2)],[0,r*sqrt(2)],[-r/sqrt(2),r/sqrt(2)]]);
    }
}
module knuckles(upper=false) {
    for(i=[0:6]) if((i%2==1)==upper)
        let(y=-W/2+i*segment+hinge_axial_gap/2,
            s=segment-hinge_axial_gap)
        difference() {
            union() {
                along_y(y,s) barrel_outline();
                translate([0,y,0]) cube([start+2,s,T]);
            }
            if(upper) along_y(y-eps,s+2*eps) bore_outline();
        }
    if(!upper)
        along_y(-W/2+hinge_axial_gap/2,W-hinge_axial_gap) circle(r=pin_r);
}

module guide_locations() {
    for(y=[-W/2+4,W/2-4])
        translate([start+M, y, 0]) children();
}
module lower() {
    union() {
        blank();
        knuckles(false);
        relief();
        // Les butées définissent G indépendamment de la profondeur de la cavité.
        if(face_stops) for(x=[start+4,start+L-4], y=[-W/2+4,W/2-4])
            translate([x,y,T-eps]) cylinder(r=1.3,h=G+eps);
        if(registration_guides) guide_locations()
            translate([0,0,T-eps]) cylinder(r1=1.5,r2=0.6,h=1.2+eps);
    }
}

// La partie supérieure commence dans les coordonnées d'impression, puis se ferme en tournant autour de la charnière.
// Le miroir selon X résulte du pliage autour de l'axe Y.
// Elle ne doit pas être un second motif généré indépendamment.
module upper_print_positive_x() {
    difference() {
        union() { blank(); knuckles(true); }
        translate([cx,0,T-depth])
            linear_extrude(depth+eps) offset(delta=die_clearance) master();
        if(soft>0)
            for(i=[0:3])
                translate([cx,0,T-soft+i*soft/4])
                    linear_extrude(soft/4+eps)
                        offset(delta=die_clearance+(i+1)*soft/4) master();
        if(registration_guides) guide_locations()
            translate([0,0,T-1.2-0.18+G])
                cylinder(r1=0.6+0.12,r2=1.5+0.12,
                         h=1.2+0.18-G+eps);
    }
}
module upper_open() { mirror([1,0,0]) upper_print_positive_x(); }
module fold_from_open(angle) {
    translate([0,0,H]) rotate([0,180-angle,0]) translate([0,0,-H]) children();
}
module hinge_coupon() {
    intersection() {
        union() { lower(); upper_open(); }
        translate([-start-5,-W/2-1,-eps]) cube([2*(start+5),W+2,2*H+1]);
    }
}

// Couleur explicite dans tous les modes : sinon le visualiseur VS Code
// remplace la couleur par défaut d'OpenSCAD par celle du texte du thème.
if(output_mode=="Impression ouverte") {
    color(lower_color) lower();
    color(upper_color) upper_open();
}
else if(output_mode=="Demi-partie inférieure") color(lower_color) lower();
else if(output_mode=="Demi-partie supérieure") color(upper_color) upper_open();
else if(output_mode=="Test de charnière") color(lower_color) hinge_coupon();
else if(output_mode=="Aperçu fermé" || output_mode=="Aperçu de l'ouverture") {
    color(lower_color) lower();
    color(upper_color) fold_from_open(output_mode=="Aperçu fermé"?0:opening_angle) upper_open();
}
