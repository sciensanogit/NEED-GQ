data <- read.csv(
  "data/survey_632819_R_data_file.csv",
  quote = "'\"",
  na.strings = c("", "\"\""),
  stringsAsFactors = FALSE,
  fileEncoding = "UTF-8-BOM"
)

# LimeSurvey Field type: F
data[, 1] <- as.numeric(data[, 1])
attributes(data)$variable.labels[1] <- "id"
names(data)[1] <- "id"

data[, 2] <- as.character(data[, 2])
attributes(data)$variable.labels[2] <- "submitdate"
names(data)[2] <- "submitdate"
# LimeSurvey Field type: F
data[, 3] <- as.numeric(data[, 3])
attributes(data)$variable.labels[3] <- "lastpage"
names(data)[3] <- "lastpage"
# LimeSurvey Field type: A
data[, 4] <- as.character(data[, 4])
attributes(data)$variable.labels[4] <- "startlanguage"
names(data)[4] <- "startlanguage"
# LimeSurvey Field type: A
data[, 5] <- as.character(data[, 5])
attributes(data)$variable.labels[5] <- "seed"
names(data)[5] <- "seed"
# LimeSurvey Field type: DATETIME23.2
data[, 6] <- as.character(data[, 6])
attributes(data)$variable.labels[6] <- "startdate"
names(data)[6] <- "startdate"
# LimeSurvey Field type: DATETIME23.2
data[, 7] <- as.character(data[, 7])
attributes(data)$variable.labels[7] <- "datestamp"
names(data)[7] <- "datestamp"
# LimeSurvey Field type: F
data[, 8] <- as.numeric(data[, 8])
attributes(data)$variable.labels[8] <- "Vous remplissez ce questionnaire"
data[, 8] <- factor(
  data[, 8],
  levels = c(1, 2),
  labels = c(
    "Pour vous-même",
    "Pour un autre adulte. (La personne que vous représentez n\'est pas capable de répondre au questionnaire pour le moment. E"
  )
)
names(data)[8] <- "D1"
# LimeSurvey Field type: A
data[, 9] <- as.character(data[, 9])
attributes(data)$variable.labels[
  9
] <- "A partir de maintenant veuillez répondre à toutes les questions comme si vous étiez la personne atteinte de la maladie. Indiquez \"je ne sais pas\" si vous ne savez pas comment la personne répondrait."
names(data)[9] <- "D1b"
# LimeSurvey Field type: A
data[, 10] <- as.character(data[, 10])
attributes(data)$variable.labels[10] <- "À quel genre vous identifiez-vous ?"
data[, 10] <- factor(
  data[, 10],
  levels = c("A1", "A2", "A3"),
  labels = c("Homme", "Femme", "Autre")
)
names(data)[10] <- "D2"
# LimeSurvey Field type: F
data[, 11] <- as.numeric(data[, 11])
attributes(data)$variable.labels[11] <- "Quelle est votre année de naissance ?"
names(data)[11] <- "D3"
# LimeSurvey Field type: F
data[, 12] <- as.numeric(data[, 12])
attributes(data)$variable.labels[12] <- "Dans quelle province habitez-vous ?"
data[, 12] <- factor(
  data[, 12],
  levels = c(001, 002, 003, 004, 005, 006, 007, 008, 009, 010, 011, 012, 013),
  labels = c(
    "Anvers",
    "Brabant wallon",
    "Bruxelles",
    "Hainaut",
    "Liège",
    "Limbourg",
    "Luxembourg",
    "Namur",
    "Flandre orientale",
    "Brabant flamand",
    "Flandre occidentale",
    "Je n’habite pas en Belgique",
    "Je ne sais pas"
  )
)
names(data)[12] <- "D4"
# LimeSurvey Field type: A
data[, 13] <- as.character(data[, 13])
attributes(data)$variable.labels[
  13
] <- "Merci beaucoup d’avoir complété ce questionnaire.  Malheureusement, vous ne rentrez pas dans les conditions pour pouvoir poursuivre cette étude. Si vous êtes intéressé(e)s par les résultats de cette étude, ils seront publiés sur le site Internet [site internet] [when]."
names(data)[13] <- "END1"
# LimeSurvey Field type: A
data[, 14] <- as.character(data[, 14])
attributes(data)$variable.labels[
  14
] <- "Quel est le diplôme ou le niveau d’étude le plus élevé que vous avez obtenu jusqu’à présent?"
data[, 14] <- factor(
  data[, 14],
  levels = c("001", "002", "003", "004", "005", "006", "008"),
  labels = c(
    "Pas de diplôme ou enseignement primaire",
    "Enseignement secondaire inférieur",
    "Enseignement secondaire supérieur",
    "Enseignement supérieur de type court (p.ex. Bachelier)",
    "Enseignement supérieur de type long (p.ex. Master)",
    "Doctorat",
    "Je ne sais pas"
  )
)
names(data)[14] <- "D5"
# LimeSurvey Field type: A
data[, 15] <- as.character(data[, 15])
attributes(data)$variable.labels[
  15
] <- "[Autre] Quel est le diplôme ou le niveau d’étude le plus élevé que vous avez obtenu jusqu’à présent?"
names(data)[15] <- "D5_other"
# LimeSurvey Field type: F
data[, 16] <- as.numeric(data[, 16])
attributes(data)$variable.labels[16] <- "[Seul(e) ] Vous vivez…"
data[, 16] <- factor(
  data[, 16],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[16] <- "D6_SQ001"
# LimeSurvey Field type: F
data[, 17] <- as.numeric(data[, 17])
attributes(data)$variable.labels[17] <- "[Seul(e) avec enfant(s) ] Vous vivez…"
data[, 17] <- factor(
  data[, 17],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[17] <- "D6_SQ002"
# LimeSurvey Field type: F
data[, 18] <- as.numeric(data[, 18])
attributes(data)$variable.labels[18] <- "[En couple (sans enfants)] Vous vivez…"
data[, 18] <- factor(
  data[, 18],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[18] <- "D6_SQ003"
# LimeSurvey Field type: F
data[, 19] <- as.numeric(data[, 19])
attributes(data)$variable.labels[19] <- "[En couple (avec enfants)] Vous vivez…"
data[, 19] <- factor(
  data[, 19],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[19] <- "D6_SQ004"
# LimeSurvey Field type: F
data[, 20] <- as.numeric(data[, 20])
attributes(data)$variable.labels[20] <- "[Avec un ou deux parents ] Vous vivez…"
data[, 20] <- factor(
  data[, 20],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[20] <- "D6_SQ005"
# LimeSurvey Field type: F
data[, 21] <- as.numeric(data[, 21])
attributes(data)$variable.labels[
  21
] <- "[En colocation ou habitat partagé] Vous vivez…"
data[, 21] <- factor(
  data[, 21],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[21] <- "D6_SQ006"
# LimeSurvey Field type: F
data[, 22] <- as.numeric(data[, 22])
attributes(data)$variable.labels[22] <- "[En maison de repos ] Vous vivez…"
data[, 22] <- factor(
  data[, 22],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[22] <- "D6_SQ007"
# LimeSurvey Field type: F
data[, 23] <- as.numeric(data[, 23])
attributes(data)$variable.labels[23] <- "[Je ne sais pas] Vous vivez…"
data[, 23] <- factor(
  data[, 23],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[23] <- "D6_SQ008"
# LimeSurvey Field type: A
data[, 24] <- as.character(data[, 24])
attributes(data)$variable.labels[24] <- "[Autre] Vous vivez…"
names(data)[24] <- "D6_other"
# LimeSurvey Field type: F
data[, 25] <- as.numeric(data[, 25])
attributes(data)$variable.labels[25] <- "Quel est votre pays de naissance ?"
data[, 25] <- factor(
  data[, 25],
  levels = c(001, 002, 003),
  labels = c("Belgique", "Autre pays", "Je ne sais pas")
)
names(data)[25] <- "D7"
# LimeSurvey Field type: A
# data[, 26] <- as.character(data[, 26])
# attributes(data)$variable.labels[26] <- "Sélectionnez le pays concerné"
# data[, 26] <- factor(data[, 26], levels=c("A1","A2","A3","A4","A5","A6","A7","A8","A9","A10","A11","A12","A13","A14","A15","A16","A17","A18","A19","A20","A21","A22","A23","A24","A25","A26","A27","A28","A29","A30","A31","A32","A33","A34","A35","A36","A37","A38","A39","A40","A41","A42","A43","A44","A45","A46","A47","A48","A49","A50","A51","A52","A53","A54","A55","A56","A57","A58","A59","A60","A61","A62","A63","A64","A65","A66","A67","A68","A69","A70","A71","A72","A73","A74","A75","A76","A77","A78","A79","A80","A81","A82","A83","A84","A85","A86","A87","A88","A89","A90","A91","A92","A93","A94","A95","A96","A97","A98","A99","A100","A101","A102","A103","A104","A105","A106","A107","A108","A109","A110","A111","A112","A113","A114","A115","A116","A117","A118","A119","A120","A121","A122","A123","A124","A125","A126","A127","A128","A129","A130","A131","A132","A133","A134","A135","A136","A137","A138","A139","A140","A141","A142","A143","A144","A145","A146","A147","A148","A149","A150","A151","A152","A153","A154","A155","A156","A157","A158","A159","A160","A161","A162","A163","A164","A165","A166","A167","A168","A169","A170","A171","A172","A173","A174","A175","A176","A177","A178","A179","A180","A181","A182","A183","A184","A185","A186","A187","A188","A189","A190","A191","A192","A193","A194","A195","A196","A197","A198","A199","A200","A201","A202","A203","A204","A205","A206","A207","A208","A209","A210","A211","A212","A213","A214","A215","A216","A217","A218","A219","A220","A221","A222","A223","A224","A225","A226","A227","A228","A229","A230","A231","A232","A233","A234","A235"),labels=c("Afghanistan;", "Afrique du Sud;", "Albanie;", "Algérie;", "Allemagne;", "Andorre;", "Angola;", "Anguilla;", "Antarctique;", "Antigua et Barbuda;", "Arabie Saoudite;", "Argentine;", "Arménie;", "Aruba;", "Australie;", "Autriche;", "Azerbaïdjan;", "Bahamas;", "Bahreïn;", "Bangladesh;", "Barbade;", "Bélize;", "Bénin;", "Bermudes;", "Bhoutan;", "Biélorussie;", "Bolivie;", "Bonaire;", "Bosnie – Herzégovine;", "Botswana;", "Brésil;", "Brunei;", "Bulgarie;", "Burkina Faso;", "Burundi;", "Cambodge;", "Cameroun;", "Canada;", "Cap-Vert;", "Chili;", "Chine;", "Chypre;", "Colombie;", "Comores;", "Congo (-Brazzaville);", "Congo (République Démocratique);", "Corée du Nord;", "Corée du Sud (République de Corée) ;", "Costa Rica;", "Côte d\'Ivoire;", "Croatie;", "Cuba;", "Curaçao;", "Danemark et îles Féroé;", "Djibouti;", "Dominique;", "Egypte;", "El Salvador;", "Emirats Arabes Unis;", "Equateur;", "Erythrée;", "Espagne et Iles Canaries;", "Estonie;", "eSwatini (Swaziland);", "États-Unis d\'Amérique;", "Ethiopie;", "Fidji;", "Finlande;", "France;", "Gabon;", "Gambie;", "Géorgie;", "Ghana;", "Gibraltar;", "Grèce;", "Grenade;", "Groenland;", "Guadeloupe;", "Guam;", "Guatemala;", "Guinée-Bissau;", "Guinée (Conakry);", "Guinée equatoriale;", "Guyana (Georgetown);", "Guyane (Française);", "Haïti;", "Honduras;", "Hong Kong;", "Hongrie;", "Ile Christmas;", "Iles Caïmans;", "Iles Cook;", "Iles Malouines;", "Iles Marshall;", "Iles Salomon;", "Iles Vierges (américaines);", "Iles Vierges (britanniques);", "Inde;", "Indonésie;", "Irak;", "Iran;", "Irlande;", "Islande;", "Israël;", "Italie;", "Jamaïque;", "Japon;", "Jordanie;", "Kazakhstan;", "Kenya;", "Kirghizistan;", "Kiribati;", "Kosovo;", "Koweït;", "Laos;", "Lesotho;", "Lettonie;", "Liban;", "Liberia;", "Libye;", "Liechtenstein;", "Lituanie;", "Luxembourg;", "Macao (Chine);", "Macédoine du Nord;", "Madagascar;", "Malaisie;", "Malawi;", "Maldives;", "Mali;", "Malte;", "Mariannes du Nord (Iles, américaines) ;", "Maroc;", "Martinique;", "Maurice;", "Mauritanie;", "Mayotte;", "Mexique;", "Micronesie;", "Moldova;", "Monaco;", "Mongolie;", "Monténégro;", "Montserrat (britannique);", "Mozambique;", "Myanmar;", "Namibie;", "Nauru;", "Népal;", "Nicaragua;", "Niger;", "Nigeria;", "Niue;", "Norvège;", "Nouvelle-Calédonie;", "Nouvelle-Zélande;", "Oman;", "Ouganda;", "Ouzbékistan;", "Pakistan;", "Palau;", "Palestine;", "Panama;", "Papouasie-Nouvelle-Guinée;", "Paraguay;", "Pays-Bas;", "Pérou;", "Philippines;", "Pitcairn;", "Pologne;", "Polynésie (français);", "Porto Rico;", "Portugal, Açores, Madère;", "Qatar;", "République Centrafricaine;", "République Dominicaine;", "République tchèque;", "Réunion;", "Roumanie;", "Royaume-Uni;", "Russie;", "Rwanda;", "Sahara occidental;", "Saint-Barthélemy;", "Saint-Christophe-et-Niévès;", "Saint-Eustache et Saba;", "Saint-Marin;", "Saint-Martin (France);", "Saint-Martin (Pays-Bas);", "Saint-Pierre-et-Miquelon;", "Saint-Vincent-et-les-Grenadines ;", "Sainte-Hélène - Tristan Da Cunha – Ascension ;", "Sainte-Lucie;", "Samoa;", "Samoa (Américain);", "Sao Tomé et Principe;", "Sénégal;", "Serbie;", "Seychelles;", "Sierra Leone;", "Singapour;", "Slovaquie;", "Slovénie;", "Somalie;", "Soudan;", "Soudan du Sud;", "Sri Lanka;", "Suède;", "Suisse;", "Suriname;", "Syrie;", "Tadjikistan;", "Taiwan;", "Tanzanie;", "Tchad;", "Thaïlande;", "Timor oriental;", "Togo;", "Tokelau (Nouvelle-Zélande);", "Tonga;", "Trinité et Tobago;", "Tunisie;", "Turkménistan;", "Turques-et-Caïques (britanniques);", "Turquie;", "Tuvalu;", "Ukraine;", "Uruguay;", "Vanuatu;", "Venezuela;", "Vietnam;", "Wallis-et-Futuna;", "Yémen;", "Zambie;", "Zimbabwe;"))
# names(data)[26] <- "D8"

# Convert to character first
data[, 26] <- as.character(data[, 26])

# Set variable label
attributes(data)$variable.labels[26] <- "Sélectionnez le pays concerné"

# Define the country codes (A1 to A235)
country_codes <- paste0("A", 1:235)

# Define country labels
country_labels <- c(
  "Afghanistan",
  "Afrique du Sud",
  "Albanie",
  "Algérie",
  "Allemagne",
  "Andorre",
  "Angola",
  "Anguilla",
  "Antarctique",
  "Antigua et Barbuda",
  "Arabie Saoudite",
  "Argentine",
  "Arménie",
  "Aruba",
  "Australie",
  "Autriche",
  "Azerbaïdjan",
  "Bahamas",
  "Bahreïn",
  "Bangladesh",
  "Barbade",
  "Bélize",
  "Bénin",
  "Bermudes",
  "Bhoutan",
  "Biélorussie",
  "Bolivie",
  "Bonaire",
  "Bosnie – Herzégovine",
  "Botswana",
  "Brésil",
  "Brunei",
  "Bulgarie",
  "Burkina Faso",
  "Burundi",
  "Cambodge",
  "Cameroun",
  "Canada",
  "Cap-Vert",
  "Chili",
  "Chine",
  "Chypre",
  "Colombie",
  "Comores",
  "Congo (-Brazzaville)",
  "Congo (République Démocratique)",
  "Corée du Nord",
  "Corée du Sud (République de Corée)",
  "Costa Rica",
  "Côte d'Ivoire",
  "Croatie",
  "Cuba",
  "Curaçao",
  "Danemark et îles Féroé",
  "Djibouti",
  "Dominique",
  "Egypte",
  "El Salvador",
  "Emirats Arabes Unis",
  "Equateur",
  "Erythrée",
  "Espagne et Iles Canaries",
  "Estonie",
  "eSwatini (Swaziland)",
  "États-Unis d'Amérique",
  "Ethiopie",
  "Fidji",
  "Finlande",
  "France",
  "Gabon",
  "Gambie",
  "Géorgie",
  "Ghana",
  "Gibraltar",
  "Grèce",
  "Grenade",
  "Groenland",
  "Guadeloupe",
  "Guam",
  "Guatemala",
  "Guinée-Bissau",
  "Guinée (Conakry)",
  "Guinée equatoriale",
  "Guyana (Georgetown)",
  "Guyane (Française)",
  "Haïti",
  "Honduras",
  "Hong Kong",
  "Hongrie",
  "Ile Christmas",
  "Iles Caïmans",
  "Iles Cook",
  "Iles Malouines",
  "Iles Marshall",
  "Iles Salomon",
  "Iles Vierges (américaines)",
  "Iles Vierges (britanniques)",
  "Inde",
  "Indonésie",
  "Irak",
  "Iran",
  "Irlande",
  "Islande",
  "Israël",
  "Italie",
  "Jamaïque",
  "Japon",
  "Jordanie",
  "Kazakhstan",
  "Kenya",
  "Kirghizistan",
  "Kiribati",
  "Kosovo",
  "Koweït",
  "Laos",
  "Lesotho",
  "Lettonie",
  "Liban",
  "Liberia",
  "Libye",
  "Liechtenstein",
  "Lituanie",
  "Luxembourg",
  "Macao (Chine)",
  "Macédoine du Nord",
  "Madagascar",
  "Malaisie",
  "Malawi",
  "Maldives",
  "Mali",
  "Malte",
  "Mariannes du Nord (américaines)",
  "Maroc",
  "Martinique",
  "Maurice",
  "Mauritanie",
  "Mayotte",
  "Mexique",
  "Micronesie",
  "Moldova",
  "Monaco",
  "Mongolie",
  "Monténégro",
  "Montserrat (britannique)",
  "Mozambique",
  "Myanmar",
  "Namibie",
  "Nauru",
  "Népal",
  "Nicaragua",
  "Niger",
  "Nigeria",
  "Niue",
  "Norvège",
  "Nouvelle-Calédonie",
  "Nouvelle-Zélande",
  "Oman",
  "Ouganda",
  "Ouzbékistan",
  "Pakistan",
  "Palau",
  "Palestine",
  "Panama",
  "Papouasie-Nouvelle-Guinée",
  "Paraguay",
  "Pays-Bas",
  "Pérou",
  "Philippines",
  "Pitcairn",
  "Pologne",
  "Polynésie (française)",
  "Porto Rico",
  "Portugal, Açores, Madère",
  "Qatar",
  "République Centrafricaine",
  "République Dominicaine",
  "République tchèque",
  "Réunion",
  "Roumanie",
  "Royaume-Uni",
  "Russie",
  "Rwanda",
  "Sahara occidental",
  "Saint-Barthélemy",
  "Saint-Christophe-et-Niévès",
  "Saint-Eustache et Saba",
  "Saint-Marin",
  "Saint-Martin (France)",
  "Saint-Martin (Pays-Bas)",
  "Saint-Pierre-et-Miquelon",
  "Saint-Vincent-et-les-Grenadines",
  "Sainte-Hélène - Tristan Da Cunha – Ascension",
  "Sainte-Lucie",
  "Samoa",
  "Samoa (Américain)",
  "Sao Tomé et Principe",
  "Sénégal",
  "Serbie",
  "Seychelles",
  "Sierra Leone",
  "Singapour",
  "Slovaquie",
  "Slovénie",
  "Somalie",
  "Soudan",
  "Soudan du Sud",
  "Sri Lanka",
  "Suède",
  "Suisse",
  "Suriname",
  "Syrie",
  "Tadjikistan",
  "Taiwan",
  "Tanzanie",
  "Tchad",
  "Thaïlande",
  "Timor oriental",
  "Togo",
  "Tokelau (Nouvelle-Zélande)",
  "Tonga",
  "Trinité et Tobago",
  "Tunisie",
  "Turkménistan",
  "Turques-et-Caïques (britanniques)",
  "Turquie",
  "Tuvalu",
  "Ukraine",
  "Uruguay",
  "Vanuatu",
  "Venezuela",
  "Vietnam",
  "Wallis-et-Futuna",
  "Yémen",
  "Zambie",
  "Zimbabwe"
)

# Reassign as factor
data[, 26] <- factor(
  data[, 26],
  levels = country_codes,
  labels = country_labels
)

# Rename the column
names(data)[26] <- "D8"

# LimeSurvey Field type: A
data[, 27] <- as.character(data[, 27])
attributes(data)$variable.labels[27] <- "[Autre] Sélectionnez le pays concerné"
names(data)[27] <- "D8_other"
# LimeSurvey Field type: A
data[, 28] <- as.character(data[, 28])
attributes(data)$variable.labels[
  28
] <- "Quel était votre principal statut professionnel juste avant (le début de)votre [la maladie] ?"
data[, 28] <- factor(
  data[, 28],
  levels = c("001", "002", "003", "004", "005", "006", "008"),
  labels = c(
    "Employé ou indépendant (emploi rémunéré)",
    "Demandeur/demandeuse d’emploi, chômage, CPAS",
    "Homme-femme au foyer, sans revenus",
    "Etudiant(e)",
    "Pensionné(e)",
    "Invalidité",
    "Je ne sais pas"
  )
)
names(data)[28] <- "D9"
# LimeSurvey Field type: A
data[, 29] <- as.character(data[, 29])
attributes(data)$variable.labels[
  29
] <- "[Autre] Quel était votre principal statut professionnel juste avant (le début de)votre [la maladie] ?"
names(data)[29] <- "D9_other"
# LimeSurvey Field type: F
data[, 30] <- as.numeric(data[, 30])
attributes(data)$variable.labels[
  30
] <- "Depuis le début de vos premier symptômes, avez-vous eu un emploi rémunéré?"
data[, 30] <- factor(
  data[, 30],
  levels = c(001, 002, 003),
  labels = c("Oui", "Non", "Je ne sais pas")
)
names(data)[30] <- "D10"
# LimeSurvey Field type: A
data[, 31] <- as.character(data[, 31])
attributes(data)$variable.labels[
  31
] <- "Actuellement, quel est votre principal statut professionnel?"
data[, 31] <- factor(
  data[, 31],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A8"),
  labels = c(
    "Emploi rémunéré (employé ou indépendant)",
    "Demandeur/demandeuse d’emploi, chômage, CPAS",
    "Homme-femme au foyer, sans revenus",
    "Etudiant(e)",
    "Pensionné(e)",
    "Invalidité",
    "Je ne sais pas"
  )
)
names(data)[31] <- "D11"
# LimeSurvey Field type: A
data[, 32] <- as.character(data[, 32])
attributes(data)$variable.labels[
  32
] <- "[Autre] Actuellement, quel est votre principal statut professionnel?"
names(data)[32] <- "D11_other"
# LimeSurvey Field type: F
data[, 33] <- as.numeric(data[, 33])
attributes(data)$variable.labels[
  33
] <- "En tenant compte de tous les revenus de votre ménage, dans quelle mesure parvenez-vous à joindre les deux bouts à la fin de chaque mois ?"
data[, 33] <- factor(
  data[, 33],
  levels = c(001, 002, 003, 004, 005, 006, 007),
  labels = c(
    "Très facilement",
    "Facilement",
    "Assez facilement",
    "Avec quelque difficulté",
    "Avec difficulté",
    "Avec grande difficulté",
    "Je ne sais pas"
  )
)
names(data)[33] <- "D12"
# LimeSurvey Field type: F
data[, 34] <- as.numeric(data[, 34])
attributes(data)$variable.labels[
  34
] <- "Depuis combien de temps approximativement avez-vous reçu le diagnostic de [la maladie]?"
data[, 34] <- factor(
  data[, 34],
  levels = c(001, 002, 003, 004, 005, 006, 007, 008, 009),
  labels = c(
    "Moins de 2 mois",
    "2 à 6 mois",
    "6 mois à 2 ans",
    "2 à 5 ans",
    "5 à 10 ans",
    "Plus de 10 ans",
    "Je ne sais pas",
    "Je n’ai pas reçu de diagnostic posé par un médecin",
    "009"
  )
)
names(data)[34] <- "D13"
# LimeSurvey Field type: F
data[, 35] <- as.numeric(data[, 35])
attributes(data)$variable.labels[
  35
] <- "Indiquez approximativement le nombre d\'années:"
names(data)[35] <- "D13b"
# LimeSurvey Field type: A
data[, 36] <- as.character(data[, 36])
attributes(data)$variable.labels[
  36
] <- "Merci beaucoup d’avoir complété ce questionnaire.  Malheureusement, vous ne rentrez pas dans les conditions pour pouvoir poursuivre cette étude. Si vous êtes intéressé(e)s par les résultats de cette étude, ils seront publiés sur le site Internet [site internet] [when]."
names(data)[36] <- "END2"
# LimeSurvey Field type: F
data[, 37] <- as.numeric(data[, 37])
attributes(data)$variable.labels[
  37
] <- "Combien de temps est passé entre votre premier rendez-vous médical pour [la maladie] et le diagnostic?"
data[, 37] <- factor(
  data[, 37],
  levels = c(001, 002, 003, 004, 005),
  labels = c(
    "Moins de 2 semaines",
    "Entre 2 semaines et 2 mois",
    "Entre 2 mois et 1 an",
    "Plus de 1 an",
    "Je ne sais pas"
  )
)
names(data)[37] <- "HC1"
# LimeSurvey Field type: F
data[, 38] <- as.numeric(data[, 38])
attributes(data)$variable.labels[
  38
] <- "Avez-vous déjà été hospitalisé(e) à cause de [la maladie]? Considérez uniquement les hospitalisations avec nuitée(s)"
data[, 38] <- factor(
  data[, 38],
  levels = c(001, 002, 003),
  labels = c("Oui", "Non", "Je ne sais pas")
)
names(data)[38] <- "DSD1"
# LimeSurvey Field type: A
data[, 39] <- as.character(data[, 39])
attributes(data)$variable.labels[
  39
] <- "[[Maladie /problème 1 ] ] Souffrez-vous d\'un ou plusieurs des problèmes de santé suivants pouvant-être associés à [la maladie] ?"
data[, 39] <- factor(
  data[, 39],
  levels = c("A1", "A2", "A3"),
  labels = c("Oui", "Non", "Je ne sais pas")
)
names(data)[39] <- "DSD2_001"
# LimeSurvey Field type: A
data[, 40] <- as.character(data[, 40])
attributes(data)$variable.labels[
  40
] <- "[[Maladie /problème 2  ] ] Souffrez-vous d\'un ou plusieurs des problèmes de santé suivants pouvant-être associés à [la maladie] ?"
data[, 40] <- factor(
  data[, 40],
  levels = c("A1", "A2", "A3"),
  labels = c("Oui", "Non", "Je ne sais pas")
)
names(data)[40] <- "DSD2_002"
# LimeSurvey Field type: A
data[, 41] <- as.character(data[, 41])
attributes(data)$variable.labels[
  41
] <- "[[Maladie /problème 3 ] ] Souffrez-vous d\'un ou plusieurs des problèmes de santé suivants pouvant-être associés à [la maladie] ?"
data[, 41] <- factor(
  data[, 41],
  levels = c("A1", "A2", "A3"),
  labels = c("Oui", "Non", "Je ne sais pas")
)
names(data)[41] <- "DSD2_003"
# LimeSurvey Field type: A
data[, 42] <- as.character(data[, 42])
attributes(data)$variable.labels[
  42
] <- "[[Etc.]] Souffrez-vous d\'un ou plusieurs des problèmes de santé suivants pouvant-être associés à [la maladie] ?"
data[, 42] <- factor(
  data[, 42],
  levels = c("A1", "A2", "A3"),
  labels = c("Oui", "Non", "Je ne sais pas")
)
names(data)[42] <- "DSD2_004"
# LimeSurvey Field type: A
data[, 43] <- as.character(data[, 43])
attributes(data)$variable.labels[
  43
] <- "Souffrez-vous également d’un ou de plusieurs autre(s) problème(s) de santé ?"
data[, 43] <- factor(
  data[, 43],
  levels = c("A1", "A2", "A3"),
  labels = c("Oui", "Non", "Je ne sais pas")
)
names(data)[43] <- "D14"
# LimeSurvey Field type: F
data[, 44] <- as.numeric(data[, 44])
attributes(data)$variable.labels[
  44
] <- "[Maladie du cœur ou des vaisseaux sanguins ] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
data[, 44] <- factor(
  data[, 44],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[44] <- "D15_2"
# LimeSurvey Field type: A
data[, 45] <- as.character(data[, 45])
attributes(data)$variable.labels[
  45
] <- "[Commentaire] [Maladie du cœur ou des vaisseaux sanguins ] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
names(data)[45] <- "D15_2comment"
# LimeSurvey Field type: F
data[, 46] <- as.numeric(data[, 46])
attributes(data)$variable.labels[
  46
] <- "[Maladie du système respiratoire ] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
data[, 46] <- factor(
  data[, 46],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[46] <- "D15_3"
# LimeSurvey Field type: A
data[, 47] <- as.character(data[, 47])
attributes(data)$variable.labels[
  47
] <- "[Commentaire] [Maladie du système respiratoire ] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
names(data)[47] <- "D15_3comment"
# LimeSurvey Field type: F
data[, 48] <- as.numeric(data[, 48])
attributes(data)$variable.labels[
  48
] <- "[Maladie de l\'appareil digestif ] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
data[, 48] <- factor(
  data[, 48],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[48] <- "D15_4"
# LimeSurvey Field type: A
data[, 49] <- as.character(data[, 49])
attributes(data)$variable.labels[
  49
] <- "[Commentaire] [Maladie de l\'appareil digestif ] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
names(data)[49] <- "D15_4comment"
# LimeSurvey Field type: F
data[, 50] <- as.numeric(data[, 50])
attributes(data)$variable.labels[
  50
] <- "[Maladie de la peau ] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
data[, 50] <- factor(
  data[, 50],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[50] <- "D15_5"
# LimeSurvey Field type: A
data[, 51] <- as.character(data[, 51])
attributes(data)$variable.labels[
  51
] <- "[Commentaire] [Maladie de la peau ] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
names(data)[51] <- "D15_5comment"
# LimeSurvey Field type: F
data[, 52] <- as.numeric(data[, 52])
attributes(data)$variable.labels[
  52
] <- "[Maladie des os, articulations, ou muscles ] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
data[, 52] <- factor(
  data[, 52],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[52] <- "D15_6"
# LimeSurvey Field type: A
data[, 53] <- as.character(data[, 53])
attributes(data)$variable.labels[
  53
] <- "[Commentaire] [Maladie des os, articulations, ou muscles ] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
names(data)[53] <- "D15_6comment"
# LimeSurvey Field type: F
data[, 54] <- as.numeric(data[, 54])
attributes(data)$variable.labels[
  54
] <- "[Trouble de santé mentale ou psychologique ] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
data[, 54] <- factor(
  data[, 54],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[54] <- "D15_7"
# LimeSurvey Field type: A
data[, 55] <- as.character(data[, 55])
attributes(data)$variable.labels[
  55
] <- "[Commentaire] [Trouble de santé mentale ou psychologique ] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
names(data)[55] <- "D15_7comment"
# LimeSurvey Field type: F
data[, 56] <- as.numeric(data[, 56])
attributes(data)$variable.labels[
  56
] <- "[Maladie du sang (hématologique)] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
data[, 56] <- factor(
  data[, 56],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[56] <- "D15_8"
# LimeSurvey Field type: A
data[, 57] <- as.character(data[, 57])
attributes(data)$variable.labels[
  57
] <- "[Commentaire] [Maladie du sang (hématologique)] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
names(data)[57] <- "D15_8comment"
# LimeSurvey Field type: F
data[, 58] <- as.numeric(data[, 58])
attributes(data)$variable.labels[
  58
] <- "[Maladie immunitaire ] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
data[, 58] <- factor(
  data[, 58],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[58] <- "D15_9"
# LimeSurvey Field type: A
data[, 59] <- as.character(data[, 59])
attributes(data)$variable.labels[
  59
] <- "[Commentaire] [Maladie immunitaire ] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
names(data)[59] <- "D15_9comment"
# LimeSurvey Field type: F
data[, 60] <- as.numeric(data[, 60])
attributes(data)$variable.labels[
  60
] <- "[Maladie endocrinienne, nutritionnelle, ou métabolique ] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
data[, 60] <- factor(
  data[, 60],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[60] <- "D15_10"
# LimeSurvey Field type: A
data[, 61] <- as.character(data[, 61])
attributes(data)$variable.labels[
  61
] <- "[Commentaire] [Maladie endocrinienne, nutritionnelle, ou métabolique ] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
names(data)[61] <- "D15_10comment"
# LimeSurvey Field type: F
data[, 62] <- as.numeric(data[, 62])
attributes(data)$variable.labels[
  62
] <- "[Maladie du système nerveux (neurologique) ] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
data[, 62] <- factor(
  data[, 62],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[62] <- "D15_11"
# LimeSurvey Field type: A
data[, 63] <- as.character(data[, 63])
attributes(data)$variable.labels[
  63
] <- "[Commentaire] [Maladie du système nerveux (neurologique) ] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
names(data)[63] <- "D15_11comment"
# LimeSurvey Field type: F
data[, 64] <- as.numeric(data[, 64])
attributes(data)$variable.labels[
  64
] <- "[Maladie de l\'œil] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
data[, 64] <- factor(
  data[, 64],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[64] <- "D15_12"
# LimeSurvey Field type: A
data[, 65] <- as.character(data[, 65])
attributes(data)$variable.labels[
  65
] <- "[Commentaire] [Maladie de l\'œil] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
names(data)[65] <- "D15_12comment"
# LimeSurvey Field type: F
data[, 66] <- as.numeric(data[, 66])
attributes(data)$variable.labels[
  66
] <- "[Maladie de l’oreille ou du système vestibulaire ] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
data[, 66] <- factor(
  data[, 66],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[66] <- "D15_13"
# LimeSurvey Field type: A
data[, 67] <- as.character(data[, 67])
attributes(data)$variable.labels[
  67
] <- "[Commentaire] [Maladie de l’oreille ou du système vestibulaire ] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
names(data)[67] <- "D15_13comment"
# LimeSurvey Field type: F
data[, 68] <- as.numeric(data[, 68])
attributes(data)$variable.labels[
  68
] <- "[Maladie des organes reproducteurs ou du système urinaire (par exemple vessie, reins) ] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
data[, 68] <- factor(
  data[, 68],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[68] <- "D15_14"
# LimeSurvey Field type: A
data[, 69] <- as.character(data[, 69])
attributes(data)$variable.labels[
  69
] <- "[Commentaire] [Maladie des organes reproducteurs ou du système urinaire (par exemple vessie, reins) ] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
names(data)[69] <- "D15_14comment"
# LimeSurvey Field type: F
data[, 70] <- as.numeric(data[, 70])
attributes(data)$variable.labels[
  70
] <- "[Maladie qui touche plusieurs systèmes ] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
data[, 70] <- factor(
  data[, 70],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[70] <- "D15_15"
# LimeSurvey Field type: A
data[, 71] <- as.character(data[, 71])
attributes(data)$variable.labels[
  71
] <- "[Commentaire] [Maladie qui touche plusieurs systèmes ] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
names(data)[71] <- "D15_15comment"
# LimeSurvey Field type: F
data[, 72] <- as.numeric(data[, 72])
attributes(data)$variable.labels[
  72
] <- "[Autre problème de santé sans diagnostic connu] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
data[, 72] <- factor(
  data[, 72],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[72] <- "D15_1"
# LimeSurvey Field type: A
data[, 73] <- as.character(data[, 73])
attributes(data)$variable.labels[
  73
] <- "[Commentaire] [Autre problème de santé sans diagnostic connu] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
names(data)[73] <- "D15_1comment"
# LimeSurvey Field type: F
data[, 74] <- as.numeric(data[, 74])
attributes(data)$variable.labels[
  74
] <- "[Je ne sais pas ] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
data[, 74] <- factor(
  data[, 74],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[74] <- "D15_16"
# LimeSurvey Field type: A
data[, 75] <- as.character(data[, 75])
attributes(data)$variable.labels[
  75
] <- "[Commentaire] [Je ne sais pas ] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
names(data)[75] <- "D15_16comment"
# LimeSurvey Field type: A
data[, 76] <- as.character(data[, 76])
attributes(data)$variable.labels[
  76
] <- "[Autre] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
names(data)[76] <- "D15_other"
# LimeSurvey Field type: A
data[, 77] <- as.character(data[, 77])
attributes(data)$variable.labels[
  77
] <- "[Commentaire pour autre] De quels autres problèmes de santé souffrez-vous?Vous pouvez cocher plusieurs cases. Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “autre problème de santé sans diagnostic connu“."
names(data)[77] <- "D15_othercomment"
# LimeSurvey Field type: F
data[, 78] <- as.numeric(data[, 78])
attributes(data)$variable.labels[
  78
] <- "Votre mobilité avant vos premiers symptômes de [la maladie]"
data[, 78] <- factor(
  data[, 78],
  levels = c(001, 002, 003, 004, 005, 006),
  labels = c(
    "Je n’avais aucun problème pour me déplacer à pied.",
    "J’avais des problèmes légers pour me déplacer à pied.",
    "J’avais des problèmes modérés pour me déplacer à pied.",
    "J’avais des problèmes sévères pour me déplacer à pied.",
    "J’étais incapable de me déplacer à pied.",
    "Je ne sais pas"
  )
)
names(data)[78] <- "H1"
# LimeSurvey Field type: F
data[, 79] <- as.numeric(data[, 79])
attributes(data)$variable.labels[
  79
] <- "Votre autonomie avant vos premiers symptômes de [la maladie]"
data[, 79] <- factor(
  data[, 79],
  levels = c(001, 002, 003, 004, 005, 006),
  labels = c(
    "Je n’avais aucun problème pour me laver ou m’habiller tout(e) seul(e).",
    "J’avais des problèmes légers pour me laver ou m’habiller tout(e) seul(e).",
    "J’avais des problèmes modérés pour me laver ou m’habiller tout(e) seul(e).",
    "J’avais des problèmes sévères pour me laver ou m’habiller tout(e) seul(e).",
    "J’étais incapable de me laver ou de m’habiller tout(e) seul(e).",
    "Je ne sais pas"
  )
)
names(data)[79] <- "H2"
# LimeSurvey Field type: F
data[, 80] <- as.numeric(data[, 80])
attributes(data)$variable.labels[
  80
] <- "Vos activités courantes avant vos premiers symptômes de [la maladie] (Par exemple: travail, études, travaux ménagers, activités familiales ou loisirs)"
data[, 80] <- factor(
  data[, 80],
  levels = c(001, 002, 003, 004, 005, 006),
  labels = c(
    "Je n’avais aucun problème pour accomplir mes activités courantes.",
    "J’avais des problèmes légers pour accomplir mes activités courantes.",
    "J’avais des problèmes modérés pour accomplir mes activités courantes.",
    "J’avais des problèmes sévères pour accomplir mes activités courantes.",
    "J’étais incapable d’accomplir mes activités courantes.",
    "Je ne sais pas"
  )
)
names(data)[80] <- "H3"
# LimeSurvey Field type: F
data[, 81] <- as.numeric(data[, 81])
attributes(data)$variable.labels[
  81
] <- "Votre douleur ou gêne avant vos premiers symptômes de [la maladie]"
data[, 81] <- factor(
  data[, 81],
  levels = c(001, 002, 003, 004, 005, 006),
  labels = c(
    "Je n’avais ni douleur ni gêne.",
    "J’avais des douleurs ou une gêne légère(s).",
    "J’avais des douleurs ou une gêne modérée(s).",
    "J’avais des douleurs ou une gêne sévère(s).",
    "J’avais des douleurs ou une gêne extrême(s).",
    "Je ne sais pas"
  )
)
names(data)[81] <- "H4"
# LimeSurvey Field type: F
data[, 82] <- as.numeric(data[, 82])
attributes(data)$variable.labels[
  82
] <- "Votre anxiété ou dépression avant vos premiers symptômes de [la maladie]"
data[, 82] <- factor(
  data[, 82],
  levels = c(001, 002, 003, 004, 005, 006),
  labels = c(
    "Je n’étais ni anxieux(se), ni déprimé(e).",
    "J’étais légèrement anxieux(se) ou déprimé(e).",
    "J’étais modérément anxieux(se) ou déprimé(e).",
    "J’étais sévèrement anxieux(se) ou déprimé(e).",
    "J’étais extrêmement anxieux(se) ou déprimé(e).",
    "Je ne sais pas"
  )
)
names(data)[82] <- "H5"
# LimeSurvey Field type: F
data[, 83] <- as.numeric(data[, 83])
attributes(data)$variable.labels[
  83
] <- "Nous aimerions savoir dans quelle mesure votre santé était bonne ou mauvaiseAVANT vos premiers symptômes de [la maladie] sur une échelle de 0 à 100.  100 correspond à la meilleure santé que vous puissiez imaginer.0 correspond à la pire santé que vous puissiez imaginer.  Veuillez entrer un nombre entre 0 et 100 afin d’indiquer votre état de santé AVANT vos premiers symptômes de [la maladie]."
names(data)[83] <- "H6"
# LimeSurvey Field type: A
data[, 84] <- as.character(data[, 84])
attributes(data)$variable.labels[
  84
] <- "Nous aimerions connaitre votre état de santé actuel, tel que vous le vivez aujourd\'hui. Veuillez cocher la case à côté de l\'affirmation qui décrit le mieux votre santé AUJOURD\'HUI."
names(data)[84] <- "TXT"
# LimeSurvey Field type: A
data[, 85] <- as.character(data[, 85])
attributes(data)$variable.labels[85] <- "Votre mobilité aujourd\'hui"
data[, 85] <- factor(
  data[, 85],
  levels = c("Jena1", "Jena2", "Jena3", "Jena4", "Jena5", "Jena6"),
  labels = c(
    "Je n’ai aucun problème pour me déplacer à pied.",
    "J’ai des problèmes légers pour me déplacer à pied.",
    "J’ai des problèmes modérés pour me déplacer à pied.",
    "J’ai des problèmes sévères pour me déplacer à pied.",
    "Je suis incapable de me déplacer à pied.",
    "Je ne sais pas"
  )
)
names(data)[85] <- "H7"
# LimeSurvey Field type: F
data[, 86] <- as.numeric(data[, 86])
attributes(data)$variable.labels[86] <- "Votre autonomie aujourd\'hui"
data[, 86] <- factor(
  data[, 86],
  levels = c(001, 002, 003, 004, 005, 006),
  labels = c(
    "Je n’ai aucun problème pour me laver ou m’habiller tout(e) seul(e).",
    "J’ai des problèmes légers pour me laver ou m’habiller tout(e) seul(e).",
    "J’ai des problèmes modérés pour me laver ou m’habiller tout(e) seul(e).",
    "J’ai des problèmes sévères pour me laver ou m’habiller tout(e) seul(e).",
    "Je suis incapable de me laver ou de m’habiller tout(e) seul(e).",
    "Je ne sais pas"
  )
)
names(data)[86] <- "H8"
# LimeSurvey Field type: F
data[, 87] <- as.numeric(data[, 87])
attributes(data)$variable.labels[
  87
] <- "Vos activités courantes aujourd\'hui (Par exemple: travail, études, travaux ménagers, activités familiales ou loisirs)"
data[, 87] <- factor(
  data[, 87],
  levels = c(001, 002, 003, 004, 005, 006),
  labels = c(
    "Je n’ai aucun problème pour accomplir mes activités courantes.",
    "J’ai des problèmes légers pour accomplir mes activités courantes.",
    "J’ai des problèmes modérés pour accomplir mes activités courantes.",
    "J’ai des problèmes sévères pour accomplir mes activités courantes.",
    "Je suis incapable d’accomplir mes activités courantes.",
    "Je ne sais pas."
  )
)
names(data)[87] <- "H9"
# LimeSurvey Field type: F
data[, 88] <- as.numeric(data[, 88])
attributes(data)$variable.labels[88] <- "Votre douleur ou gêne aujourd\'hui"
data[, 88] <- factor(
  data[, 88],
  levels = c(001, 002, 003, 004, 005, 006),
  labels = c(
    "Je n’ai ni douleur ni gêne.",
    "J’ai des douleurs ou une gêne légère(s).",
    "J’ai des douleurs ou une gêne modérée(s).",
    "J’ai des douleurs ou une gêne sévère(s).",
    "J’ai des douleurs ou une gêne extrême(s).",
    "Je ne sais pas"
  )
)
names(data)[88] <- "H10"
# LimeSurvey Field type: F
data[, 89] <- as.numeric(data[, 89])
attributes(data)$variable.labels[
  89
] <- "Votre anxiété ou dépression aujourd\'hui"
data[, 89] <- factor(
  data[, 89],
  levels = c(001, 002, 003, 004, 005, 006),
  labels = c(
    "Je ne suis ni anxieux(se), ni déprimé(e).",
    "Je suis légèrement anxieux(se) ou déprimé(e).",
    "Je suis modérément anxieux(se) ou déprimé(e).",
    "Je suis sévèrement anxieux(se) ou déprimé(e).",
    "Je suis extrêmement anxieux(se) ou déprimé(e).",
    "Je ne sais pas"
  )
)
names(data)[89] <- "H11"
# LimeSurvey Field type: F
data[, 90] <- as.numeric(data[, 90])
attributes(data)$variable.labels[
  90
] <- "Nous aimerions savoir dans quelle mesure votre santé est bonne ou mauvaiseAUJOURD\'HUI sur une échelle de 0 à 100.  100 correspond à la meilleure santé que vous puissiez imaginer.0 correspond à la pire santé que vous puissiez imaginer.  Veuillez entrer un nombre entre 0 et 100 afin d’indiquer votre état de santéAUJOURD\'HUI."
names(data)[90] <- "H12"
# LimeSurvey Field type: A
data[, 91] <- as.character(data[, 91])
attributes(data)$variable.labels[
  91
] <- "Avez-vous reçu un traitement lié à votre [la maladie] dans les 5 dernières années?"
data[, 91] <- factor(
  data[, 91],
  levels = c("A1", "A2", "A3"),
  labels = c("Oui", "Non", "Je ne sais pas")
)
names(data)[91] <- "HC2"
# LimeSurvey Field type: F
data[, 92] <- as.numeric(data[, 92])
attributes(data)$variable.labels[
  92
] <- "[[Médicament type 1]] Quels traitements avez-vous reçus pour votre [la maladie] dans les 5 dernières années ?"
data[, 92] <- factor(
  data[, 92],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[92] <- "HC3_SQ005"
# LimeSurvey Field type: F
data[, 93] <- as.numeric(data[, 93])
attributes(data)$variable.labels[
  93
] <- "[[Médicament type 2 ] ] Quels traitements avez-vous reçus pour votre [la maladie] dans les 5 dernières années ?"
data[, 93] <- factor(
  data[, 93],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[93] <- "HC3_SQ006"
# LimeSurvey Field type: F
data[, 94] <- as.numeric(data[, 94])
attributes(data)$variable.labels[
  94
] <- "[[Médicament type 3 ]] Quels traitements avez-vous reçus pour votre [la maladie] dans les 5 dernières années ?"
data[, 94] <- factor(
  data[, 94],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[94] <- "HC3_SQ007"
# LimeSurvey Field type: F
data[, 95] <- as.numeric(data[, 95])
attributes(data)$variable.labels[
  95
] <- "[[etc.]] Quels traitements avez-vous reçus pour votre [la maladie] dans les 5 dernières années ?"
data[, 95] <- factor(
  data[, 95],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[95] <- "HC3_SQ008"
# LimeSurvey Field type: F
data[, 96] <- as.numeric(data[, 96])
attributes(data)$variable.labels[
  96
] <- "[[Kinésithérapie]] Quels traitements avez-vous reçus pour votre [la maladie] dans les 5 dernières années ?"
data[, 96] <- factor(
  data[, 96],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[96] <- "HC3_SQ001"
# LimeSurvey Field type: F
data[, 97] <- as.numeric(data[, 97])
attributes(data)$variable.labels[
  97
] <- "[[Adaptation de l’alimentation ]] Quels traitements avez-vous reçus pour votre [la maladie] dans les 5 dernières années ?"
data[, 97] <- factor(
  data[, 97],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[97] <- "HC3_SQ002"
# LimeSurvey Field type: F
data[, 98] <- as.numeric(data[, 98])
attributes(data)$variable.labels[
  98
] <- "[[Intervention chirurgicale ]] Quels traitements avez-vous reçus pour votre [la maladie] dans les 5 dernières années ?"
data[, 98] <- factor(
  data[, 98],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[98] <- "HC3_SQ003"
# LimeSurvey Field type: F
data[, 99] <- as.numeric(data[, 99])
attributes(data)$variable.labels[
  99
] <- "[Je ne sais pas ] Quels traitements avez-vous reçus pour votre [la maladie] dans les 5 dernières années ?"
data[, 99] <- factor(
  data[, 99],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[99] <- "HC3_SQ004"
# LimeSurvey Field type: A
data[, 100] <- as.character(data[, 100])
attributes(data)$variable.labels[
  100
] <- "[Autre] Quels traitements avez-vous reçus pour votre [la maladie] dans les 5 dernières années ?"
names(data)[100] <- "HC3_other"
# LimeSurvey Field type: F
data[, 101] <- as.numeric(data[, 101])
attributes(data)$variable.labels[
  101
] <- "[[Effet indésirable 1]] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement de [la maladie] dans les 5 dernières années?"
data[, 101] <- factor(
  data[, 101],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[101] <- "HC4_SQ005"
# LimeSurvey Field type: F
data[, 102] <- as.numeric(data[, 102])
attributes(data)$variable.labels[
  102
] <- "[[Effet indésirable 2]] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement de [la maladie] dans les 5 dernières années?"
data[, 102] <- factor(
  data[, 102],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[102] <- "HC4_SQ006"
# LimeSurvey Field type: F
data[, 103] <- as.numeric(data[, 103])
attributes(data)$variable.labels[
  103
] <- "[[Effet indésirable 3]] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement de [la maladie] dans les 5 dernières années?"
data[, 103] <- factor(
  data[, 103],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[103] <- "HC4_SQ007"
# LimeSurvey Field type: F
data[, 104] <- as.numeric(data[, 104])
attributes(data)$variable.labels[
  104
] <- "[[etc ]] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement de [la maladie] dans les 5 dernières années?"
data[, 104] <- factor(
  data[, 104],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[104] <- "HC4_SQ008"
# LimeSurvey Field type: F
data[, 105] <- as.numeric(data[, 105])
attributes(data)$variable.labels[
  105
] <- "[[Changement d\'apparence]] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement de [la maladie] dans les 5 dernières années?"
data[, 105] <- factor(
  data[, 105],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[105] <- "HC4_SQ001"
# LimeSurvey Field type: F
data[, 106] <- as.numeric(data[, 106])
attributes(data)$variable.labels[
  106
] <- "[[Fatigue ou épuisement]] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement de [la maladie] dans les 5 dernières années?"
data[, 106] <- factor(
  data[, 106],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[106] <- "HC4_SQ002"
# LimeSurvey Field type: F
data[, 107] <- as.numeric(data[, 107])
attributes(data)$variable.labels[
  107
] <- "[[Complications de la chirurgie]] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement de [la maladie] dans les 5 dernières années?"
data[, 107] <- factor(
  data[, 107],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[107] <- "HC4_SQ003"
# LimeSurvey Field type: F
data[, 108] <- as.numeric(data[, 108])
attributes(data)$variable.labels[
  108
] <- "[Autre effet indésirable] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement de [la maladie] dans les 5 dernières années?"
data[, 108] <- factor(
  data[, 108],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[108] <- "HC4_SQ010"
# LimeSurvey Field type: F
data[, 109] <- as.numeric(data[, 109])
attributes(data)$variable.labels[
  109
] <- "[Aucun effet indésirable ] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement de [la maladie] dans les 5 dernières années?"
data[, 109] <- factor(
  data[, 109],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[109] <- "HC4_SQ004"
# LimeSurvey Field type: F
data[, 110] <- as.numeric(data[, 110])
attributes(data)$variable.labels[
  110
] <- "[Je ne sais pas] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement de [la maladie] dans les 5 dernières années?"
data[, 110] <- factor(
  data[, 110],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[110] <- "HC4_SQ009"
# LimeSurvey Field type: A
data[, 111] <- as.character(data[, 111])
attributes(data)$variable.labels[
  111
] <- "[Effet indésirable 1] Quel(s) autre(s) effet(s) indésirable(s)?"
names(data)[111] <- "HC4b_SQ001"
# LimeSurvey Field type: A
data[, 112] <- as.character(data[, 112])
attributes(data)$variable.labels[
  112
] <- "[Effet indésirable 2] Quel(s) autre(s) effet(s) indésirable(s)?"
names(data)[112] <- "HC4b_SQ002"
# LimeSurvey Field type: A
data[, 113] <- as.character(data[, 113])
attributes(data)$variable.labels[
  113
] <- "[Effet indésirable 3] Quel(s) autre(s) effet(s) indésirable(s)?"
names(data)[113] <- "HC4b_SQ003"
# LimeSurvey Field type: A
data[, 114] <- as.character(data[, 114])
attributes(data)$variable.labels[
  114
] <- "[Effet indésirable 4] Quel(s) autre(s) effet(s) indésirable(s)?"
names(data)[114] <- "HC4b_SQ004"
# LimeSurvey Field type: A
data[, 115] <- as.character(data[, 115])
attributes(data)$variable.labels[
  115
] <- "[Effet indésirable 5] Quel(s) autre(s) effet(s) indésirable(s)?"
names(data)[115] <- "HC4b_SQ005"
# LimeSurvey Field type: A
data[, 116] <- as.character(data[, 116])
attributes(data)$variable.labels[
  116
] <- "[[Effet indésirable 1]] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 116] <- factor(
  data[, 116],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Pas du tout pénible",
    "Légèrement pénible",
    "Modérément pénible",
    "Très pénible",
    "Extrêmement pénible",
    "Je ne sais pas"
  )
)
names(data)[116] <- "HC5_SQ005"
# LimeSurvey Field type: A
data[, 117] <- as.character(data[, 117])
attributes(data)$variable.labels[
  117
] <- "[[Effet indésirable 2]] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 117] <- factor(
  data[, 117],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Pas du tout pénible",
    "Légèrement pénible",
    "Modérément pénible",
    "Très pénible",
    "Extrêmement pénible",
    "Je ne sais pas"
  )
)
names(data)[117] <- "HC5_SQ006"
# LimeSurvey Field type: A
data[, 118] <- as.character(data[, 118])
attributes(data)$variable.labels[
  118
] <- "[[Effet indésirable 3]] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 118] <- factor(
  data[, 118],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Pas du tout pénible",
    "Légèrement pénible",
    "Modérément pénible",
    "Très pénible",
    "Extrêmement pénible",
    "Je ne sais pas"
  )
)
names(data)[118] <- "HC5_SQ007"
# LimeSurvey Field type: A
data[, 119] <- as.character(data[, 119])
attributes(data)$variable.labels[
  119
] <- "[[etc ]] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 119] <- factor(
  data[, 119],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Pas du tout pénible",
    "Légèrement pénible",
    "Modérément pénible",
    "Très pénible",
    "Extrêmement pénible",
    "Je ne sais pas"
  )
)
names(data)[119] <- "HC5_SQ008"
# LimeSurvey Field type: A
data[, 120] <- as.character(data[, 120])
attributes(data)$variable.labels[
  120
] <- "[[Changement d\'apparence]] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 120] <- factor(
  data[, 120],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Pas du tout pénible",
    "Légèrement pénible",
    "Modérément pénible",
    "Très pénible",
    "Extrêmement pénible",
    "Je ne sais pas"
  )
)
names(data)[120] <- "HC5_SQ001"
# LimeSurvey Field type: A
data[, 121] <- as.character(data[, 121])
attributes(data)$variable.labels[
  121
] <- "[[Fatigue ou épuisement]] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 121] <- factor(
  data[, 121],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Pas du tout pénible",
    "Légèrement pénible",
    "Modérément pénible",
    "Très pénible",
    "Extrêmement pénible",
    "Je ne sais pas"
  )
)
names(data)[121] <- "HC5_SQ002"
# LimeSurvey Field type: A
data[, 122] <- as.character(data[, 122])
attributes(data)$variable.labels[
  122
] <- "[[Complications de la chirurgie]] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 122] <- factor(
  data[, 122],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Pas du tout pénible",
    "Légèrement pénible",
    "Modérément pénible",
    "Très pénible",
    "Extrêmement pénible",
    "Je ne sais pas"
  )
)
names(data)[122] <- "HC5_SQ003"
# LimeSurvey Field type: A
data[, 123] <- as.character(data[, 123])
attributes(data)$variable.labels[
  123
] <- "[{HC4b_SQ001.shown}] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 123] <- factor(
  data[, 123],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Pas du tout pénible",
    "Légèrement pénible",
    "Modérément pénible",
    "Très pénible",
    "Extrêmement pénible",
    "Je ne sais pas"
  )
)
names(data)[123] <- "HC5_SQ010"
# LimeSurvey Field type: A
data[, 124] <- as.character(data[, 124])
attributes(data)$variable.labels[
  124
] <- "[{HC4b_SQ002.shown}] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 124] <- factor(
  data[, 124],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Pas du tout pénible",
    "Légèrement pénible",
    "Modérément pénible",
    "Très pénible",
    "Extrêmement pénible",
    "Je ne sais pas"
  )
)
names(data)[124] <- "HC5_SQ011"
# LimeSurvey Field type: A
data[, 125] <- as.character(data[, 125])
attributes(data)$variable.labels[
  125
] <- "[{HC4b_SQ003.shown}] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 125] <- factor(
  data[, 125],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Pas du tout pénible",
    "Légèrement pénible",
    "Modérément pénible",
    "Très pénible",
    "Extrêmement pénible",
    "Je ne sais pas"
  )
)
names(data)[125] <- "HC5_SQ012"
# LimeSurvey Field type: A
data[, 126] <- as.character(data[, 126])
attributes(data)$variable.labels[
  126
] <- "[{HC4b_SQ004.shown}] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 126] <- factor(
  data[, 126],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Pas du tout pénible",
    "Légèrement pénible",
    "Modérément pénible",
    "Très pénible",
    "Extrêmement pénible",
    "Je ne sais pas"
  )
)
names(data)[126] <- "HC5_SQ013"
# LimeSurvey Field type: A
data[, 127] <- as.character(data[, 127])
attributes(data)$variable.labels[
  127
] <- "[{HC4b_SQ005.shown}] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 127] <- factor(
  data[, 127],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Pas du tout pénible",
    "Légèrement pénible",
    "Modérément pénible",
    "Très pénible",
    "Extrêmement pénible",
    "Je ne sais pas"
  )
)
names(data)[127] <- "HC5_SQ014"
# LimeSurvey Field type: F
data[, 128] <- as.numeric(data[, 128])
attributes(data)$variable.labels[
  128
] <- "En dehors des effets indésirables, dans quelle mesure le traitement que vous avez reçu pour [la maladie] au cours des 5 dernières années a-t-il été pénible pour vous? Par exemple, en raison de l\'administration par injection, du besoin de se rendre à l\'hôpital pour recevoir le traitement, de la nécessité de conserver le médicament au frigo, d\'un horaire de prise contraignant, etc."
data[, 128] <- factor(
  data[, 128],
  levels = c(001, 002, 003, 004, 005, 006),
  labels = c(
    "Pas du tout pénible",
    "Légèrement pénible",
    "Modérément pénible",
    "Très pénible",
    "Extrêmement pénible",
    "Je ne sais pas"
  )
)
names(data)[128] <- "HC6"
# LimeSurvey Field type: A
data[, 129] <- as.character(data[, 129])
attributes(data)$variable.labels[
  129
] <- "Depuis le début de votre maladie, avez-vous eu une intervention chirurgicale (p.ex. [exemples de procédures pertinentes à la maladie]) en raison de votre [la maladie]?"
data[, 129] <- factor(
  data[, 129],
  levels = c("A1", "A2", "A3"),
  labels = c("Oui", "Non", "Je ne sais pas")
)
names(data)[129] <- "DSHC1"
# LimeSurvey Field type: A
data[, 130] <- as.character(data[, 130])
attributes(data)$variable.labels[
  130
] <- "[[Symptôme spécifique 1]] Depuis que vous êtes suivi(e) ou traité(e) pour la maladie, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous? Ne tenez pas compte des effets indésirables du traitement."
data[, 130] <- factor(
  data[, 130],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Je n\'ai pas eu ce symptôme",
    "Pas du tout pénible",
    "Légèrement pénible",
    "Modérément pénible",
    "Très pénible",
    "Extrêmement pénible",
    "Je ne sais pas"
  )
)
names(data)[130] <- "H13_SQ013"
# LimeSurvey Field type: A
data[, 131] <- as.character(data[, 131])
attributes(data)$variable.labels[
  131
] <- "[[Symptôme spécifique 2]] Depuis que vous êtes suivi(e) ou traité(e) pour la maladie, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous? Ne tenez pas compte des effets indésirables du traitement."
data[, 131] <- factor(
  data[, 131],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Je n\'ai pas eu ce symptôme",
    "Pas du tout pénible",
    "Légèrement pénible",
    "Modérément pénible",
    "Très pénible",
    "Extrêmement pénible",
    "Je ne sais pas"
  )
)
names(data)[131] <- "H13_SQ014"
# LimeSurvey Field type: A
data[, 132] <- as.character(data[, 132])
attributes(data)$variable.labels[
  132
] <- "[Maux de tête ] Depuis que vous êtes suivi(e) ou traité(e) pour la maladie, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous? Ne tenez pas compte des effets indésirables du traitement."
data[, 132] <- factor(
  data[, 132],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Je n\'ai pas eu ce symptôme",
    "Pas du tout pénible",
    "Légèrement pénible",
    "Modérément pénible",
    "Très pénible",
    "Extrêmement pénible",
    "Je ne sais pas"
  )
)
names(data)[132] <- "H13_SQ001"
# LimeSurvey Field type: A
data[, 133] <- as.character(data[, 133])
attributes(data)$variable.labels[
  133
] <- "[Problèmes de concentration ] Depuis que vous êtes suivi(e) ou traité(e) pour la maladie, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous? Ne tenez pas compte des effets indésirables du traitement."
data[, 133] <- factor(
  data[, 133],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Je n\'ai pas eu ce symptôme",
    "Pas du tout pénible",
    "Légèrement pénible",
    "Modérément pénible",
    "Très pénible",
    "Extrêmement pénible",
    "Je ne sais pas"
  )
)
names(data)[133] <- "H13_SQ002"
# LimeSurvey Field type: A
data[, 134] <- as.character(data[, 134])
attributes(data)$variable.labels[
  134
] <- "[Manque d\'énergie ] Depuis que vous êtes suivi(e) ou traité(e) pour la maladie, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous? Ne tenez pas compte des effets indésirables du traitement."
data[, 134] <- factor(
  data[, 134],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Je n\'ai pas eu ce symptôme",
    "Pas du tout pénible",
    "Légèrement pénible",
    "Modérément pénible",
    "Très pénible",
    "Extrêmement pénible",
    "Je ne sais pas"
  )
)
names(data)[134] <- "H13_SQ003"
# LimeSurvey Field type: A
data[, 135] <- as.character(data[, 135])
attributes(data)$variable.labels[
  135
] <- "[Fatigue ou épuisement ] Depuis que vous êtes suivi(e) ou traité(e) pour la maladie, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous? Ne tenez pas compte des effets indésirables du traitement."
data[, 135] <- factor(
  data[, 135],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Je n\'ai pas eu ce symptôme",
    "Pas du tout pénible",
    "Légèrement pénible",
    "Modérément pénible",
    "Très pénible",
    "Extrêmement pénible",
    "Je ne sais pas"
  )
)
names(data)[135] <- "H13_SQ004"
# LimeSurvey Field type: A
data[, 136] <- as.character(data[, 136])
attributes(data)$variable.labels[
  136
] <- "[Sentiments d\'agitation, de nervosité, ou d’irritabilité ] Depuis que vous êtes suivi(e) ou traité(e) pour la maladie, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous? Ne tenez pas compte des effets indésirables du traitement."
data[, 136] <- factor(
  data[, 136],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Je n\'ai pas eu ce symptôme",
    "Pas du tout pénible",
    "Légèrement pénible",
    "Modérément pénible",
    "Très pénible",
    "Extrêmement pénible",
    "Je ne sais pas"
  )
)
names(data)[136] <- "H13_SQ005"
# LimeSurvey Field type: A
data[, 137] <- as.character(data[, 137])
attributes(data)$variable.labels[
  137
] <- "[Colère ou agressivité ] Depuis que vous êtes suivi(e) ou traité(e) pour la maladie, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous? Ne tenez pas compte des effets indésirables du traitement."
data[, 137] <- factor(
  data[, 137],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Je n\'ai pas eu ce symptôme",
    "Pas du tout pénible",
    "Légèrement pénible",
    "Modérément pénible",
    "Très pénible",
    "Extrêmement pénible",
    "Je ne sais pas"
  )
)
names(data)[137] <- "H13_SQ006"
# LimeSurvey Field type: A
data[, 138] <- as.character(data[, 138])
attributes(data)$variable.labels[
  138
] <- "[Changements d\'humeur ] Depuis que vous êtes suivi(e) ou traité(e) pour la maladie, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous? Ne tenez pas compte des effets indésirables du traitement."
data[, 138] <- factor(
  data[, 138],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Je n\'ai pas eu ce symptôme",
    "Pas du tout pénible",
    "Légèrement pénible",
    "Modérément pénible",
    "Très pénible",
    "Extrêmement pénible",
    "Je ne sais pas"
  )
)
names(data)[138] <- "H13_SQ007"
# LimeSurvey Field type: A
data[, 139] <- as.character(data[, 139])
attributes(data)$variable.labels[
  139
] <- "[Peur ou anxiété ] Depuis que vous êtes suivi(e) ou traité(e) pour la maladie, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous? Ne tenez pas compte des effets indésirables du traitement."
data[, 139] <- factor(
  data[, 139],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Je n\'ai pas eu ce symptôme",
    "Pas du tout pénible",
    "Légèrement pénible",
    "Modérément pénible",
    "Très pénible",
    "Extrêmement pénible",
    "Je ne sais pas"
  )
)
names(data)[139] <- "H13_SQ008"
# LimeSurvey Field type: A
data[, 140] <- as.character(data[, 140])
attributes(data)$variable.labels[
  140
] <- "[Sentiment d\'abattement, de déprime, ou de tristesse ] Depuis que vous êtes suivi(e) ou traité(e) pour la maladie, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous? Ne tenez pas compte des effets indésirables du traitement."
data[, 140] <- factor(
  data[, 140],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Je n\'ai pas eu ce symptôme",
    "Pas du tout pénible",
    "Légèrement pénible",
    "Modérément pénible",
    "Très pénible",
    "Extrêmement pénible",
    "Je ne sais pas"
  )
)
names(data)[140] <- "H13_SQ009"
# LimeSurvey Field type: A
data[, 141] <- as.character(data[, 141])
attributes(data)$variable.labels[
  141
] <- "[Stress] Depuis que vous êtes suivi(e) ou traité(e) pour la maladie, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous? Ne tenez pas compte des effets indésirables du traitement."
data[, 141] <- factor(
  data[, 141],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Je n\'ai pas eu ce symptôme",
    "Pas du tout pénible",
    "Légèrement pénible",
    "Modérément pénible",
    "Très pénible",
    "Extrêmement pénible",
    "Je ne sais pas"
  )
)
names(data)[141] <- "H13_SQ015"
# LimeSurvey Field type: A
data[, 142] <- as.character(data[, 142])
attributes(data)$variable.labels[
  142
] <- "[Stigma ou sentiment de discrimination ] Depuis que vous êtes suivi(e) ou traité(e) pour la maladie, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous? Ne tenez pas compte des effets indésirables du traitement."
data[, 142] <- factor(
  data[, 142],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Je n\'ai pas eu ce symptôme",
    "Pas du tout pénible",
    "Légèrement pénible",
    "Modérément pénible",
    "Très pénible",
    "Extrêmement pénible",
    "Je ne sais pas"
  )
)
names(data)[142] <- "H13_SQ010"
# LimeSurvey Field type: A
data[, 143] <- as.character(data[, 143])
attributes(data)$variable.labels[
  143
] <- "[Perte de confiance en soi ] Depuis que vous êtes suivi(e) ou traité(e) pour la maladie, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous? Ne tenez pas compte des effets indésirables du traitement."
data[, 143] <- factor(
  data[, 143],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Je n\'ai pas eu ce symptôme",
    "Pas du tout pénible",
    "Légèrement pénible",
    "Modérément pénible",
    "Très pénible",
    "Extrêmement pénible",
    "Je ne sais pas"
  )
)
names(data)[143] <- "H13_SQ011"
# LimeSurvey Field type: A
data[, 144] <- as.character(data[, 144])
attributes(data)$variable.labels[
  144
] <- "[Autre symptôme] Depuis que vous êtes suivi(e) ou traité(e) pour la maladie, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous? Ne tenez pas compte des effets indésirables du traitement."
data[, 144] <- factor(
  data[, 144],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Je n\'ai pas eu ce symptôme",
    "Pas du tout pénible",
    "Légèrement pénible",
    "Modérément pénible",
    "Très pénible",
    "Extrêmement pénible",
    "Je ne sais pas"
  )
)
names(data)[144] <- "H13_SQ012"
# LimeSurvey Field type: A
data[, 145] <- as.character(data[, 145])
attributes(data)$variable.labels[145] <- "Quel autre symptôme?"
names(data)[145] <- "H13b"
# LimeSurvey Field type: F
data[, 146] <- as.numeric(data[, 146])
attributes(data)$variable.labels[
  146
] <- "Dans quelle mesure est-ce que [la maladie] a interféré avec votre vie sexuelle ?"
data[, 146] <- factor(
  data[, 146],
  levels = c(001, 002, 003, 004, 005, 006, 007, 008),
  labels = c(
    "Pas du tout",
    "Légèrement",
    "Modérément",
    "Beaucoup",
    "Extrêmement",
    "Je ne sais pas",
    "Ne s’applique pas",
    "Je ne veux pas répondre"
  )
)
names(data)[146] <- "H14"
# LimeSurvey Field type: F
data[, 147] <- as.numeric(data[, 147])
attributes(data)$variable.labels[
  147
] <- "Dans quelle mesure votre [la maladie] a-t-elle interferé avec votre vie reproductive, c’est-à-dire avec votre possibilité ou décision de concevoir naturellement des enfants ou de mener à terme une grossesse?Par exemple: recours à une FIV (Fécondation in Vitro), dépistage génétique, don de sperme/ovocytes, nécessité de retarder une grossesse, ou renoncer à avoir des enfants biologiques à cause de la maladie"
data[, 147] <- factor(
  data[, 147],
  levels = c(001, 002, 003, 004, 005, 006, 007, 008),
  labels = c(
    "Pas du tout",
    "Légèrement",
    "Modérément",
    "Beaucoup",
    "Extrêmement",
    "Je ne sais pas",
    "Ne s’applique pas (par exemple, vous n\'avez pas encore envisagé d\'avoir des enfants, ou vous n\'étiez pas touché par la m",
    "Je ne veux pas répondre"
  )
)
names(data)[147] <- "H15"
# LimeSurvey Field type: A
data[, 148] <- as.character(data[, 148])
attributes(data)$variable.labels[
  148
] <- "Par \'prise en charge\' nous entendons l\'ensemble des rendez-vous, traitements, et accompagnements proposés par les professionnels de santé pour gérer et améliorer votre état de santé en lien avec [la maladie]."
names(data)[148] <- "INFO"
# LimeSurvey Field type: F
data[, 149] <- as.numeric(data[, 149])
attributes(data)$variable.labels[
  149
] <- "Considérez-vous que votre prise en charge a été bien organisée et planifiée au fil du temps?"
data[, 149] <- factor(
  data[, 149],
  levels = c(001, 002, 003, 004, 005, 006),
  labels = c(
    "Toujours",
    "Souvent",
    "Parfois",
    "Rarement",
    "Jamais",
    "Je ne sais pas"
  )
)
names(data)[149] <- "HC7"
# LimeSurvey Field type: F
data[, 150] <- as.numeric(data[, 150])
attributes(data)$variable.labels[
  150
] <- "Avez-vous un ou plusieurs professionnels de santé qui sont responsables de la coordination des différents services médicaux dont vous avez besoin? "
data[, 150] <- factor(
  data[, 150],
  levels = c(001, 002, 003, 004),
  labels = c(
    "Oui",
    "Non",
    "Je ne sais pas",
    "Ne s’applique pas : le suivi se fait uniquement dans un service, sans besoin de coordination"
  )
)
names(data)[150] <- "HC8"
# LimeSurvey Field type: F
data[, 151] <- as.numeric(data[, 151])
attributes(data)$variable.labels[
  151
] <- "Dans quelle mesure voyez-vous le(s) même(s) professionnel(s) de santé pendant vos rendez-vous ou examens réguliers ?"
data[, 151] <- factor(
  data[, 151],
  levels = c(001, 002, 003, 004, 005, 006, 007),
  labels = c(
    "Toujours",
    "Souvent",
    "Parfois",
    "Rarement",
    "Jamais",
    "Je ne sais pas",
    "007"
  )
)
names(data)[151] <- "HC9"
# LimeSurvey Field type: F
data[, 152] <- as.numeric(data[, 152])
attributes(data)$variable.labels[
  152
] <- "Dans quelle mesure recevez-vous suffisamment d\'informations utiles et compréhensibles de la part de vos professionnels de santé?"
data[, 152] <- factor(
  data[, 152],
  levels = c(001, 002, 003, 004, 005, 006),
  labels = c(
    "Toujours",
    "Souvent",
    "Parfois",
    "Rarement",
    "Jamais",
    "Je ne sais pas"
  )
)
names(data)[152] <- "HC10"
# LimeSurvey Field type: F
data[, 153] <- as.numeric(data[, 153])
attributes(data)$variable.labels[
  153
] <- "Etes-vous impliqué(e) autant que vous le souhaitez (ou souhaitiez) dans les décisions concernant vos soins ou votre traitement ?"
data[, 153] <- factor(
  data[, 153],
  levels = c(001, 002, 003, 004, 005, 006, 007),
  labels = c(
    "Oui, certainement",
    "Oui, dans une certaine mesure",
    "Non, pas vraiment",
    "Non, certainement pas",
    "Non, mais je ne voulais de toute façon pas être impliqué(e)",
    "Pas applicable: pas de décisions prises à propos du traitement",
    "Je ne sais pas"
  )
)
names(data)[153] <- "HC11"
# LimeSurvey Field type: A
data[, 154] <- as.character(data[, 154])
attributes(data)$variable.labels[
  154
] <- "Au cours des 12 derniers mois, y a-t-il des soins pour [la maladie] que vous n’avez pas obtenus alors que vous en auriez eu besoin ?Il peut s’agir d’une consultation, d’un traitement, d’analyses médicales, de rééducation, ou autre."
data[, 154] <- factor(
  data[, 154],
  levels = c("A1", "A2", "A3"),
  labels = c("Oui", "Non", "Je ne sais pas")
)
names(data)[154] <- "HC12"
# LimeSurvey Field type: F
data[, 155] <- as.numeric(data[, 155])
attributes(data)$variable.labels[
  155
] <- "[Distance entre le domicile et le lieu de soins ] Pour quelle(s) raison(s) principale(s) n\'avez-vous pas reçu les soins dont vous aviez besoin?"
data[, 155] <- factor(
  data[, 155],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[155] <- "HC13_001"
# LimeSurvey Field type: F
data[, 156] <- as.numeric(data[, 156])
attributes(data)$variable.labels[
  156
] <- "[Problème de transport (par exemple pas de transport en commun à proximité, pas de véhicule personnel, impossibilité de conduire votre propre véhicule, personne pour vous emmener sur le lieu de vos soins) ] Pour quelle(s) raison(s) principale(s) n\'avez-vous pas reçu les soins dont vous aviez besoin?"
data[, 156] <- factor(
  data[, 156],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[156] <- "HC13_002"
# LimeSurvey Field type: F
data[, 157] <- as.numeric(data[, 157])
attributes(data)$variable.labels[
  157
] <- "[Manque de personnel compétent pour vous administrer les soins dont vous avez besoin ] Pour quelle(s) raison(s) principale(s) n\'avez-vous pas reçu les soins dont vous aviez besoin?"
data[, 157] <- factor(
  data[, 157],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[157] <- "HC13_003"
# LimeSurvey Field type: F
data[, 158] <- as.numeric(data[, 158])
attributes(data)$variable.labels[
  158
] <- "[Délais d’attente très longs ] Pour quelle(s) raison(s) principale(s) n\'avez-vous pas reçu les soins dont vous aviez besoin?"
data[, 158] <- factor(
  data[, 158],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[158] <- "HC13_004"
# LimeSurvey Field type: F
data[, 159] <- as.numeric(data[, 159])
attributes(data)$variable.labels[
  159
] <- "[Difficultés pour payer les soins ] Pour quelle(s) raison(s) principale(s) n\'avez-vous pas reçu les soins dont vous aviez besoin?"
data[, 159] <- factor(
  data[, 159],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[159] <- "HC13_005"
# LimeSurvey Field type: F
data[, 160] <- as.numeric(data[, 160])
attributes(data)$variable.labels[
  160
] <- "[Peur des examens médicaux, de l’hôpital, ou d\'autre chose ] Pour quelle(s) raison(s) principale(s) n\'avez-vous pas reçu les soins dont vous aviez besoin?"
data[, 160] <- factor(
  data[, 160],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[160] <- "HC13_006"
# LimeSurvey Field type: F
data[, 161] <- as.numeric(data[, 161])
attributes(data)$variable.labels[
  161
] <- "[Manque de temps à cause du travail, des enfants, ou autre ] Pour quelle(s) raison(s) principale(s) n\'avez-vous pas reçu les soins dont vous aviez besoin?"
data[, 161] <- factor(
  data[, 161],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[161] <- "HC13_007"
# LimeSurvey Field type: F
data[, 162] <- as.numeric(data[, 162])
attributes(data)$variable.labels[
  162
] <- "[Manque d’information ] Pour quelle(s) raison(s) principale(s) n\'avez-vous pas reçu les soins dont vous aviez besoin?"
data[, 162] <- factor(
  data[, 162],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[162] <- "HC13_008"
# LimeSurvey Field type: F
data[, 163] <- as.numeric(data[, 163])
attributes(data)$variable.labels[
  163
] <- "[Difficultés liées à la langue ] Pour quelle(s) raison(s) principale(s) n\'avez-vous pas reçu les soins dont vous aviez besoin?"
data[, 163] <- factor(
  data[, 163],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[163] <- "HC13_009"
# LimeSurvey Field type: A
data[, 164] <- as.character(data[, 164])
attributes(data)$variable.labels[
  164
] <- "[Autre] Pour quelle(s) raison(s) principale(s) n\'avez-vous pas reçu les soins dont vous aviez besoin?"
names(data)[164] <- "HC13_other"
# LimeSurvey Field type: F
data[, 165] <- as.numeric(data[, 165])
attributes(data)$variable.labels[
  165
] <- "Dans quelle mesure votre scolarité ou vos études ont-elles été affectées par votre maladie, en termes de présence, de performance, de réussite, ou de choix d\'études?"
data[, 165] <- factor(
  data[, 165],
  levels = c(001, 002, 003, 004, 005, 006, 007),
  labels = c(
    "Pas du tout",
    "Légèrement",
    "Modérément",
    "Beaucoup",
    "Extrêmement",
    "Je ne sais pas",
    "Ne s’applique pas : la maladie est survenue après la fin de ma scolarité/mes études"
  )
)
names(data)[165] <- "S1"
# LimeSurvey Field type: A
data[, 166] <- as.character(data[, 166])
attributes(data)$variable.labels[
  166
] <- "En raison de [la maladie], avez-vous diminué votre temps de travail?"
data[, 166] <- factor(
  data[, 166],
  levels = c("001", "002", "003", "005"),
  labels = c(
    "Oui, je travaille moins qu\'avant en raison de ma maladie",
    "Oui, j’ai arrêté de travailler en raison de ma maladie",
    "Non, la maladie n’a pas eu d’impact sur mon temps de travail",
    "Je ne sais pas"
  )
)
names(data)[166] <- "S2"
# LimeSurvey Field type: A
data[, 167] <- as.character(data[, 167])
attributes(data)$variable.labels[
  167
] <- "[Autre] En raison de [la maladie], avez-vous diminué votre temps de travail?"
names(data)[167] <- "S2_other"
# LimeSurvey Field type: A
data[, 168] <- as.character(data[, 168])
attributes(data)$variable.labels[
  168
] <- "Combien de temps, approximativement, avez-vous été en incapacité de travailler en raison de votre maladie ? Veuillez donner une estimation approximative du TOTAL de tous les arrêts de travail ou congés maladie, qu’ils soient consécutifs ou non. Par exemple : si vous avez été en arrêt pendant 1 mois, puis, plus tard, pendant 2 mois cocher « de 3 à 6 mois »"
data[, 168] <- factor(
  data[, 168],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05"),
  labels = c(
    "Pendant moins de 1 mois",
    "Pendant 1 à 3 mois",
    "Pendant 4 mois à 1 an",
    "Pendant plus de 1 an",
    "Je ne sais pas"
  )
)
names(data)[168] <- "S3"
# LimeSurvey Field type: F
data[, 169] <- as.numeric(data[, 169])
attributes(data)$variable.labels[
  169
] <- "Indiquez approximativement le nombre d\'années:"
names(data)[169] <- "S3b"
# LimeSurvey Field type: A
data[, 170] <- as.character(data[, 170])
attributes(data)$variable.labels[
  170
] <- "La prochaine question concerne les sept derniers jours, sans inclure aujourd’hui."
names(data)[170] <- "TEXTS4"
# LimeSurvey Field type: F
data[, 171] <- as.numeric(data[, 171])
attributes(data)$variable.labels[
  171
] <- "[| [La maladie] n’a eu aucun effet sur mon travail | En raison de [ma maladie], je n’ai pas pu travailler du tout] Au cours des sept derniers jours, dans quelle mesure [la maladie] a-t-elle affecté votre productivité pendant que vous travailliez ? Pensez aux jours où vous avez été limité dans la quantité ou le type de travail que vous pouviez effectuer, aux jours où vous avez accompli moins que vous ne l\'auriez souhaité ou aux jours, où vous n\'avez pas pu faire votre travail avec autant de soin que d\'habitude. Si [la maladie] n\'a que peu affecté votre travail, choisissez un chiffre faible. Choisissez un chiffre élevé si la maladie a beaucoup affecté votre travail.  "
names(data)[171] <- "S4_SQ001"
# LimeSurvey Field type: F
data[, 172] <- as.numeric(data[, 172])
attributes(data)$variable.labels[
  172
] <- "Dans quelle mesure votre [maladie] ou traitement médical vous a-t-il causé des difficultés financières?"
data[, 172] <- factor(
  data[, 172],
  levels = c(001, 002, 003, 004, 005, 006),
  labels = c(
    "Pas du tout",
    "Légèrement",
    "Modérément",
    "Beaucoup",
    "Extrêmement",
    "Je ne sais pas"
  )
)
names(data)[172] <- "S5"
# LimeSurvey Field type: A
data[, 173] <- as.character(data[, 173])
attributes(data)$variable.labels[
  173
] <- "Dans quelle mesure votre maladie interfère-t-elle avec vos relations avec la famille, votre partenaire, vos amis, ou voisins ?"
data[, 173] <- factor(
  data[, 173],
  levels = c("A001", "A002", "A003", "A004", "A005", "A006"),
  labels = c(
    "Pas du tout",
    "Légèrement",
    "Modérément",
    "Beaucoup",
    "Extrêmement",
    "Je ne sais pas"
  )
)
names(data)[173] <- "S6"
# LimeSurvey Field type: F
data[, 174] <- as.numeric(data[, 174])
attributes(data)$variable.labels[
  174
] <- "[Aucun soutien supplémentaire ] À cause de [la maladie], de quels types de soutien supplémentaire avez-vous eu besoin,sans y être parvenu jusqu\'à présent?"
data[, 174] <- factor(
  data[, 174],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[174] <- "S7_SQ001"
# LimeSurvey Field type: F
data[, 175] <- as.numeric(data[, 175])
attributes(data)$variable.labels[
  175
] <- "[Aide logistique (par exemple:nettoyage, cuisine, courses, transport, garde d\'enfants)] À cause de [la maladie], de quels types de soutien supplémentaire avez-vous eu besoin,sans y être parvenu jusqu\'à présent?"
data[, 175] <- factor(
  data[, 175],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[175] <- "S7_SQ002"
# LimeSurvey Field type: F
data[, 176] <- as.numeric(data[, 176])
attributes(data)$variable.labels[
  176
] <- "[Parler à d’autres patients atteints de [la maladie] ] À cause de [la maladie], de quels types de soutien supplémentaire avez-vous eu besoin,sans y être parvenu jusqu\'à présent?"
data[, 176] <- factor(
  data[, 176],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[176] <- "S7_SQ003"
# LimeSurvey Field type: F
data[, 177] <- as.numeric(data[, 177])
attributes(data)$variable.labels[
  177
] <- "[Soutien psychologique ] À cause de [la maladie], de quels types de soutien supplémentaire avez-vous eu besoin,sans y être parvenu jusqu\'à présent?"
data[, 177] <- factor(
  data[, 177],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[177] <- "S7_SQ004"
# LimeSurvey Field type: F
data[, 178] <- as.numeric(data[, 178])
attributes(data)$variable.labels[
  178
] <- "[Soutien médical ] À cause de [la maladie], de quels types de soutien supplémentaire avez-vous eu besoin,sans y être parvenu jusqu\'à présent?"
data[, 178] <- factor(
  data[, 178],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[178] <- "S7_SQ005"
# LimeSurvey Field type: F
data[, 179] <- as.numeric(data[, 179])
attributes(data)$variable.labels[
  179
] <- "[Aide administrative ou sociale ] À cause de [la maladie], de quels types de soutien supplémentaire avez-vous eu besoin,sans y être parvenu jusqu\'à présent?"
data[, 179] <- factor(
  data[, 179],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[179] <- "S7_SQ006"
# LimeSurvey Field type: F
data[, 180] <- as.numeric(data[, 180])
attributes(data)$variable.labels[
  180
] <- "[Soutien pour l\'adaptation de l\'environnement, ou matériel adapté] À cause de [la maladie], de quels types de soutien supplémentaire avez-vous eu besoin,sans y être parvenu jusqu\'à présent?"
data[, 180] <- factor(
  data[, 180],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[180] <- "S7_SQ007"
# LimeSurvey Field type: F
data[, 181] <- as.numeric(data[, 181])
attributes(data)$variable.labels[
  181
] <- "[Soutien pour le retour au travail ] À cause de [la maladie], de quels types de soutien supplémentaire avez-vous eu besoin,sans y être parvenu jusqu\'à présent?"
data[, 181] <- factor(
  data[, 181],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[181] <- "S7_SQ008"
# LimeSurvey Field type: F
data[, 182] <- as.numeric(data[, 182])
attributes(data)$variable.labels[
  182
] <- "[Soutien scolaire ou pour les études] À cause de [la maladie], de quels types de soutien supplémentaire avez-vous eu besoin,sans y être parvenu jusqu\'à présent?"
data[, 182] <- factor(
  data[, 182],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[182] <- "S7_SQ009"
# LimeSurvey Field type: F
data[, 183] <- as.numeric(data[, 183])
attributes(data)$variable.labels[
  183
] <- "[Accompagnement spirituel ou religieux ] À cause de [la maladie], de quels types de soutien supplémentaire avez-vous eu besoin,sans y être parvenu jusqu\'à présent?"
data[, 183] <- factor(
  data[, 183],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[183] <- "S7_SQ010"
# LimeSurvey Field type: F
data[, 184] <- as.numeric(data[, 184])
attributes(data)$variable.labels[
  184
] <- "[Je ne sais pas] À cause de [la maladie], de quels types de soutien supplémentaire avez-vous eu besoin,sans y être parvenu jusqu\'à présent?"
data[, 184] <- factor(
  data[, 184],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[184] <- "S7_SQ012"
# LimeSurvey Field type: A
data[, 185] <- as.character(data[, 185])
attributes(data)$variable.labels[
  185
] <- "[Autre] À cause de [la maladie], de quels types de soutien supplémentaire avez-vous eu besoin,sans y être parvenu jusqu\'à présent?"
names(data)[185] <- "S7_other"
# LimeSurvey Field type: A
data[, 186] <- as.character(data[, 186])
attributes(data)$variable.labels[
  186
] <- "[L’Impact sur la qualité de vie générale (impact sur la mobilité, l\'autonomie, la capacité à vous habiller et laver seul, la gêne ou douleur, l\'anxiété ou la dépression] Selon vous, quels aspects de votre maladie ou de sa prise en charge devraient être améliorés en priorité ?Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 186] <- factor(
  data[, 186],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Pas du tout prioritaire",
    "Légèrement prioritaire",
    "Modérément prioritaire",
    "Très prioritaire",
    "Extrêmement prioritaire",
    "Je ne sais pas"
  )
)
names(data)[186] <- "P1_001"
# LimeSurvey Field type: A
data[, 187] <- as.character(data[, 187])
attributes(data)$variable.labels[
  187
] <- "[L’impact sur votre santé physique (symptômes physiques, gêne ou douleur liées à la maladie)] Selon vous, quels aspects de votre maladie ou de sa prise en charge devraient être améliorés en priorité ?Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 187] <- factor(
  data[, 187],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Pas du tout prioritaire",
    "Légèrement prioritaire",
    "Modérément prioritaire",
    "Très prioritaire",
    "Extrêmement prioritaire",
    "Je ne sais pas"
  )
)
names(data)[187] <- "P1_002"
# LimeSurvey Field type: A
data[, 188] <- as.character(data[, 188])
attributes(data)$variable.labels[
  188
] <- "[L’impact sur votre santé psychologique (symptômes psychologiques, anxiété, ou dépression liées à la maladie)] Selon vous, quels aspects de votre maladie ou de sa prise en charge devraient être améliorés en priorité ?Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 188] <- factor(
  data[, 188],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Pas du tout prioritaire",
    "Légèrement prioritaire",
    "Modérément prioritaire",
    "Très prioritaire",
    "Extrêmement prioritaire",
    "Je ne sais pas"
  )
)
names(data)[188] <- "P1_003"
# LimeSurvey Field type: A
data[, 189] <- as.character(data[, 189])
attributes(data)$variable.labels[
  189
] <- "[L’impact sur votre autonomie (impact sur votre mobilité, sur votre capacité à vous laver et habiller seul(e)] Selon vous, quels aspects de votre maladie ou de sa prise en charge devraient être améliorés en priorité ?Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 189] <- factor(
  data[, 189],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Pas du tout prioritaire",
    "Légèrement prioritaire",
    "Modérément prioritaire",
    "Très prioritaire",
    "Extrêmement prioritaire",
    "Je ne sais pas"
  )
)
names(data)[189] <- "P1_004"
# LimeSurvey Field type: A
data[, 190] <- as.character(data[, 190])
attributes(data)$variable.labels[
  190
] <- "[L’impact sur votre vie sexuelle et reproductive] Selon vous, quels aspects de votre maladie ou de sa prise en charge devraient être améliorés en priorité ?Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 190] <- factor(
  data[, 190],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Pas du tout prioritaire",
    "Légèrement prioritaire",
    "Modérément prioritaire",
    "Très prioritaire",
    "Extrêmement prioritaire",
    "Je ne sais pas"
  )
)
names(data)[190] <- "P1_005"
# LimeSurvey Field type: A
data[, 191] <- as.character(data[, 191])
attributes(data)$variable.labels[
  191
] <- "[L’impact sur l’espérance de vie] Selon vous, quels aspects de votre maladie ou de sa prise en charge devraient être améliorés en priorité ?Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 191] <- factor(
  data[, 191],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Pas du tout prioritaire",
    "Légèrement prioritaire",
    "Modérément prioritaire",
    "Très prioritaire",
    "Extrêmement prioritaire",
    "Je ne sais pas"
  )
)
names(data)[191] <- "P1_006"
# LimeSurvey Field type: A
data[, 192] <- as.character(data[, 192])
attributes(data)$variable.labels[
  192
] <- "[L’impact sur votre scolarité ou vos études] Selon vous, quels aspects de votre maladie ou de sa prise en charge devraient être améliorés en priorité ?Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 192] <- factor(
  data[, 192],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Pas du tout prioritaire",
    "Légèrement prioritaire",
    "Modérément prioritaire",
    "Très prioritaire",
    "Extrêmement prioritaire",
    "Je ne sais pas"
  )
)
names(data)[192] <- "P1_007"
# LimeSurvey Field type: A
data[, 193] <- as.character(data[, 193])
attributes(data)$variable.labels[
  193
] <- "[L’impact sur votre travail] Selon vous, quels aspects de votre maladie ou de sa prise en charge devraient être améliorés en priorité ?Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 193] <- factor(
  data[, 193],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Pas du tout prioritaire",
    "Légèrement prioritaire",
    "Modérément prioritaire",
    "Très prioritaire",
    "Extrêmement prioritaire",
    "Je ne sais pas"
  )
)
names(data)[193] <- "P1_008"
# LimeSurvey Field type: A
data[, 194] <- as.character(data[, 194])
attributes(data)$variable.labels[
  194
] <- "[L’impact financier] Selon vous, quels aspects de votre maladie ou de sa prise en charge devraient être améliorés en priorité ?Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 194] <- factor(
  data[, 194],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Pas du tout prioritaire",
    "Légèrement prioritaire",
    "Modérément prioritaire",
    "Très prioritaire",
    "Extrêmement prioritaire",
    "Je ne sais pas"
  )
)
names(data)[194] <- "P1_009"
# LimeSurvey Field type: A
data[, 195] <- as.character(data[, 195])
attributes(data)$variable.labels[
  195
] <- "[L’impact de la maladie sur votre vie sociale (relations avec la famille, votre partenaire, ou vos amis] Selon vous, quels aspects de votre maladie ou de sa prise en charge devraient être améliorés en priorité ?Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 195] <- factor(
  data[, 195],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Pas du tout prioritaire",
    "Légèrement prioritaire",
    "Modérément prioritaire",
    "Très prioritaire",
    "Extrêmement prioritaire",
    "Je ne sais pas"
  )
)
names(data)[195] <- "P1_010"
# LimeSurvey Field type: A
data[, 196] <- as.character(data[, 196])
attributes(data)$variable.labels[
  196
] <- "[La qualité de votre prise en charge (la rapidité du diagnostic, programmes de dépistage de la maladie, la coordination et la continuité des soins, les informations reçues par les professionnels de santé, l’implication dans les décisions concernant vos soins ou traitements)] Selon vous, quels aspects de votre maladie ou de sa prise en charge devraient être améliorés en priorité ?Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 196] <- factor(
  data[, 196],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Pas du tout prioritaire",
    "Légèrement prioritaire",
    "Modérément prioritaire",
    "Très prioritaire",
    "Extrêmement prioritaire",
    "Je ne sais pas"
  )
)
names(data)[196] <- "P1_011"
# LimeSurvey Field type: A
data[, 197] <- as.character(data[, 197])
attributes(data)$variable.labels[
  197
] <- "[L’accès aux soins de santé (obtenir des soins lorsque vous en avez besoin, la disponibilité du traitement)] Selon vous, quels aspects de votre maladie ou de sa prise en charge devraient être améliorés en priorité ?Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 197] <- factor(
  data[, 197],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Pas du tout prioritaire",
    "Légèrement prioritaire",
    "Modérément prioritaire",
    "Très prioritaire",
    "Extrêmement prioritaire",
    "Je ne sais pas"
  )
)
names(data)[197] <- "P1_012"
# LimeSurvey Field type: A
data[, 198] <- as.character(data[, 198])
attributes(data)$variable.labels[
  198
] <- "[Les connaissances scientifiques (par exemple en termes de diagnostic, de traitement, ou de pronostic)] Selon vous, quels aspects de votre maladie ou de sa prise en charge devraient être améliorés en priorité ?Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 198] <- factor(
  data[, 198],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Pas du tout prioritaire",
    "Légèrement prioritaire",
    "Modérément prioritaire",
    "Très prioritaire",
    "Extrêmement prioritaire",
    "Je ne sais pas"
  )
)
names(data)[198] <- "P1_013"
# LimeSurvey Field type: A
data[, 199] <- as.character(data[, 199])
attributes(data)$variable.labels[
  199
] <- "[L’efficacité du traitement (capacité du traitement à guérir la maladie, à améliorer les symptômes ou la qualité de vie)] Selon vous, quels aspects de votre maladie ou de sa prise en charge devraient être améliorés en priorité ?Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 199] <- factor(
  data[, 199],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Pas du tout prioritaire",
    "Légèrement prioritaire",
    "Modérément prioritaire",
    "Très prioritaire",
    "Extrêmement prioritaire",
    "Je ne sais pas"
  )
)
names(data)[199] <- "P1_014"
# LimeSurvey Field type: A
data[, 200] <- as.character(data[, 200])
attributes(data)$variable.labels[
  200
] <- "[La pénibilité du traitement (en termes d’effets indésirables ou en termes de logistique/administration du traitement). ] Selon vous, quels aspects de votre maladie ou de sa prise en charge devraient être améliorés en priorité ?Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 200] <- factor(
  data[, 200],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Pas du tout prioritaire",
    "Légèrement prioritaire",
    "Modérément prioritaire",
    "Très prioritaire",
    "Extrêmement prioritaire",
    "Je ne sais pas"
  )
)
names(data)[200] <- "P1_015"
# LimeSurvey Field type: F
data[, 201] <- as.numeric(data[, 201])
attributes(data)$variable.labels[
  201
] <- "Souhaitez-vous nous faire part d\'un ou de plusieurs autres besoins importants en lien avec [la maladie] que vous n\'avez pas pu exprimer dans le questionnaire ?"
data[, 201] <- factor(data[, 201], levels = c(1, 2), labels = c("Yes", "No"))
names(data)[201] <- "G1"
# LimeSurvey Field type: A
data[, 202] <- as.character(data[, 202])
attributes(data)$variable.labels[
  202
] <- "Quels besoins n\'ont pas été abordés dans le questionnaire ?"
names(data)[202] <- "G2"
# LimeSurvey Field type: F
data[, 203] <- as.numeric(data[, 203])
attributes(data)$variable.labels[
  203
] <- "En tant que personne remplissant le questionnaire pour quelqu’un atteint de [la maladie] : vous considérez-vous comme « aidant proche» ? C’est-à-dire venant en aide à cette personne en raison de sa maladie, de manière régulière et à titre non professionnel. Par exemple, un parent aidant son enfant, un membre de la famille ou un ami aidant un proche."
data[, 203] <- factor(data[, 203], levels = c(1, 2), labels = c("Yes", "No"))
names(data)[203] <- "CG1"
# LimeSurvey Field type: F
data[, 204] <- as.numeric(data[, 204])
attributes(data)$variable.labels[
  204
] <- "Par rapport à la personne que vous aidez, vous êtes : [cochez la réponse appropriée]"
data[, 204] <- factor(
  data[, 204],
  levels = c(001, 002, 003),
  labels = c(
    "Un membre de la famille (par exemple, parent, enfant, grand-parent…)",
    "Une relation proche (par exemple, ami, voisin…)",
    "Autre : veuillez préciser."
  )
)
names(data)[204] <- "CG2"
# LimeSurvey Field type: A
data[, 205] <- as.character(data[, 205])
attributes(data)$variable.labels[
  205
] <- "[Commentaire] Par rapport à la personne que vous aidez, vous êtes : [cochez la réponse appropriée]"
names(data)[205] <- "CG2_comment"
# LimeSurvey Field type: F
data[, 206] <- as.numeric(data[, 206])
attributes(data)$variable.labels[206] <- "À quel genre vous identifiez-vous ?"
data[, 206] <- factor(
  data[, 206],
  levels = c(001, 002, 003),
  labels = c("Homme", "Femme", "Autre")
)
names(data)[206] <- "CG3"
# LimeSurvey Field type: F
data[, 207] <- as.numeric(data[, 207])
attributes(data)$variable.labels[207] <- "Quelle est votre année de naissance ?"
names(data)[207] <- "CG4"
# LimeSurvey Field type: F
data[, 208] <- as.numeric(data[, 208])
attributes(data)$variable.labels[
  208
] <- "La semaine dernière, combien de temps avez-vous passé à aider la personne dans des activités qu\'elle aurait normalement faites elle-même si elle était en bonne santé ? Par exemple dans les soins personnels (comme s’habiller/se déshabiller, aller aux toilettes…), les tâches ménagères (comme préparer les repas, nettoyer…) ou le soutien pratique (comme l’accompagner à l’extérieur à des rendez-vous médicaux ou autres…)."
names(data)[208] <- "CG5"
# LimeSurvey Field type: A
data[, 209] <- as.character(data[, 209])
attributes(data)$variable.labels[
  209
] <- "Selon vous, dans quelle mesure votre santé physique et/ou psychologique est impactée en raison de votre rôle d’aidant proche?"
data[, 209] <- factor(
  data[, 209],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Pas du tout",
    "Légèrement",
    "Modérément",
    "Beaucoup",
    "Extrêmement",
    "Je ne sais pas"
  )
)
names(data)[209] <- "CG6"
# LimeSurvey Field type: A
data[, 210] <- as.character(data[, 210])
attributes(data)$variable.labels[
  210
] <- "Selon vous, dans quelle mesure votre vie sociale est impactée en raison de votre rôle d’aidant proche?"
data[, 210] <- factor(
  data[, 210],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Pas du tout",
    "Légèrement",
    "Modérément",
    "Beaucoup",
    "Extrêmement",
    "Je ne sais pas"
  )
)
names(data)[210] <- "CG7"
# LimeSurvey Field type: F
data[, 211] <- as.numeric(data[, 211])
attributes(data)$variable.labels[
  211
] <- "Nous aimerions en savoir plus sur les besoins et les difficultés que vous rencontrez ou avez rencontrés dans le contexte de votre [maladie]. Si vous le souhaitez, vous pouvez participer à un entretien individuel (en ligne ou en face à face avec un chercheur) pour discuter plus en détail de vos expériences et de vos besoins. Cet entretien se déroulera de manière confidentielle et n\'aura pas d\'impact sur les soins que vous recevez de la part des professionnels. Il est prévu que [X] patients soient interrogés. Cet entretien individuel durera environ une heure et demie.  Souhaitez-vous participer à un entretien individuel?"
data[, 211] <- factor(data[, 211], levels = c(1, 2), labels = c("Yes", "No"))
names(data)[211] <- "Follow"
# LimeSurvey Field type: A
data[, 212] <- as.character(data[, 212])
attributes(data)$variable.labels[
  212
] <- "[Nom] Merci de nous communiquer vos coordonnées afin que nous puissions vous contacter."
names(data)[212] <- "NOM_NAME"
# LimeSurvey Field type: A
data[, 213] <- as.character(data[, 213])
attributes(data)$variable.labels[
  213
] <- "[Prénom] Merci de nous communiquer vos coordonnées afin que nous puissions vous contacter."
names(data)[213] <- "NOM_FNAME"
# LimeSurvey Field type: A
data[, 214] <- as.character(data[, 214])
attributes(data)$variable.labels[
  214
] <- "[Adresse e-mail] Merci de nous communiquer vos coordonnées afin que nous puissions vous contacter."
names(data)[214] <- "NOM_Email"
# LimeSurvey Field type: A
data[, 215] <- as.character(data[, 215])
attributes(data)$variable.labels[
  215
] <- "[Confirmation de l\'adresse e-mail] Merci de nous communiquer vos coordonnées afin que nous puissions vous contacter."
names(data)[215] <- "NOM_Cemail"
# LimeSurvey Field type: A
data[, 216] <- as.character(data[, 216])
attributes(data)$variable.labels[
  216
] <- "[Numéro de GSM] Merci de nous communiquer vos coordonnées afin que nous puissions vous contacter."
names(data)[216] <- "NOM_GSM"
# LimeSurvey Field type: A
data[, 217] <- as.character(data[, 217])
attributes(data)$variable.labels[
  217
] <- "[Autre numéro de téléphone] Merci de nous communiquer vos coordonnées afin que nous puissions vous contacter."
names(data)[217] <- "NOM_NAME1"
# LimeSurvey Field type: A
data[, 218] <- as.character(data[, 218])
attributes(data)$variable.labels[
  218
] <- "Merci beaucoup pour votre collaboration!  Un membre de l’équipe de recherche vous recontactera d’ici quelques semaines pour vous tenir informé(e) de votre éventuelle participation à un entretien."
names(data)[218] <- "TXS"
