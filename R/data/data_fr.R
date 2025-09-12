#' Name         : data_fr.R
#' Author       : Alexandre Bohyn
#' Date         : 2025-09-05
#' Purpose      : Load the NEED data using code answers and code variables using French
#'                labels.
#' Files created: - `data/processed/data_fr.rds`
#'                - `data/metadata/data_dictionnary.xlsx`
#' Edits        :

# Packages ----------------------------------------------------------------

library(dplyr)
library(labelled)
library(here)
library(openxlsx)

# Import raw data ----------------------------------------------------------------

data <- read.csv(
  here("data/raw/survey_814288_R_data_file.csv"),
  quote = "'\"",
  na.strings = c("", "\"\""),
  stringsAsFactors = FALSE,
  fileEncoding = "UTF-8-BOM"
)


# Redefine names and value labels ------------------------------------------------

# LimeSurvey Field type: F
data[, 1] <- as.numeric(data[, 1])
attributes(data)$variable.labels[1] <- "id"
names(data)[1] <- "id"
# LimeSurvey Field type: DATETIME23.2
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
    "Pour une autre personne dont vous êtes le représentant légal. (La personne que vous représentez n\'est pas capable de rép"
  )
)
names(data)[8] <- "D1"
# LimeSurvey Field type: A
data[, 9] <- as.character(data[, 9])
attributes(data)$variable.labels[
  9
] <- "A partir de maintenant veuillez répondre à toutes les questions comme si vous étiez la personne atteinte du trouble psychotique. Indiquez \"je ne sais pas\" si vous ne savez pas comment la personne répondrait."
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
# LimeSurvey Field type: A
data[, 12] <- as.character(data[, 12])
attributes(data)$variable.labels[
  12
] <- "Merci pour votre participation.  Malheureusement, vous ne rentrez pas dans les conditions pour pouvoir poursuivre cette étude."
names(data)[12] <- "END0"
# LimeSurvey Field type: A
data[, 13] <- as.character(data[, 13])
attributes(data)$variable.labels[13] <- "Dans quelle province habitez-vous ?"
data[, 13] <- factor(
  data[, 13],
  levels = c(
    "A1",
    "A2",
    "A3",
    "A4",
    "A5",
    "A6",
    "A7",
    "A8",
    "AO09",
    "AO10",
    "AO11",
    "AO12",
    "AO13"
  ),
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
    "Flandre occidentale ",
    "Je n’habite pas en Belgique",
    "Je ne sais pas"
  )
)
names(data)[13] <- "D4"
# LimeSurvey Field type: A
data[, 14] <- as.character(data[, 14])
attributes(data)$variable.labels[
  14
] <- "Merci pour votre participation.  Malheureusement, vous ne rentrez pas dans les conditions pour pouvoir poursuivre cette étude."
names(data)[14] <- "END1"
# LimeSurvey Field type: A
data[, 15] <- as.character(data[, 15])
attributes(data)$variable.labels[
  15
] <- "Quel est le diplôme ou le niveau d’étude le plus élevé que vous avez obtenu jusqu’à présent?"
data[, 15] <- factor(
  data[, 15],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
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
names(data)[15] <- "D5"
# LimeSurvey Field type: A
data[, 16] <- as.character(data[, 16])
attributes(data)$variable.labels[
  16
] <- "[Autre] Quel est le diplôme ou le niveau d’étude le plus élevé que vous avez obtenu jusqu’à présent?"
names(data)[16] <- "D5_other"
# LimeSurvey Field type: A
data[, 17] <- as.character(data[, 17])
attributes(data)$variable.labels[17] <- "Vous vivez …"
data[, 17] <- factor(
  data[, 17],
  levels = c(
    "AO01",
    "AO02",
    "AO03",
    "AO04",
    "AO05",
    "AO06",
    "AO07",
    "AO08",
    "AO09",
    "AO10",
    "AO11",
    "AO12"
  ),
  labels = c(
    "Seul(e)",
    "Seul(e) avec enfant(s)",
    "En couple (sans enfants)",
    "En couple (avec enfants)",
    "Avec un ou deux parents",
    "En colocation ou habitat partagé",
    "En maison de soins psychiatriques",
    "En habitation protégée",
    "En logement supervisé",
    "A l\'hôpital (temporairement)",
    "En maison de repos",
    "Je ne sais pas"
  )
)
names(data)[17] <- "D6"
# LimeSurvey Field type: A
data[, 18] <- as.character(data[, 18])
attributes(data)$variable.labels[18] <- "[Autre] Vous vivez …"
names(data)[18] <- "D6_other"
# LimeSurvey Field type: A
data[, 19] <- as.character(data[, 19])
attributes(data)$variable.labels[19] <- "Quel est votre pays de naissance ?"
data[, 19] <- factor(
  data[, 19],
  levels = c("A1", "A2", "A3"),
  labels = c("Belgique", "Autre pays", "Je ne sais pas")
)
names(data)[19] <- "D7"
# LimeSurvey Field type: A
data[, 20] <- as.character(data[, 20])
attributes(data)$variable.labels[20] <- "Sélectionnez le pays concerné"
data[, 20] <- factor(
  data[, 20],
  levels = c(
    "A1",
    "A2",
    "A3",
    "A4",
    "A5",
    "A6",
    "A7",
    "A8",
    "A9",
    "A10",
    "A11",
    "A12",
    "A13",
    "A14",
    "A15",
    "A16",
    "A17",
    "A18",
    "A19",
    "A20",
    "A21",
    "A22",
    "A23",
    "A24",
    "A25",
    "A26",
    "A27",
    "A28",
    "A29",
    "A30",
    "A31",
    "A32",
    "A33",
    "A34",
    "A35",
    "A36",
    "A37",
    "A38",
    "A39",
    "A40",
    "A41",
    "A42",
    "A43",
    "A44",
    "A45",
    "A46",
    "A47",
    "A48",
    "A49",
    "A50",
    "A51",
    "A52",
    "A53",
    "A54",
    "A55",
    "A56",
    "A57",
    "A58",
    "A59",
    "A60",
    "A61",
    "A62",
    "A63",
    "A64",
    "A65",
    "A66",
    "A67",
    "A68",
    "A69",
    "A70",
    "A71",
    "A72",
    "A73",
    "A74",
    "A75",
    "A76",
    "A77",
    "A78",
    "A79",
    "A80",
    "A81",
    "A82",
    "A83",
    "A84",
    "A85",
    "A86",
    "A87",
    "A88",
    "A89",
    "A90",
    "A91",
    "A92",
    "A93",
    "A94",
    "A95",
    "A96",
    "A97",
    "A98",
    "A99",
    "A100",
    "A101",
    "A102",
    "A103",
    "A104",
    "A105",
    "A106",
    "A107",
    "A108",
    "A109",
    "A110",
    "A111",
    "A112",
    "A113",
    "A114",
    "A115",
    "A116",
    "A117",
    "A118",
    "A119",
    "A120",
    "A121",
    "A122",
    "A123",
    "A124",
    "A125",
    "A126",
    "A127",
    "A128",
    "A129",
    "A130",
    "A131",
    "A132",
    "A133",
    "A134",
    "A135",
    "A136",
    "A137",
    "A138",
    "A139",
    "A140",
    "A141",
    "A142",
    "A143",
    "A144",
    "A145",
    "A146",
    "A147",
    "A148",
    "A149",
    "A150",
    "A151",
    "A152",
    "A153",
    "A154",
    "A155",
    "A156",
    "A157",
    "A158",
    "A159",
    "A160",
    "A161",
    "A162",
    "A163",
    "A164",
    "A165",
    "A166",
    "A167",
    "A168",
    "A169",
    "A170",
    "A171",
    "A172",
    "A173",
    "A174",
    "A175",
    "A176",
    "A177",
    "A178",
    "A179",
    "A180",
    "A181",
    "A182",
    "A183",
    "A184",
    "A185",
    "A186",
    "A187",
    "A188",
    "A189",
    "A190",
    "A191",
    "A192",
    "A193",
    "A194",
    "A195",
    "A196",
    "A197",
    "A198",
    "A199",
    "A200",
    "A201",
    "A202",
    "A203",
    "A204",
    "A205",
    "A206",
    "A207",
    "A208",
    "A209",
    "A210",
    "A211",
    "A212",
    "A213",
    "A214",
    "A215",
    "A216",
    "A217",
    "A218",
    "A219",
    "A220",
    "A221",
    "A222",
    "A223",
    "A224",
    "A225",
    "A226",
    "A227",
    "A228",
    "A229",
    "A230",
    "A231",
    "A232",
    "A233",
    "A234",
    "A235",
    "A236"
  ),
  labels = c(
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
    "Bosnie - Herzégovine",
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
    "Côte d\'Ivoire",
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
    "États-Unis d\'Amérique",
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
    "Libéria",
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
    "Mariannes du Nord (Iles, américaines)",
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
    "Nigéria",
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
    "Polynésie (français)",
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
    "Sainte-Hélène - Tristan Da Cunha - Ascension",
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
    "Zimbabwe",
    "Je ne sais pas"
  )
)
names(data)[20] <- "D8"
# LimeSurvey Field type: A
data[, 21] <- as.character(data[, 21])
attributes(data)$variable.labels[21] <- "[Autre] Sélectionnez le pays concerné"
names(data)[21] <- "D8_other"
# LimeSurvey Field type: A
data[, 22] <- as.character(data[, 22])
attributes(data)$variable.labels[
  22
] <- "Quel était votre principal statut professionnel juste avant le début de votre trouble psychotique  ?"
data[, 22] <- factor(
  data[, 22],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Emploi rémunéré (employé ou indépendant)",
    "Demandeur/demandeuse d’emploi, chômage, CPAS",
    "Homme/femme au foyer, sans revenus",
    "Etudiant(e)",
    "Pensionné(e)",
    "Invalidité",
    "Je ne sais pas"
  )
)
names(data)[22] <- "D9"
# LimeSurvey Field type: A
data[, 23] <- as.character(data[, 23])
attributes(data)$variable.labels[
  23
] <- "[Autre] Quel était votre principal statut professionnel juste avant le début de votre trouble psychotique  ?"
names(data)[23] <- "D9_other"
# LimeSurvey Field type: A
data[, 24] <- as.character(data[, 24])
attributes(data)$variable.labels[
  24
] <- "Depuis le début de vos premiers symptômes psychotiques, avez-vous eu un emploi rémunéré?   "
data[, 24] <- factor(
  data[, 24],
  levels = c("A1", "A2", "A3"),
  labels = c("Oui", "Non", "Je ne sais pas")
)
names(data)[24] <- "D10"
# LimeSurvey Field type: A
data[, 25] <- as.character(data[, 25])
attributes(data)$variable.labels[
  25
] <- "Actuellement, quel est votre principal statut professionnel?"
data[, 25] <- factor(
  data[, 25],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Emploi rémunéré (employé ou indépendant)",
    "Demandeur/demandeuse d’emploi, chômage, CPAS",
    "Homme/femme au foyer, sans revenus",
    "Etudiant(e)",
    "Pensionné(e)",
    "Invalidité",
    "Je ne sais pas"
  )
)
names(data)[25] <- "D11"
# LimeSurvey Field type: A
data[, 26] <- as.character(data[, 26])
attributes(data)$variable.labels[
  26
] <- "[Autre] Actuellement, quel est votre principal statut professionnel?"
names(data)[26] <- "D11_other"
# LimeSurvey Field type: A
data[, 27] <- as.character(data[, 27])
attributes(data)$variable.labels[
  27
] <- "En tenant compte de tous les revenus de votre ménage, dans quelle mesure parvenez-vous à joindre les deux bouts à la fin de chaque mois ?"
data[, 27] <- factor(
  data[, 27],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
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
names(data)[27] <- "D12"
# LimeSurvey Field type: A
data[, 28] <- as.character(data[, 28])
attributes(data)$variable.labels[
  28
] <- "Depuis combien de temps approximativement avez-vous reçu le diagnostic de trouble psychotique?"
data[, 28] <- factor(
  data[, 28],
  levels = c("A1", "A3", "A4", "A5", "A6", "A8"),
  labels = c(
    "Moins de 6 mois",
    "6 mois à 2 ans",
    "2 à 5 ans",
    "5 à 10 ans",
    "Plus de 10 ans",
    "Je ne sais pas"
  )
)
names(data)[28] <- "D13"
# LimeSurvey Field type: F
data[, 29] <- as.numeric(data[, 29])
attributes(data)$variable.labels[
  29
] <- "Indiquez approximativement le nombre d\'années:"
names(data)[29] <- "D13b"
# LimeSurvey Field type: A
data[, 30] <- as.character(data[, 30])
attributes(data)$variable.labels[
  30
] <- "Combien de temps est passé entre vos premiers symptômes psychotiques et le premier contact avec un psychiatre ?"
data[, 30] <- factor(
  data[, 30],
  levels = c("A1", "A2", "A3", "A4", "A6", "A5"),
  labels = c(
    "Moins de 1 mois",
    "Entre 1 mois et 6 mois",
    "Entre 6 mois et 1 an",
    "Entre 1 an et 2 ans",
    "Plus de 2 ans",
    "Je ne sais pas"
  )
)
names(data)[30] <- "DSHC1"
# LimeSurvey Field type: A
data[, 31] <- as.character(data[, 31])
attributes(data)$variable.labels[
  31
] <- "Combien de temps est passé entre votre premier rendez-vous médical pour le trouble psychotique et le diagnostic?"
data[, 31] <- factor(
  data[, 31],
  levels = c("A1", "A2", "A3", "A4", "A6", "A5"),
  labels = c(
    "Moins de 1 mois",
    "Entre 1 mois et 6 mois",
    "Entre 6 mois et 1 an",
    "Entre 1 an et 2 ans",
    "Plus que 2 ans",
    "Je ne sais pas"
  )
)
names(data)[31] <- "HC1"
# LimeSurvey Field type: F
data[, 32] <- as.numeric(data[, 32])
attributes(data)$variable.labels[
  32
] <- "[Schizophrénie] Quel(s) diagnostic(s) avez-vous reçu(s) ?"
data[, 32] <- factor(
  data[, 32],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[32] <- "DSD1_A1"
# LimeSurvey Field type: F
data[, 33] <- as.numeric(data[, 33])
attributes(data)$variable.labels[
  33
] <- "[Trouble schizo-affectif] Quel(s) diagnostic(s) avez-vous reçu(s) ?"
data[, 33] <- factor(
  data[, 33],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[33] <- "DSD1_A2"
# LimeSurvey Field type: F
data[, 34] <- as.numeric(data[, 34])
attributes(data)$variable.labels[
  34
] <- "[Trouble schizophréniforme] Quel(s) diagnostic(s) avez-vous reçu(s) ?"
data[, 34] <- factor(
  data[, 34],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[34] <- "DSD1_A3"
# LimeSurvey Field type: F
data[, 35] <- as.numeric(data[, 35])
attributes(data)$variable.labels[
  35
] <- "[ Trouble délirant] Quel(s) diagnostic(s) avez-vous reçu(s) ?"
data[, 35] <- factor(
  data[, 35],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[35] <- "DSD1_A4"
# LimeSurvey Field type: F
data[, 36] <- as.numeric(data[, 36])
attributes(data)$variable.labels[
  36
] <- "[Trouble psychotique bref] Quel(s) diagnostic(s) avez-vous reçu(s) ?"
data[, 36] <- factor(
  data[, 36],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[36] <- "DSD1_A5"
# LimeSurvey Field type: F
data[, 37] <- as.numeric(data[, 37])
attributes(data)$variable.labels[
  37
] <- "[Trouble psychotique partagé] Quel(s) diagnostic(s) avez-vous reçu(s) ?"
data[, 37] <- factor(
  data[, 37],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[37] <- "DSD1_A6"
# LimeSurvey Field type: F
data[, 38] <- as.numeric(data[, 38])
attributes(data)$variable.labels[
  38
] <- "[Trouble psychotique induit par une substance] Quel(s) diagnostic(s) avez-vous reçu(s) ?"
data[, 38] <- factor(
  data[, 38],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[38] <- "DSD1_A7"
# LimeSurvey Field type: F
data[, 39] <- as.numeric(data[, 39])
attributes(data)$variable.labels[
  39
] <- "[Trouble psychotique dû à une autre affection médicale] Quel(s) diagnostic(s) avez-vous reçu(s) ?"
data[, 39] <- factor(
  data[, 39],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[39] <- "DSD1_A8"
# LimeSurvey Field type: F
data[, 40] <- as.numeric(data[, 40])
attributes(data)$variable.labels[
  40
] <- "[Trouble psychotique non spécifié] Quel(s) diagnostic(s) avez-vous reçu(s) ?"
data[, 40] <- factor(
  data[, 40],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[40] <- "DSD1_A9"
# LimeSurvey Field type: F
data[, 41] <- as.numeric(data[, 41])
attributes(data)$variable.labels[
  41
] <- "[Trouble bipolaire avec caractéristiques psychotiques] Quel(s) diagnostic(s) avez-vous reçu(s) ?"
data[, 41] <- factor(
  data[, 41],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[41] <- "DSD1_A10"
# LimeSurvey Field type: F
data[, 42] <- as.numeric(data[, 42])
attributes(data)$variable.labels[
  42
] <- "[Je ne sais pas] Quel(s) diagnostic(s) avez-vous reçu(s) ?"
data[, 42] <- factor(
  data[, 42],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[42] <- "DSD1_A11"
# LimeSurvey Field type: F
data[, 43] <- as.numeric(data[, 43])
attributes(data)$variable.labels[
  43
] <- "[Je ne veux pas répondre] Quel(s) diagnostic(s) avez-vous reçu(s) ?"
data[, 43] <- factor(
  data[, 43],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[43] <- "DSD1_A12"
# LimeSurvey Field type: A
data[, 44] <- as.character(data[, 44])
attributes(data)$variable.labels[
  44
] <- "[Autre] Quel(s) diagnostic(s) avez-vous reçu(s) ?"
names(data)[44] <- "DSD1_other"
# LimeSurvey Field type: A
data[, 45] <- as.character(data[, 45])
attributes(data)$variable.labels[
  45
] <- "Merci pour votre participation.  Malheureusement, vous ne rentrez pas dans les conditions pour pouvoir poursuivre cette étude, car nous n\'incluons pas les troubles psychotiques dû à une autre affection médicale."
names(data)[45] <- "END3"
# LimeSurvey Field type: A
data[, 46] <- as.character(data[, 46])
attributes(data)$variable.labels[
  46
] <- "Avez-vous déjà été hospitalisé(e) à cause du trouble psychotique? Considérez uniquement les hospitalisations avec nuitée(s)"
data[, 46] <- factor(
  data[, 46],
  levels = c("A1", "A2", "A3"),
  labels = c("Oui", "Non", "Je ne sais pas")
)
names(data)[46] <- "DSD2"
# LimeSurvey Field type: A
data[, 47] <- as.character(data[, 47])
attributes(data)$variable.labels[
  47
] <- "{if(((is_empty(DSD1_A1.NAOK)) and (is_empty(DSD1_A2.NAOK)) and (is_empty(DSD1_A3.NAOK)) and (is_empty(DSD1_A4.NAOK)) and (is_empty(DSD1_A5.NAOK)) and (is_empty(DSD1_A6.NAOK)) and (is_empty(DSD1_A7.NAOK)) and (is_empty(DSD1_A9.NAOK)) and (is_empty(DSD1_A10.NAOK)) and (is_empty(DSD1_A11.NAOK)) and (is_empty(DSD1_A12.NAOK)) and (is_empty(DSD1_other)) and (DSD1_A8.NAOK == \"Y\")),\'uitgesloten\',\'in\')}"
names(data)[47] <- "G00Q10"
# LimeSurvey Field type: A
data[, 48] <- as.character(data[, 48])
attributes(data)$variable.labels[
  48
] <- "[Trouble obsessionnel compulsif (TOC)] Avez-vous un ou plusieurs des problèmes de santé suivants pouvant-être associés au trouble psychotique ?"
data[, 48] <- factor(
  data[, 48],
  levels = c("A1", "A2", "A3"),
  labels = c("Oui", "Non", "Je ne sais pas")
)
names(data)[48] <- "DSD3_SQ1"
# LimeSurvey Field type: A
data[, 49] <- as.character(data[, 49])
attributes(data)$variable.labels[
  49
] <- "[Dépression] Avez-vous un ou plusieurs des problèmes de santé suivants pouvant-être associés au trouble psychotique ?"
data[, 49] <- factor(
  data[, 49],
  levels = c("A1", "A2", "A3"),
  labels = c("Oui", "Non", "Je ne sais pas")
)
names(data)[49] <- "DSD3_SQ2"
# LimeSurvey Field type: A
data[, 50] <- as.character(data[, 50])
attributes(data)$variable.labels[
  50
] <- "[Trouble bipolaire] Avez-vous un ou plusieurs des problèmes de santé suivants pouvant-être associés au trouble psychotique ?"
data[, 50] <- factor(
  data[, 50],
  levels = c("A1", "A2", "A3"),
  labels = c("Oui", "Non", "Je ne sais pas")
)
names(data)[50] <- "DSD3_SQ3"
# LimeSurvey Field type: A
data[, 51] <- as.character(data[, 51])
attributes(data)$variable.labels[
  51
] <- "[Trouble de la consommation d\'alcool] Avez-vous un ou plusieurs des problèmes de santé suivants pouvant-être associés au trouble psychotique ?"
data[, 51] <- factor(
  data[, 51],
  levels = c("A1", "A2", "A3"),
  labels = c("Oui", "Non", "Je ne sais pas")
)
names(data)[51] <- "DSD3_SQ4"
# LimeSurvey Field type: A
data[, 52] <- as.character(data[, 52])
attributes(data)$variable.labels[
  52
] <- "[Trouble lié à l\'usage de substances psychoactives / toxicomanie] Avez-vous un ou plusieurs des problèmes de santé suivants pouvant-être associés au trouble psychotique ?"
data[, 52] <- factor(
  data[, 52],
  levels = c("A1", "A2", "A3"),
  labels = c("Oui", "Non", "Je ne sais pas")
)
names(data)[52] <- "DSD3_SQ5"
# LimeSurvey Field type: A
data[, 53] <- as.character(data[, 53])
attributes(data)$variable.labels[
  53
] <- "[Trouble anxieux ou trouble de panique] Avez-vous un ou plusieurs des problèmes de santé suivants pouvant-être associés au trouble psychotique ?"
data[, 53] <- factor(
  data[, 53],
  levels = c("A1", "A2", "A3"),
  labels = c("Oui", "Non", "Je ne sais pas")
)
names(data)[53] <- "DSD3_SQ9"
# LimeSurvey Field type: A
data[, 54] <- as.character(data[, 54])
attributes(data)$variable.labels[
  54
] <- "[Trouble du stress post-traumatique (TSPT)] Avez-vous un ou plusieurs des problèmes de santé suivants pouvant-être associés au trouble psychotique ?"
data[, 54] <- factor(
  data[, 54],
  levels = c("A1", "A2", "A3"),
  labels = c("Oui", "Non", "Je ne sais pas")
)
names(data)[54] <- "DSD3_SQ6"
# LimeSurvey Field type: A
data[, 55] <- as.character(data[, 55])
attributes(data)$variable.labels[
  55
] <- "[Trouble de la personnalité] Avez-vous un ou plusieurs des problèmes de santé suivants pouvant-être associés au trouble psychotique ?"
data[, 55] <- factor(
  data[, 55],
  levels = c("A1", "A2", "A3"),
  labels = c("Oui", "Non", "Je ne sais pas")
)
names(data)[55] <- "DSD3_SQ7"
# LimeSurvey Field type: A
data[, 56] <- as.character(data[, 56])
attributes(data)$variable.labels[
  56
] <- "[Trouble du spectre de l\'autisme] Avez-vous un ou plusieurs des problèmes de santé suivants pouvant-être associés au trouble psychotique ?"
data[, 56] <- factor(
  data[, 56],
  levels = c("A1", "A2", "A3"),
  labels = c("Oui", "Non", "Je ne sais pas")
)
names(data)[56] <- "DSD3_SQ8"
# LimeSurvey Field type: A
data[, 57] <- as.character(data[, 57])
attributes(data)$variable.labels[
  57
] <- "[Trouble déficit de l\'attention avec ou sans hyperactivité (TDAH)] Avez-vous un ou plusieurs des problèmes de santé suivants pouvant-être associés au trouble psychotique ?"
data[, 57] <- factor(
  data[, 57],
  levels = c("A1", "A2", "A3"),
  labels = c("Oui", "Non", "Je ne sais pas")
)
names(data)[57] <- "DSD3_SQ10"
# LimeSurvey Field type: A
data[, 58] <- as.character(data[, 58])
attributes(data)$variable.labels[
  58
] <- "[Trouble du comportement alimentaire (p.ex. anorexie, boulimie)] Avez-vous un ou plusieurs des problèmes de santé suivants pouvant-être associés au trouble psychotique ?"
data[, 58] <- factor(
  data[, 58],
  levels = c("A1", "A2", "A3"),
  labels = c("Oui", "Non", "Je ne sais pas")
)
names(data)[58] <- "DSD3_SQ11"
# LimeSurvey Field type: A
data[, 59] <- as.character(data[, 59])
attributes(data)$variable.labels[
  59
] <- "Avez-vous également d’ autre(s) problème(s) de santé ?"
data[, 59] <- factor(
  data[, 59],
  levels = c("A1", "A2", "A3"),
  labels = c("Oui", "Non", "Je ne sais pas")
)
names(data)[59] <- "D14"
# LimeSurvey Field type: F
data[, 60] <- as.numeric(data[, 60])
attributes(data)$variable.labels[
  60
] <- "[Maladie du cœur ou des vaisseaux sanguins (p.ex. hypertension)] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
data[, 60] <- factor(
  data[, 60],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[60] <- "D15_2"
# LimeSurvey Field type: A
data[, 61] <- as.character(data[, 61])
attributes(data)$variable.labels[
  61
] <- "[Commentaire] [Maladie du cœur ou des vaisseaux sanguins (p.ex. hypertension)] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
names(data)[61] <- "D15_2comment"
# LimeSurvey Field type: F
data[, 62] <- as.numeric(data[, 62])
attributes(data)$variable.labels[
  62
] <- "[Maladie du système respiratoire (p.ex. asthme)] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
data[, 62] <- factor(
  data[, 62],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[62] <- "D15_3"
# LimeSurvey Field type: A
data[, 63] <- as.character(data[, 63])
attributes(data)$variable.labels[
  63
] <- "[Commentaire] [Maladie du système respiratoire (p.ex. asthme)] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
names(data)[63] <- "D15_3comment"
# LimeSurvey Field type: F
data[, 64] <- as.numeric(data[, 64])
attributes(data)$variable.labels[
  64
] <- "[Maladie de l\'appareil digestif  (p.ex. syndrôme du colon irritable)] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
data[, 64] <- factor(
  data[, 64],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[64] <- "D15_4"
# LimeSurvey Field type: A
data[, 65] <- as.character(data[, 65])
attributes(data)$variable.labels[
  65
] <- "[Commentaire] [Maladie de l\'appareil digestif  (p.ex. syndrôme du colon irritable)] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
names(data)[65] <- "D15_4comment"
# LimeSurvey Field type: F
data[, 66] <- as.numeric(data[, 66])
attributes(data)$variable.labels[
  66
] <- "[Maladie de la peau ] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
data[, 66] <- factor(
  data[, 66],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[66] <- "D15_5"
# LimeSurvey Field type: A
data[, 67] <- as.character(data[, 67])
attributes(data)$variable.labels[
  67
] <- "[Commentaire] [Maladie de la peau ] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
names(data)[67] <- "D15_5comment"
# LimeSurvey Field type: F
data[, 68] <- as.numeric(data[, 68])
attributes(data)$variable.labels[
  68
] <- "[Maladie des os, articulations, ou muscles (p.ex. arthrose, arthrite rhumatoïde)] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
data[, 68] <- factor(
  data[, 68],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[68] <- "D15_6"
# LimeSurvey Field type: A
data[, 69] <- as.character(data[, 69])
attributes(data)$variable.labels[
  69
] <- "[Commentaire] [Maladie des os, articulations, ou muscles (p.ex. arthrose, arthrite rhumatoïde)] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
names(data)[69] <- "D15_6comment"
# LimeSurvey Field type: F
data[, 70] <- as.numeric(data[, 70])
attributes(data)$variable.labels[
  70
] <- "[Autre trouble de santé mentale ou psychologique non mentionné dans la question précédente] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
data[, 70] <- factor(
  data[, 70],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[70] <- "D15_7"
# LimeSurvey Field type: A
data[, 71] <- as.character(data[, 71])
attributes(data)$variable.labels[
  71
] <- "[Commentaire] [Autre trouble de santé mentale ou psychologique non mentionné dans la question précédente] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
names(data)[71] <- "D15_7comment"
# LimeSurvey Field type: F
data[, 72] <- as.numeric(data[, 72])
attributes(data)$variable.labels[
  72
] <- "[Trouble neurodéveloppemental (p.ex. retard de développement)] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
data[, 72] <- factor(
  data[, 72],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[72] <- "D15_17"
# LimeSurvey Field type: A
data[, 73] <- as.character(data[, 73])
attributes(data)$variable.labels[
  73
] <- "[Commentaire] [Trouble neurodéveloppemental (p.ex. retard de développement)] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
names(data)[73] <- "D15_17comment"
# LimeSurvey Field type: F
data[, 74] <- as.numeric(data[, 74])
attributes(data)$variable.labels[
  74
] <- "[Maladie du système nerveux (neurologique) (p.ex. démence, sclérose en plaques)] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
data[, 74] <- factor(
  data[, 74],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[74] <- "D15_11"
# LimeSurvey Field type: A
data[, 75] <- as.character(data[, 75])
attributes(data)$variable.labels[
  75
] <- "[Commentaire] [Maladie du système nerveux (neurologique) (p.ex. démence, sclérose en plaques)] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
names(data)[75] <- "D15_11comment"
# LimeSurvey Field type: F
data[, 76] <- as.numeric(data[, 76])
attributes(data)$variable.labels[
  76
] <- "[Maladie du sang (hématologique) (p.ex. anémie)] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
data[, 76] <- factor(
  data[, 76],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[76] <- "D15_8"
# LimeSurvey Field type: A
data[, 77] <- as.character(data[, 77])
attributes(data)$variable.labels[
  77
] <- "[Commentaire] [Maladie du sang (hématologique) (p.ex. anémie)] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
names(data)[77] <- "D15_8comment"
# LimeSurvey Field type: F
data[, 78] <- as.numeric(data[, 78])
attributes(data)$variable.labels[
  78
] <- "[Maladie immunitaire (p.ex. allergies, maladies auto-inflammatoires)] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
data[, 78] <- factor(
  data[, 78],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[78] <- "D15_9"
# LimeSurvey Field type: A
data[, 79] <- as.character(data[, 79])
attributes(data)$variable.labels[
  79
] <- "[Commentaire] [Maladie immunitaire (p.ex. allergies, maladies auto-inflammatoires)] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
names(data)[79] <- "D15_9comment"
# LimeSurvey Field type: F
data[, 80] <- as.numeric(data[, 80])
attributes(data)$variable.labels[
  80
] <- "[Maladie endocrinienne, nutritionnelle, ou métabolique (p.ex. diabète, cholestérol élevé, obésité, hypothyroïdisme)] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
data[, 80] <- factor(
  data[, 80],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[80] <- "D15_10"
# LimeSurvey Field type: A
data[, 81] <- as.character(data[, 81])
attributes(data)$variable.labels[
  81
] <- "[Commentaire] [Maladie endocrinienne, nutritionnelle, ou métabolique (p.ex. diabète, cholestérol élevé, obésité, hypothyroïdisme)] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
names(data)[81] <- "D15_10comment"
# LimeSurvey Field type: F
data[, 82] <- as.numeric(data[, 82])
attributes(data)$variable.labels[
  82
] <- "[Maladie de l\'œil] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
data[, 82] <- factor(
  data[, 82],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[82] <- "D15_12"
# LimeSurvey Field type: A
data[, 83] <- as.character(data[, 83])
attributes(data)$variable.labels[
  83
] <- "[Commentaire] [Maladie de l\'œil] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
names(data)[83] <- "D15_12comment"
# LimeSurvey Field type: F
data[, 84] <- as.numeric(data[, 84])
attributes(data)$variable.labels[
  84
] <- "[Maladie de l’oreille ou du système vestibulaire ] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
data[, 84] <- factor(
  data[, 84],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[84] <- "D15_13"
# LimeSurvey Field type: A
data[, 85] <- as.character(data[, 85])
attributes(data)$variable.labels[
  85
] <- "[Commentaire] [Maladie de l’oreille ou du système vestibulaire ] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
names(data)[85] <- "D15_13comment"
# LimeSurvey Field type: F
data[, 86] <- as.numeric(data[, 86])
attributes(data)$variable.labels[
  86
] <- "[Maladie des organes reproducteurs ou du système urinaire (p.ex. insuffisance rénale, endométriose)] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
data[, 86] <- factor(
  data[, 86],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[86] <- "D15_14"
# LimeSurvey Field type: A
data[, 87] <- as.character(data[, 87])
attributes(data)$variable.labels[
  87
] <- "[Commentaire] [Maladie des organes reproducteurs ou du système urinaire (p.ex. insuffisance rénale, endométriose)] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
names(data)[87] <- "D15_14comment"
# LimeSurvey Field type: F
data[, 88] <- as.numeric(data[, 88])
attributes(data)$variable.labels[
  88
] <- "[Troubles du sommeil (p.ex. apnée obstructive du sommeil)] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
data[, 88] <- factor(
  data[, 88],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[88] <- "D15_18"
# LimeSurvey Field type: A
data[, 89] <- as.character(data[, 89])
attributes(data)$variable.labels[
  89
] <- "[Commentaire] [Troubles du sommeil (p.ex. apnée obstructive du sommeil)] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
names(data)[89] <- "D15_18comment"
# LimeSurvey Field type: F
data[, 90] <- as.numeric(data[, 90])
attributes(data)$variable.labels[
  90
] <- "[Maladie qui touche plusieurs systèmes  (p.ex. psoriasis)] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
data[, 90] <- factor(
  data[, 90],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[90] <- "D15_15"
# LimeSurvey Field type: A
data[, 91] <- as.character(data[, 91])
attributes(data)$variable.labels[
  91
] <- "[Commentaire] [Maladie qui touche plusieurs systèmes  (p.ex. psoriasis)] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
names(data)[91] <- "D15_15comment"
# LimeSurvey Field type: F
data[, 92] <- as.numeric(data[, 92])
attributes(data)$variable.labels[
  92
] <- "[Pas de diagnostic connu] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
data[, 92] <- factor(
  data[, 92],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[92] <- "D15_19"
# LimeSurvey Field type: A
data[, 93] <- as.character(data[, 93])
attributes(data)$variable.labels[
  93
] <- "[Commentaire] [Pas de diagnostic connu] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
names(data)[93] <- "D15_19comment"
# LimeSurvey Field type: F
data[, 94] <- as.numeric(data[, 94])
attributes(data)$variable.labels[
  94
] <- "[Je ne sais pas ] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
data[, 94] <- factor(
  data[, 94],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[94] <- "D15_16"
# LimeSurvey Field type: A
data[, 95] <- as.character(data[, 95])
attributes(data)$variable.labels[
  95
] <- "[Commentaire] [Je ne sais pas ] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
names(data)[95] <- "D15_16comment"
# LimeSurvey Field type: A
data[, 96] <- as.character(data[, 96])
attributes(data)$variable.labels[
  96
] <- "[Autre] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
names(data)[96] <- "D15_other"
# LimeSurvey Field type: A
data[, 97] <- as.character(data[, 97])
attributes(data)$variable.labels[
  97
] <- "[Commentaire pour autre] Quels autres problèmes de santé avez-vous ? Vous pouvez cocher plusieurs cases.  Veuillez également indiquer le nom précis de votre/vos problème(s) de santé si vous le(s) connaissez.Si vous ne connaissez pas (encore) le diagnostic de votre autre problème de santé, cochez la case “pas de diagnostic connu“."
names(data)[97] <- "D15_othercomment"
# LimeSurvey Field type: A
data[, 98] <- as.character(data[, 98])
attributes(data)$variable.labels[
  98
] <- "Votre mobilité avant vos premiers symptômes de trouble psychotique"
data[, 98] <- factor(
  data[, 98],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Je n’avais aucun problème pour me déplacer à pied.",
    "J’avais des problèmes légers pour me déplacer à pied.",
    "J’avais des problèmes modérés pour me déplacer à pied.",
    "J’avais des problèmes sévères pour me déplacer à pied.",
    "J’étais incapable de me déplacer à pied.",
    "Je ne sais pas."
  )
)
names(data)[98] <- "H1"
# LimeSurvey Field type: A
data[, 99] <- as.character(data[, 99])
attributes(data)$variable.labels[
  99
] <- "Votre autonomie avant vos premiers symptômes de trouble psychotique"
data[, 99] <- factor(
  data[, 99],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Je n’avais aucun problème pour me laver ou m’habiller tout(e) seul(e).",
    "J’avais des problèmes légers pour me laver ou m’habiller tout(e) seul(e).",
    "J’avais des problèmes modérés pour me laver ou m’habiller tout(e) seul(e).",
    "J’avais des problèmes sévères pour me laver ou m’habiller tout(e) seul(e).",
    "J’étais incapable de me laver ou de m’habiller tout(e) seul(e).",
    "Je ne sais pas."
  )
)
names(data)[99] <- "H2"
# LimeSurvey Field type: A
data[, 100] <- as.character(data[, 100])
attributes(data)$variable.labels[
  100
] <- "Vos activités courantes avant vos premiers symptômes de trouble psychotique (exemples: travail, études, faire des courses, faire le ménage, prendre des transports en commun, activités avec la famille ou voir des amis, loisirs) "
data[, 100] <- factor(
  data[, 100],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Je n’avais aucun problème pour accomplir mes activités courantes.",
    "J’avais des problèmes légers pour accomplir mes activités courantes.",
    "J’avais des problèmes modérés pour accomplir mes activités courantes.",
    "J’avais des problèmes sévères pour accomplir mes activités courantes.",
    "J’étais incapable d’accomplir mes activités courantes.",
    "Je ne sais pas."
  )
)
names(data)[100] <- "H3"
# LimeSurvey Field type: A
data[, 101] <- as.character(data[, 101])
attributes(data)$variable.labels[
  101
] <- "Votre douleur ou gêne avant vos premiers symptômes de trouble psychotique"
data[, 101] <- factor(
  data[, 101],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Je n’avais ni douleur ni gêne.",
    "J’avais des douleurs ou une gêne légère(s).",
    "J’avais des douleurs ou une gêne modérée(s).",
    "J’avais des douleurs ou une gêne sévère(s).",
    "J’avais des douleurs ou une gêne extrême(s).",
    "Je ne sais pas."
  )
)
names(data)[101] <- "H4"
# LimeSurvey Field type: A
data[, 102] <- as.character(data[, 102])
attributes(data)$variable.labels[
  102
] <- "Votre anxiété ou dépression avant vos premiers symptômes de trouble psychotique"
data[, 102] <- factor(
  data[, 102],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Je n’étais ni anxieux(se), ni déprimé(e).",
    "J’étais légèrement anxieux(se) ou déprimé(e).",
    "J’étais modérément anxieux(se) ou déprimé(e).",
    "J’étais sévèrement anxieux(se) ou déprimé(e).",
    "J’étais extrêmement anxieux(se) ou déprimé(e).",
    "Je ne sais pas."
  )
)
names(data)[102] <- "H5"
# LimeSurvey Field type: F
data[, 103] <- as.numeric(data[, 103])
attributes(data)$variable.labels[
  103
] <- "Nous aimerions savoir dans quelle mesure votre santé était bonne ou mauvaise AVANT vos premiers symptômes de trouble psychotique sur une échelle de 0 à 100.   100 correspond à la meilleure santé que vous puissiez imaginer. 0 correspond à la pire santé que vous puissiez imaginer.  Veuillez entrer un nombre entre 0 et 100 afin d’indiquer votre état de santé AVANT vos premiers symptômes de trouble psychotique."
names(data)[103] <- "H6"
# LimeSurvey Field type: A
data[, 104] <- as.character(data[, 104])
attributes(data)$variable.labels[
  104
] <- "Nous aimerions connaitre votre état de santé actuel, tel que vous le vivez aujourd\'hui. Veuillez cocher la case à côté de l\'affirmation qui décrit le mieux votre santé AUJOURD\'HUI."
names(data)[104] <- "TXT"
# LimeSurvey Field type: A
data[, 105] <- as.character(data[, 105])
attributes(data)$variable.labels[105] <- "Votre mobilité aujourd\'hui"
data[, 105] <- factor(
  data[, 105],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Je n’ai aucun problème pour me déplacer à pied.",
    "J’ai des problèmes légers pour me déplacer à pied.",
    "J’ai des problèmes modérés pour me déplacer à pied.",
    "J’ai des problèmes sévères pour me déplacer à pied.",
    "Je suis incapable de me déplacer à pied.",
    "Je ne sais pas."
  )
)
names(data)[105] <- "H7"
# LimeSurvey Field type: A
data[, 106] <- as.character(data[, 106])
attributes(data)$variable.labels[106] <- "Votre autonomie aujourd\'hui"
data[, 106] <- factor(
  data[, 106],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Je n’ai aucun problème pour me laver ou m’habiller tout(e) seul(e).",
    "J’ai des problèmes légers pour me laver ou m’habiller tout(e) seul(e).",
    "J’ai des problèmes modérés pour me laver ou m’habiller tout(e) seul(e).",
    "J’ai des problèmes sévères pour me laver ou m’habiller tout(e) seul(e).",
    "Je suis incapable de me laver ou de m’habiller tout(e) seul(e).",
    "Je ne sais pas."
  )
)
names(data)[106] <- "H8"
# LimeSurvey Field type: A
data[, 107] <- as.character(data[, 107])
attributes(data)$variable.labels[
  107
] <- "Vos activités courantes aujourd\'hui (exemples: travail, études, faire des couses, faire le ménage, prendre des transports en commun, activités avec la famille ou voir des amis, loisirs)"
data[, 107] <- factor(
  data[, 107],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Je n’ai aucun problème pour accomplir mes activités courantes.",
    "J’ai des problèmes légers pour accomplir mes activités courantes.",
    "J’ai des problèmes modérés pour accomplir mes activités courantes.",
    "J’ai des problèmes sévères pour accomplir mes activités courantes.",
    "Je suis incapable d’accomplir mes activités courantes.",
    "Je ne sais pas."
  )
)
names(data)[107] <- "H9"
# LimeSurvey Field type: A
data[, 108] <- as.character(data[, 108])
attributes(data)$variable.labels[108] <- "Votre douleur ou gêne aujourd\'hui"
data[, 108] <- factor(
  data[, 108],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Je n’ai ni douleur ni gêne.",
    "J’ai des douleurs ou une gêne légère(s).",
    "J’ai des douleurs ou une gêne modérée(s).",
    "J’ai des douleurs ou une gêne sévère(s).",
    "J’ai des douleurs ou une gêne extrême(s).",
    "Je ne sais pas."
  )
)
names(data)[108] <- "H10"
# LimeSurvey Field type: A
data[, 109] <- as.character(data[, 109])
attributes(data)$variable.labels[
  109
] <- "Votre anxiété ou dépression aujourd\'hui"
data[, 109] <- factor(
  data[, 109],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Je ne suis ni anxieux(se), ni déprimé(e).",
    "Je suis légèrement anxieux(se) ou déprimé(e).",
    "Je suis modérément anxieux(se) ou déprimé(e).",
    "Je suis sévèrement anxieux(se) ou déprimé(e).",
    "Je suis extrêmement anxieux(se) ou déprimé(e).",
    "Je ne sais pas."
  )
)
names(data)[109] <- "H11"
# LimeSurvey Field type: F
data[, 110] <- as.numeric(data[, 110])
attributes(data)$variable.labels[
  110
] <- "Nous aimerions savoir dans quelle mesure votre santé est bonne ou mauvaise AUJOURD\'HUI sur une échelle de 0 à 100.   100 correspond à la meilleure santé que vous puissiez imaginer. 0 correspond à la pire santé que vous puissiez imaginer.  Veuillez entrer un nombre entre 0 et 100 afin d’indiquer votre état de santé AUJOURD\'HUI."
names(data)[110] <- "H12"
# LimeSurvey Field type: A
data[, 111] <- as.character(data[, 111])
attributes(data)$variable.labels[
  111
] <- "Avez-vous reçu un traitement lié à votre trouble psychotique dans les 5 dernières années?"
data[, 111] <- factor(
  data[, 111],
  levels = c("A1", "A2", "A3"),
  labels = c("Oui", "Non", "Je ne sais pas")
)
names(data)[111] <- "HC2"
# LimeSurvey Field type: F
data[, 112] <- as.numeric(data[, 112])
attributes(data)$variable.labels[
  112
] <- "[Médicaments antipsychotiques « atypiques » (de 2ème génération) (p.ex. Aripiprazole, Abilify, Sycrest, Reagila, Olanzapine, Zypadhera, Invega, Xeplion, Trevicta, Quétiapine, Risperidone, Serdolect)] Quels traitements avez-vous reçus pour le trouble psychotique dans les 5 dernières années ?"
data[, 112] <- factor(
  data[, 112],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[112] <- "HC3_SQ005"
# LimeSurvey Field type: F
data[, 113] <- as.numeric(data[, 113])
attributes(data)$variable.labels[
  113
] <- "[Médicaments antipsychotiques « classiques » (de 1ère génération) (p.ex. Clopixol, Haldol, Nozinan, Fluanxol, Etumine, Deanxit)] Quels traitements avez-vous reçus pour le trouble psychotique dans les 5 dernières années ?"
data[, 113] <- factor(
  data[, 113],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[113] <- "HC3_SQ006"
# LimeSurvey Field type: F
data[, 114] <- as.numeric(data[, 114])
attributes(data)$variable.labels[
  114
] <- "[Clozapine (p.ex. Clozapine Sandoz, Leponex)] Quels traitements avez-vous reçus pour le trouble psychotique dans les 5 dernières années ?"
data[, 114] <- factor(
  data[, 114],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[114] <- "HC3_SQ007"
# LimeSurvey Field type: F
data[, 115] <- as.numeric(data[, 115])
attributes(data)$variable.labels[
  115
] <- "[Antidépresseurs utilisés pour traiter la dépression, le trouble obsessionel compulsif, ou trouble de panique (p.ex. Citalopram, Escitalopram, Fluoxetine, Sertraline, Edronax, Redomex, Duloxetine, Venlafaxine)] Quels traitements avez-vous reçus pour le trouble psychotique dans les 5 dernières années ?"
data[, 115] <- factor(
  data[, 115],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[115] <- "HC3_SQ008"
# LimeSurvey Field type: F
data[, 116] <- as.numeric(data[, 116])
attributes(data)$variable.labels[
  116
] <- "[Tranquillisants (p.ex. Diazepam, Valium, Lormetazepam, Lorazepam)] Quels traitements avez-vous reçus pour le trouble psychotique dans les 5 dernières années ?"
data[, 116] <- factor(
  data[, 116],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[116] <- "HC3_SQ001"
# LimeSurvey Field type: F
data[, 117] <- as.numeric(data[, 117])
attributes(data)$variable.labels[
  117
] <- "[Psychothérapie (p.ex. thérapie cognitivo-comportementale, psychoéducation, etc)] Quels traitements avez-vous reçus pour le trouble psychotique dans les 5 dernières années ?"
data[, 117] <- factor(
  data[, 117],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[117] <- "HC3_SQ002"
# LimeSurvey Field type: F
data[, 118] <- as.numeric(data[, 118])
attributes(data)$variable.labels[
  118
] <- "[Electroconvulsivothérapie (ECT)] Quels traitements avez-vous reçus pour le trouble psychotique dans les 5 dernières années ?"
data[, 118] <- factor(
  data[, 118],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[118] <- "HC3_SQ003"
# LimeSurvey Field type: F
data[, 119] <- as.numeric(data[, 119])
attributes(data)$variable.labels[
  119
] <- "[Autre stimulation cérébrale non invasive : stimulation transcrânienne à courant direct (tDCS), ou la stimulation magnétique transcrânienne répétitive (rTMS).] Quels traitements avez-vous reçus pour le trouble psychotique dans les 5 dernières années ?"
data[, 119] <- factor(
  data[, 119],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[119] <- "HC3_SQ012"
# LimeSurvey Field type: F
data[, 120] <- as.numeric(data[, 120])
attributes(data)$variable.labels[
  120
] <- "[Stimulation cérébrale profonde] Quels traitements avez-vous reçus pour le trouble psychotique dans les 5 dernières années ?"
data[, 120] <- factor(
  data[, 120],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[120] <- "HC3_SQ013"
# LimeSurvey Field type: F
data[, 121] <- as.numeric(data[, 121])
attributes(data)$variable.labels[
  121
] <- "[Exercice physique] Quels traitements avez-vous reçus pour le trouble psychotique dans les 5 dernières années ?"
data[, 121] <- factor(
  data[, 121],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[121] <- "HC3_SQ011"
# LimeSurvey Field type: F
data[, 122] <- as.numeric(data[, 122])
attributes(data)$variable.labels[
  122
] <- "[Soutien par les pairs] Quels traitements avez-vous reçus pour le trouble psychotique dans les 5 dernières années ?"
data[, 122] <- factor(
  data[, 122],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[122] <- "HC3_SQ010"
# LimeSurvey Field type: F
data[, 123] <- as.numeric(data[, 123])
attributes(data)$variable.labels[
  123
] <- "[Je ne sais pas ] Quels traitements avez-vous reçus pour le trouble psychotique dans les 5 dernières années ?"
data[, 123] <- factor(
  data[, 123],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[123] <- "HC3_SQ004"
# LimeSurvey Field type: A
data[, 124] <- as.character(data[, 124])
attributes(data)$variable.labels[
  124
] <- "[Autre] Quels traitements avez-vous reçus pour le trouble psychotique dans les 5 dernières années ?"
names(data)[124] <- "HC3_other"
# LimeSurvey Field type: F
data[, 125] <- as.numeric(data[, 125])
attributes(data)$variable.labels[
  125
] <- "[Prise de poids] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement du trouble psychotique dans les 5 dernières années? "
data[, 125] <- factor(
  data[, 125],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[125] <- "HC4_SQ001"
# LimeSurvey Field type: F
data[, 126] <- as.numeric(data[, 126])
attributes(data)$variable.labels[
  126
] <- "[Hyperglycémie (taux de sucre élevé) ou diabète] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement du trouble psychotique dans les 5 dernières années? "
data[, 126] <- factor(
  data[, 126],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[126] <- "HC4_SQ002"
# LimeSurvey Field type: F
data[, 127] <- as.numeric(data[, 127])
attributes(data)$variable.labels[
  127
] <- "[Taux élevé de cholestérol (excès de graisses sanguines)] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement du trouble psychotique dans les 5 dernières années? "
data[, 127] <- factor(
  data[, 127],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[127] <- "HC4_SQ003"
# LimeSurvey Field type: F
data[, 128] <- as.numeric(data[, 128])
attributes(data)$variable.labels[
  128
] <- "[Manque de globules blancs] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement du trouble psychotique dans les 5 dernières années? "
data[, 128] <- factor(
  data[, 128],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[128] <- "HC4_SQ004"
# LimeSurvey Field type: F
data[, 129] <- as.numeric(data[, 129])
attributes(data)$variable.labels[
  129
] <- "[Troubles du mouvement] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement du trouble psychotique dans les 5 dernières années? "
data[, 129] <- factor(
  data[, 129],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[129] <- "HC4_SQ019"
# LimeSurvey Field type: F
data[, 130] <- as.numeric(data[, 130])
attributes(data)$variable.labels[
  130
] <- "[Agitation, difficulté à rester immobile, besoin de bouger] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement du trouble psychotique dans les 5 dernières années? "
data[, 130] <- factor(
  data[, 130],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[130] <- "HC4_SQ005"
# LimeSurvey Field type: F
data[, 131] <- as.numeric(data[, 131])
attributes(data)$variable.labels[
  131
] <- "[Contractions musculaires involontaires, et parfois douloureuses] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement du trouble psychotique dans les 5 dernières années? "
data[, 131] <- factor(
  data[, 131],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[131] <- "HC4_SQ006"
# LimeSurvey Field type: F
data[, 132] <- as.numeric(data[, 132])
attributes(data)$variable.labels[
  132
] <- "[Tremblements et/ou rigidité faciale] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement du trouble psychotique dans les 5 dernières années? "
data[, 132] <- factor(
  data[, 132],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[132] <- "HC4_SQ007"
# LimeSurvey Field type: F
data[, 133] <- as.numeric(data[, 133])
attributes(data)$variable.labels[
  133
] <- "[Mouvements involontaires du visage, comme mâchonner, tirer la langue ou cligner des yeux] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement du trouble psychotique dans les 5 dernières années? "
data[, 133] <- factor(
  data[, 133],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[133] <- "HC4_SQ008"
# LimeSurvey Field type: F
data[, 134] <- as.numeric(data[, 134])
attributes(data)$variable.labels[
  134
] <- "[Fatigue ou somnolence] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement du trouble psychotique dans les 5 dernières années? "
data[, 134] <- factor(
  data[, 134],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[134] <- "HC4_SQ009"
# LimeSurvey Field type: F
data[, 135] <- as.numeric(data[, 135])
attributes(data)$variable.labels[
  135
] <- "[Vertiges] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement du trouble psychotique dans les 5 dernières années? "
data[, 135] <- factor(
  data[, 135],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[135] <- "HC4_SQ010"
# LimeSurvey Field type: F
data[, 136] <- as.numeric(data[, 136])
attributes(data)$variable.labels[
  136
] <- "[Sécheresse de la bouche ou des yeux] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement du trouble psychotique dans les 5 dernières années? "
data[, 136] <- factor(
  data[, 136],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[136] <- "HC4_SQ011"
# LimeSurvey Field type: F
data[, 137] <- as.numeric(data[, 137])
attributes(data)$variable.labels[
  137
] <- "[Nausées] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement du trouble psychotique dans les 5 dernières années? "
data[, 137] <- factor(
  data[, 137],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[137] <- "HC4_SQ012"
# LimeSurvey Field type: F
data[, 138] <- as.numeric(data[, 138])
attributes(data)$variable.labels[
  138
] <- "[Constipation] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement du trouble psychotique dans les 5 dernières années? "
data[, 138] <- factor(
  data[, 138],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[138] <- "HC4_SQ013"
# LimeSurvey Field type: F
data[, 139] <- as.numeric(data[, 139])
attributes(data)$variable.labels[
  139
] <- "[Myocardite (inflammation du muscle cardiaque)] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement du trouble psychotique dans les 5 dernières années? "
data[, 139] <- factor(
  data[, 139],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[139] <- "HC4_SQ014"
# LimeSurvey Field type: F
data[, 140] <- as.numeric(data[, 140])
attributes(data)$variable.labels[
  140
] <- "[Dysfonction sexuelle (p.ex. baisse de la libido)] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement du trouble psychotique dans les 5 dernières années? "
data[, 140] <- factor(
  data[, 140],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[140] <- "HC4_SQ015"
# LimeSurvey Field type: F
data[, 141] <- as.numeric(data[, 141])
attributes(data)$variable.labels[
  141
] <- "[Problèmes de mémoire ou \"brouillard mental\"] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement du trouble psychotique dans les 5 dernières années? "
data[, 141] <- factor(
  data[, 141],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[141] <- "HC4_SQ016"
# LimeSurvey Field type: F
data[, 142] <- as.numeric(data[, 142])
attributes(data)$variable.labels[
  142
] <- "[Émoussement affectif (manque de motivation, manque d\'intérêt)] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement du trouble psychotique dans les 5 dernières années? "
data[, 142] <- factor(
  data[, 142],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[142] <- "HC4_SQ017"
# LimeSurvey Field type: F
data[, 143] <- as.numeric(data[, 143])
attributes(data)$variable.labels[
  143
] <- "[Aucun effet indésirable] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement du trouble psychotique dans les 5 dernières années? "
data[, 143] <- factor(
  data[, 143],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[143] <- "HC4_SQ018"
# LimeSurvey Field type: A
data[, 144] <- as.character(data[, 144])
attributes(data)$variable.labels[
  144
] <- "[Autre] Quel(s) effet(s) indésirable(s) avez-vous eu pendant ou après le traitement du trouble psychotique dans les 5 dernières années? "
names(data)[144] <- "HC4_other"
# LimeSurvey Field type: A
data[, 145] <- as.character(data[, 145])
attributes(data)$variable.labels[
  145
] <- "[Prise de poids] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 145] <- factor(
  data[, 145],
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
names(data)[145] <- "HC5_SQ001"
# LimeSurvey Field type: A
data[, 146] <- as.character(data[, 146])
attributes(data)$variable.labels[
  146
] <- "[Hyperglycémie (taux de sucre élevé) ou diabete] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 146] <- factor(
  data[, 146],
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
names(data)[146] <- "HC5_SQ002"
# LimeSurvey Field type: A
data[, 147] <- as.character(data[, 147])
attributes(data)$variable.labels[
  147
] <- "[Taux élevé de cholestérol (excès de graisses sanguines)] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 147] <- factor(
  data[, 147],
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
names(data)[147] <- "HC5_SQ003"
# LimeSurvey Field type: A
data[, 148] <- as.character(data[, 148])
attributes(data)$variable.labels[
  148
] <- "[Manque de globules blancs] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 148] <- factor(
  data[, 148],
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
names(data)[148] <- "HC5_SQ004"
# LimeSurvey Field type: A
data[, 149] <- as.character(data[, 149])
attributes(data)$variable.labels[
  149
] <- "[Agitation, difficulté à rester immobile, besoin de bouger] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 149] <- factor(
  data[, 149],
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
names(data)[149] <- "HC5_SQ005"
# LimeSurvey Field type: A
data[, 150] <- as.character(data[, 150])
attributes(data)$variable.labels[
  150
] <- "[Contractions musculaires involontaires et parfois douloureuses] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 150] <- factor(
  data[, 150],
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
names(data)[150] <- "HC5_SQ006"
# LimeSurvey Field type: A
data[, 151] <- as.character(data[, 151])
attributes(data)$variable.labels[
  151
] <- "[Tremblements et/ou rigidité faciale] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 151] <- factor(
  data[, 151],
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
names(data)[151] <- "HC5_SQ007"
# LimeSurvey Field type: A
data[, 152] <- as.character(data[, 152])
attributes(data)$variable.labels[
  152
] <- "[Mouvements involontaires du visage, comme mâchonner, tirer la langue ou clinger des yeux] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 152] <- factor(
  data[, 152],
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
names(data)[152] <- "HC5_SQ008"
# LimeSurvey Field type: A
data[, 153] <- as.character(data[, 153])
attributes(data)$variable.labels[
  153
] <- "[Fatigue ou somnolence] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 153] <- factor(
  data[, 153],
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
names(data)[153] <- "HC5_SQ009"
# LimeSurvey Field type: A
data[, 154] <- as.character(data[, 154])
attributes(data)$variable.labels[
  154
] <- "[Vertiges] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 154] <- factor(
  data[, 154],
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
names(data)[154] <- "HC5_SQ010"
# LimeSurvey Field type: A
data[, 155] <- as.character(data[, 155])
attributes(data)$variable.labels[
  155
] <- "[Sécheresse de la bouche ou des yeux] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 155] <- factor(
  data[, 155],
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
names(data)[155] <- "HC5_SQ011"
# LimeSurvey Field type: A
data[, 156] <- as.character(data[, 156])
attributes(data)$variable.labels[
  156
] <- "[Naussées] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 156] <- factor(
  data[, 156],
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
names(data)[156] <- "HC5_SQ012"
# LimeSurvey Field type: A
data[, 157] <- as.character(data[, 157])
attributes(data)$variable.labels[
  157
] <- "[Constipation] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 157] <- factor(
  data[, 157],
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
names(data)[157] <- "HC5_SQ013"
# LimeSurvey Field type: A
data[, 158] <- as.character(data[, 158])
attributes(data)$variable.labels[
  158
] <- "[Myocardite (inflammation du muscle cardiaque)] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 158] <- factor(
  data[, 158],
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
names(data)[158] <- "HC5_SQ014"
# LimeSurvey Field type: A
data[, 159] <- as.character(data[, 159])
attributes(data)$variable.labels[
  159
] <- "[Dysfonction sexuelle (p.ex. baisse de la libido)] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 159] <- factor(
  data[, 159],
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
names(data)[159] <- "HC5_SQ015"
# LimeSurvey Field type: A
data[, 160] <- as.character(data[, 160])
attributes(data)$variable.labels[
  160
] <- "[Problèmes de mémoire ou \"brouillard mental\"] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 160] <- factor(
  data[, 160],
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
names(data)[160] <- "HC5_SQ016"
# LimeSurvey Field type: A
data[, 161] <- as.character(data[, 161])
attributes(data)$variable.labels[
  161
] <- "[Emoussement affectif (manque de motivation, manque d\'intérêt)] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 161] <- factor(
  data[, 161],
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
names(data)[161] <- "HC5_SQ017"
# LimeSurvey Field type: A
data[, 162] <- as.character(data[, 162])
attributes(data)$variable.labels[
  162
] <- "[Aucun effet indésirable] Indiquez dans quelle mesure chacun des effets indésirables était pénible pour vous."
data[, 162] <- factor(
  data[, 162],
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
names(data)[162] <- "HC5_SQ018"
# LimeSurvey Field type: A
data[, 163] <- as.character(data[, 163])
attributes(data)$variable.labels[
  163
] <- "En dehors des effets indésirables, dans quelle mesure le traitement que vous avez reçu pour le trouble psychotique au cours des 5 dernières années, a-t-il été pénible pour vous? Par exemple, en raison de l\'administration par injection, du besoin de se rendre à l\'hôpital pour recevoir le traitement, d\'un horaire de prise contraignant, de la nécessité de conserver le médicament au frigo, etc."
data[, 163] <- factor(
  data[, 163],
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
names(data)[163] <- "HC6"
# LimeSurvey Field type: A
data[, 164] <- as.character(data[, 164])
attributes(data)$variable.labels[
  164
] <- "[L\'impression que l\'on dise à la télévision ou que l\'on écrive dans les journaux des choses spécialement pour vous, l\'impression que l\'on cherche volontairement à vous nuire, l\'impression qu\'il y a un complot dirigé contre vous, l\'impression d\'entendre vos pensées répétées comme par un écho, ou d’autres perceptions altérées de la réalité.] Depuis que vous êtes suivi(e) ou traité(e) pour le trouble psychotique, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous ? Ne tenez pas compte des effets indésirables du traitement."
data[, 164] <- factor(
  data[, 164],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
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
names(data)[164] <- "H13_SQ013"
# LimeSurvey Field type: A
data[, 165] <- as.character(data[, 165])
attributes(data)$variable.labels[
  165
] <- "[Entendre, voir ou ressentir quelque chose qui n’est pas là. Par exemple, entendre une ou plusieurs voix alors que vous êtes tout(e) seul(e) ; voir des objets, des personnes ou des animaux que les autres personnes ne voient pas.  ] Depuis que vous êtes suivi(e) ou traité(e) pour le trouble psychotique, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous ? Ne tenez pas compte des effets indésirables du traitement."
data[, 165] <- factor(
  data[, 165],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
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
names(data)[165] <- "H13_SQ014"
# LimeSurvey Field type: A
data[, 166] <- as.character(data[, 166])
attributes(data)$variable.labels[
  166
] <- "[Sensation d’influence, de contrôle, ou de passivité. Par exemple, l\'impression d\'avoir dans votre tête des pensées que vous ne reconnaissez pas comme les vôtres. L\'impression d\'être sous le contrôle d’une force ou d’un pouvoir extérieur à vous-même.] Depuis que vous êtes suivi(e) ou traité(e) pour le trouble psychotique, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous ? Ne tenez pas compte des effets indésirables du traitement."
data[, 166] <- factor(
  data[, 166],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
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
names(data)[166] <- "H13_SQ016"
# LimeSurvey Field type: A
data[, 167] <- as.character(data[, 167])
attributes(data)$variable.labels[
  167
] <- "[Désorganisation de la pensée, comme le sentiment d’avoir l’esprit vide, ou l\'impression que vos pensées ont été enlevées ou extraites de votre tête, ou d\'avoir dans votre tête des pensées que vous ne reconnaissez pas comme les vôtres] Depuis que vous êtes suivi(e) ou traité(e) pour le trouble psychotique, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous ? Ne tenez pas compte des effets indésirables du traitement."
data[, 167] <- factor(
  data[, 167],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
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
names(data)[167] <- "H13_SQ017"
# LimeSurvey Field type: A
data[, 168] <- as.character(data[, 168])
attributes(data)$variable.labels[
  168
] <- "[Désorganisation du comportement. Par exemple, le sentiment que vous négligez votre apparence ou votre hygiène personnelle, ou le sentiment que vous n’arrivez jamais à terminer ce que vous faites.] Depuis que vous êtes suivi(e) ou traité(e) pour le trouble psychotique, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous ? Ne tenez pas compte des effets indésirables du traitement."
data[, 168] <- factor(
  data[, 168],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
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
names(data)[168] <- "H13_SQ018"
# LimeSurvey Field type: A
data[, 169] <- as.character(data[, 169])
attributes(data)$variable.labels[
  169
] <- "[Incapacité à éprouver de l’intérêt ou du plaisir, manque de motivation ou d’enthousiasme, sentiment que vos émotions sont émoussées.] Depuis que vous êtes suivi(e) ou traité(e) pour le trouble psychotique, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous ? Ne tenez pas compte des effets indésirables du traitement."
data[, 169] <- factor(
  data[, 169],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
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
names(data)[169] <- "H13_SQ019"
# LimeSurvey Field type: A
data[, 170] <- as.character(data[, 170])
attributes(data)$variable.labels[
  170
] <- "[Isolement social, ou le sentiment que vous n’éprouvez pas d’intérêt à être avec d’autres personnes.] Depuis que vous êtes suivi(e) ou traité(e) pour le trouble psychotique, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous ? Ne tenez pas compte des effets indésirables du traitement."
data[, 170] <- factor(
  data[, 170],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
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
names(data)[170] <- "H13_SQ020"
# LimeSurvey Field type: A
data[, 171] <- as.character(data[, 171])
attributes(data)$variable.labels[
  171
] <- "[Agitation, ou sentiment de tension] Depuis que vous êtes suivi(e) ou traité(e) pour le trouble psychotique, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous ? Ne tenez pas compte des effets indésirables du traitement."
data[, 171] <- factor(
  data[, 171],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
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
names(data)[171] <- "H13_SQ021"
# LimeSurvey Field type: A
data[, 172] <- as.character(data[, 172])
attributes(data)$variable.labels[
  172
] <- "[Problèmes de concentration ] Depuis que vous êtes suivi(e) ou traité(e) pour le trouble psychotique, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous ? Ne tenez pas compte des effets indésirables du traitement."
data[, 172] <- factor(
  data[, 172],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
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
names(data)[172] <- "H13_SQ002"
# LimeSurvey Field type: A
data[, 173] <- as.character(data[, 173])
attributes(data)$variable.labels[
  173
] <- "[Fatigue ou épuisement ] Depuis que vous êtes suivi(e) ou traité(e) pour le trouble psychotique, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous ? Ne tenez pas compte des effets indésirables du traitement."
data[, 173] <- factor(
  data[, 173],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
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
names(data)[173] <- "H13_SQ004"
# LimeSurvey Field type: A
data[, 174] <- as.character(data[, 174])
attributes(data)$variable.labels[
  174
] <- "[Peur ou anxiété ] Depuis que vous êtes suivi(e) ou traité(e) pour le trouble psychotique, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous ? Ne tenez pas compte des effets indésirables du traitement."
data[, 174] <- factor(
  data[, 174],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
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
names(data)[174] <- "H13_SQ008"
# LimeSurvey Field type: A
data[, 175] <- as.character(data[, 175])
attributes(data)$variable.labels[
  175
] <- "[Sentiment d\'abattement, de déprime, ou de tristesse ] Depuis que vous êtes suivi(e) ou traité(e) pour le trouble psychotique, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous ? Ne tenez pas compte des effets indésirables du traitement."
data[, 175] <- factor(
  data[, 175],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
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
names(data)[175] <- "H13_SQ009"
# LimeSurvey Field type: A
data[, 176] <- as.character(data[, 176])
attributes(data)$variable.labels[
  176
] <- "[Stress] Depuis que vous êtes suivi(e) ou traité(e) pour le trouble psychotique, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous ? Ne tenez pas compte des effets indésirables du traitement."
data[, 176] <- factor(
  data[, 176],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
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
names(data)[176] <- "H13_SQ015"
# LimeSurvey Field type: A
data[, 177] <- as.character(data[, 177])
attributes(data)$variable.labels[
  177
] <- "[Comportements ou envies de se faire du mal ou de se blesser] Depuis que vous êtes suivi(e) ou traité(e) pour le trouble psychotique, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous ? Ne tenez pas compte des effets indésirables du traitement."
data[, 177] <- factor(
  data[, 177],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
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
names(data)[177] <- "H13_SQ003"
# LimeSurvey Field type: A
data[, 178] <- as.character(data[, 178])
attributes(data)$variable.labels[
  178
] <- "[L\'impression de n\'avoir plus envie de vivre] Depuis que vous êtes suivi(e) ou traité(e) pour le trouble psychotique, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous ? Ne tenez pas compte des effets indésirables du traitement."
data[, 178] <- factor(
  data[, 178],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
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
names(data)[178] <- "H13_SQ005"
# LimeSurvey Field type: A
data[, 179] <- as.character(data[, 179])
attributes(data)$variable.labels[
  179
] <- "[Stigmatisation ou sentiment de discrimination ] Depuis que vous êtes suivi(e) ou traité(e) pour le trouble psychotique, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous ? Ne tenez pas compte des effets indésirables du traitement."
data[, 179] <- factor(
  data[, 179],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
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
names(data)[179] <- "H13_SQ010"
# LimeSurvey Field type: A
data[, 180] <- as.character(data[, 180])
attributes(data)$variable.labels[
  180
] <- "[Perte de confiance en soi ] Depuis que vous êtes suivi(e) ou traité(e) pour le trouble psychotique, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous ? Ne tenez pas compte des effets indésirables du traitement."
data[, 180] <- factor(
  data[, 180],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
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
names(data)[180] <- "H13_SQ011"
# LimeSurvey Field type: A
data[, 181] <- as.character(data[, 181])
attributes(data)$variable.labels[
  181
] <- "[Autre ] Depuis que vous êtes suivi(e) ou traité(e) pour le trouble psychotique, quels symptômes parmi les suivants avez-vous ressenti et dans quelle mesure étaient-ils pénibles pour vous ? Ne tenez pas compte des effets indésirables du traitement."
data[, 181] <- factor(
  data[, 181],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
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
names(data)[181] <- "H13_SQ022"
# LimeSurvey Field type: A
data[, 182] <- as.character(data[, 182])
attributes(data)$variable.labels[
  182
] <- "Dans quelle mesure est-ce que le trouble psychotique a interféré avec votre vie sexuelle ?"
data[, 182] <- factor(
  data[, 182],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06", "AO07", "AO08"),
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
names(data)[182] <- "H14"
# LimeSurvey Field type: A
data[, 183] <- as.character(data[, 183])
attributes(data)$variable.labels[
  183
] <- "Dans quelle mesure le trouble psychotique a-t-il interféré avec votre vie reproductive, c’est-à-dire avec votre possibilité ou décision de concevoir naturellement des enfants ou de mener à terme une grossesse?Par exemple: FIV (Fécondation in Vitro), dépistage génétique, don de sperme/ovocytes, nécessité de retarder une grossesse, ou renoncé à avoir des enfants biologiques à cause du trouble psychotique."
data[, 183] <- factor(
  data[, 183],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06", "AO07", "AO08"),
  labels = c(
    "Pas du tout",
    "Légèrement",
    "Modérément",
    "Beaucoup",
    "Extrêmement",
    "Je ne sais pas",
    "Ne s’applique pas (p.ex. vous n\'avez pas encore envisagé d\'avoir des enfants, ou vous n\'étiez pas touché par le trouble ",
    "Je ne veux pas répondre"
  )
)
names(data)[183] <- "H15"
# LimeSurvey Field type: A
data[, 184] <- as.character(data[, 184])
attributes(data)$variable.labels[
  184
] <- "Par \'prise en charge\' nous entendons l\'ensemble des rendez-vous, traitements, et accompagnements proposés par les professionnels de santé pour gérer et améliorer votre état de santé en lien avec le trouble psychotique."
names(data)[184] <- "INFO"
# LimeSurvey Field type: A
data[, 185] <- as.character(data[, 185])
attributes(data)$variable.labels[
  185
] <- "Considérez-vous que votre prise en charge a été bien organisée et planifiée au fil du temps?"
data[, 185] <- factor(
  data[, 185],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Toujours",
    "Souvent",
    "Parfois",
    "Rarement",
    "Jamais",
    "Je ne sais pas"
  )
)
names(data)[185] <- "HC7"
# LimeSurvey Field type: A
data[, 186] <- as.character(data[, 186])
attributes(data)$variable.labels[
  186
] <- "Avez-vous un ou plusieurs professionnels de santé qui sont responsables de la coordination des différents services médicaux dont vous avez besoin ?"
data[, 186] <- factor(
  data[, 186],
  levels = c("A1", "A2", "A3", "A4"),
  labels = c(
    "Oui",
    "Non",
    "Je ne sais pas",
    "Ne s’applique pas : le suivi se fait uniquement dans un service, sans besoin de coordination"
  )
)
names(data)[186] <- "HC8"
# LimeSurvey Field type: A
data[, 187] <- as.character(data[, 187])
attributes(data)$variable.labels[
  187
] <- "Dans quelle mesure voyez-vous le(s) même(s) professionnel(s) de santé pendant vos rendez-vous ou examens réguliers ?"
data[, 187] <- factor(
  data[, 187],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Toujours",
    "Souvent",
    "Parfois",
    "Rarement",
    "Jamais",
    "Je ne sais pas"
  )
)
names(data)[187] <- "HC9"
# LimeSurvey Field type: A
data[, 188] <- as.character(data[, 188])
attributes(data)$variable.labels[
  188
] <- "Dans quelle mesure recevez-vous suffisamment d\'informations utiles et compréhensibles de la part de vos professionnels de santé? "
data[, 188] <- factor(
  data[, 188],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Toujours",
    "Souvent",
    "Parfois",
    "Rarement",
    "Jamais",
    "Je ne sais pas"
  )
)
names(data)[188] <- "HC10"
# LimeSurvey Field type: A
data[, 189] <- as.character(data[, 189])
attributes(data)$variable.labels[
  189
] <- "Êtes-vous impliqué(e) autant que vous le souhaitez dans les décisions concernant vos soins ou votre traitement ?"
data[, 189] <- factor(
  data[, 189],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06", "AO07"),
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
names(data)[189] <- "HC11"
# LimeSurvey Field type: A
data[, 190] <- as.character(data[, 190])
attributes(data)$variable.labels[
  190
] <- "Au cours des 12 derniers mois, y a-t-il des soins pour le trouble psychotique que vous n’avez pas obtenus alors que vous en auriez eu besoin ? Il peut s’agir d’une consultation, d’un traitement, d’analyses médicales, de rééducation, ou autre."
data[, 190] <- factor(
  data[, 190],
  levels = c("A1", "A2", "A3"),
  labels = c("Oui", "Non", "Je ne sais pas")
)
names(data)[190] <- "HC12"
# LimeSurvey Field type: F
data[, 191] <- as.numeric(data[, 191])
attributes(data)$variable.labels[
  191
] <- "[Distance entre le domicile et le lieu de soins] Pour quelle(s) raison(s) principale(s) n\'avez-vous pas reçu les soins dont vous aviez besoin?"
data[, 191] <- factor(
  data[, 191],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[191] <- "HC13_SQ001"
# LimeSurvey Field type: F
data[, 192] <- as.numeric(data[, 192])
attributes(data)$variable.labels[
  192
] <- "[Problème de transport (par exemple pas de transport en commun à proximité, pas de véhicule personnel, impossibilité de conduire votre propre véhicule, personne pour vous emmener sur le lieu de vos soins)] Pour quelle(s) raison(s) principale(s) n\'avez-vous pas reçu les soins dont vous aviez besoin?"
data[, 192] <- factor(
  data[, 192],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[192] <- "HC13_SQ002"
# LimeSurvey Field type: F
data[, 193] <- as.numeric(data[, 193])
attributes(data)$variable.labels[
  193
] <- "[Manque de personnel compétent pour vous administrer les soins dont vous avez besoin] Pour quelle(s) raison(s) principale(s) n\'avez-vous pas reçu les soins dont vous aviez besoin?"
data[, 193] <- factor(
  data[, 193],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[193] <- "HC13_SQ003"
# LimeSurvey Field type: F
data[, 194] <- as.numeric(data[, 194])
attributes(data)$variable.labels[
  194
] <- "[Délais d\'attente très longs] Pour quelle(s) raison(s) principale(s) n\'avez-vous pas reçu les soins dont vous aviez besoin?"
data[, 194] <- factor(
  data[, 194],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[194] <- "HC13_SQ004"
# LimeSurvey Field type: F
data[, 195] <- as.numeric(data[, 195])
attributes(data)$variable.labels[
  195
] <- "[Difficultés pour payer les soins] Pour quelle(s) raison(s) principale(s) n\'avez-vous pas reçu les soins dont vous aviez besoin?"
data[, 195] <- factor(
  data[, 195],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[195] <- "HC13_SQ005"
# LimeSurvey Field type: F
data[, 196] <- as.numeric(data[, 196])
attributes(data)$variable.labels[
  196
] <- "[Peur des examens médicaux, de l\'hôpital, ou d\'autre chose] Pour quelle(s) raison(s) principale(s) n\'avez-vous pas reçu les soins dont vous aviez besoin?"
data[, 196] <- factor(
  data[, 196],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[196] <- "HC13_SQ006"
# LimeSurvey Field type: F
data[, 197] <- as.numeric(data[, 197])
attributes(data)$variable.labels[
  197
] <- "[Manque de temps à cause du travail, des enfants, ou autre] Pour quelle(s) raison(s) principale(s) n\'avez-vous pas reçu les soins dont vous aviez besoin?"
data[, 197] <- factor(
  data[, 197],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[197] <- "HC13_SQ007"
# LimeSurvey Field type: F
data[, 198] <- as.numeric(data[, 198])
attributes(data)$variable.labels[
  198
] <- "[Manque d\'information] Pour quelle(s) raison(s) principale(s) n\'avez-vous pas reçu les soins dont vous aviez besoin?"
data[, 198] <- factor(
  data[, 198],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[198] <- "HC13_SQ009"
# LimeSurvey Field type: F
data[, 199] <- as.numeric(data[, 199])
attributes(data)$variable.labels[
  199
] <- "[Difficultés liées à la langue] Pour quelle(s) raison(s) principale(s) n\'avez-vous pas reçu les soins dont vous aviez besoin?"
data[, 199] <- factor(
  data[, 199],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[199] <- "HC13_SQ008"
# LimeSurvey Field type: A
data[, 200] <- as.character(data[, 200])
attributes(data)$variable.labels[
  200
] <- "[Autre] Pour quelle(s) raison(s) principale(s) n\'avez-vous pas reçu les soins dont vous aviez besoin?"
names(data)[200] <- "HC13_other"
# LimeSurvey Field type: A
data[, 201] <- as.character(data[, 201])
attributes(data)$variable.labels[
  201
] <- "Dans quelle mesure votre scolarité ou vos études ont-elles été affectées par le trouble psychotique, en termes de présence, de performance, de réussite, ou de choix d\'études?"
data[, 201] <- factor(
  data[, 201],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06", "AO07"),
  labels = c(
    "Pas du tout",
    "Légèrement",
    "Modérément",
    "Beaucoup",
    "Extrêmement",
    "Je ne sais pas",
    "Ne s’applique pas: le trouble psychotique est survenu après que la scolarité/les études soient terminées"
  )
)
names(data)[201] <- "S1"
# LimeSurvey Field type: A
data[, 202] <- as.character(data[, 202])
attributes(data)$variable.labels[
  202
] <- "En raison du trouble psychotique, avez-vous diminué votre temps de travail?"
data[, 202] <- factor(
  data[, 202],
  levels = c("AO01", "AO02", "AO03", "AO04"),
  labels = c(
    "Oui, je travaille moins qu\'avant en raison de mon trouble psychotique",
    "Oui, j’ai arrêté de travailler en raison de mon trouble psychotique",
    "Non, le trouble psychotique n’a pas eu d’impact sur mon temps de travail",
    "Je ne sais pas"
  )
)
names(data)[202] <- "S2"
# LimeSurvey Field type: A
data[, 203] <- as.character(data[, 203])
attributes(data)$variable.labels[
  203
] <- "[Autre] En raison du trouble psychotique, avez-vous diminué votre temps de travail?"
names(data)[203] <- "S2_other"
# LimeSurvey Field type: A
data[, 204] <- as.character(data[, 204])
attributes(data)$variable.labels[
  204
] <- "Combien de temps, approximativement, avez-vous été en incapacité de travailler en raison de votre trouble psychotique?"
data[, 204] <- factor(
  data[, 204],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05"),
  labels = c(
    "Pendant moins de 1 mois",
    "Pendant 1 à 3 mois ",
    "Pendant 4 mois à 1 an",
    "Pendant plus de 1 an",
    "Je ne sais pas"
  )
)
names(data)[204] <- "S3"
# LimeSurvey Field type: F
data[, 205] <- as.numeric(data[, 205])
attributes(data)$variable.labels[
  205
] <- "Veuillez indiquez approximativement le nombre d’années:  "
names(data)[205] <- "S3b"
# LimeSurvey Field type: A
data[, 206] <- as.character(data[, 206])
attributes(data)$variable.labels[
  206
] <- "La prochaine question concerne les sept derniers jours, sans inclure aujourd\'hui."
names(data)[206] <- "TXT1"
# LimeSurvey Field type: F
data[, 207] <- as.numeric(data[, 207])
attributes(data)$variable.labels[
  207
] <- "[| 0 = Le trouble psychotique n’a eu aucun effet sur mon travail | 10 = En raison du trouble psychotique, je n’ai pas pu travailler du tout] Au cours des sept derniers jours, dans quelle mesure le trouble psychotique a-t-il affecté votre productivité pendant que vous travailliez ?  Pensez aux jours où vous avez été limité(e) dans la quantité ou le type de travail que vous pouviez effectuer, aux jours où vous avez accompli moins que vous ne l\'auriez souhaité ou aux jours où vous n\'avez pas pu faire votre travail avec autant de soin que d\'habitude. Si le trouble psychotique n\'a que peu affecté votre travail, choisissez un chiffre faible. Choisissez un chiffre élevé si le trouble psychotique a beaucoup affecté votre travail.   "
names(data)[207] <- "S4_SQ001"
# LimeSurvey Field type: A
data[, 208] <- as.character(data[, 208])
attributes(data)$variable.labels[
  208
] <- "Dans quelle mesure votre trouble psychotique ou votre traitement médical vous a-t-il causé des difficultés financières?"
data[, 208] <- factor(
  data[, 208],
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
names(data)[208] <- "S5"
# LimeSurvey Field type: A
data[, 209] <- as.character(data[, 209])
attributes(data)$variable.labels[
  209
] <- "Dans quelle mesure votre trouble psychotique interfère-t-il avec vos relations avec la famille, votre partenaire, vos amis, ou voisins ?"
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
names(data)[209] <- "S6"
# LimeSurvey Field type: F
data[, 210] <- as.numeric(data[, 210])
attributes(data)$variable.labels[
  210
] <- "[Aucun soutien supplémentaire ] À cause du trouble psychotique, de quels types de soutien supplémentaire avez-vous eu besoin, sans y être parvenu jusqu’à présent?"
data[, 210] <- factor(
  data[, 210],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[210] <- "S7_SQ001"
# LimeSurvey Field type: F
data[, 211] <- as.numeric(data[, 211])
attributes(data)$variable.labels[
  211
] <- "[Aide logistique (par exemple: nettoyage, cuisine, courses, transport, garde d\'enfants)] À cause du trouble psychotique, de quels types de soutien supplémentaire avez-vous eu besoin, sans y être parvenu jusqu’à présent?"
data[, 211] <- factor(
  data[, 211],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[211] <- "S7_SQ002"
# LimeSurvey Field type: F
data[, 212] <- as.numeric(data[, 212])
attributes(data)$variable.labels[
  212
] <- "[Parler à d’autres patients atteints d\'un trouble psychotique] À cause du trouble psychotique, de quels types de soutien supplémentaire avez-vous eu besoin, sans y être parvenu jusqu’à présent?"
data[, 212] <- factor(
  data[, 212],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[212] <- "S7_SQ003"
# LimeSurvey Field type: F
data[, 213] <- as.numeric(data[, 213])
attributes(data)$variable.labels[
  213
] <- "[Soutien psychologique ] À cause du trouble psychotique, de quels types de soutien supplémentaire avez-vous eu besoin, sans y être parvenu jusqu’à présent?"
data[, 213] <- factor(
  data[, 213],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[213] <- "S7_SQ004"
# LimeSurvey Field type: F
data[, 214] <- as.numeric(data[, 214])
attributes(data)$variable.labels[
  214
] <- "[Soutien médical ] À cause du trouble psychotique, de quels types de soutien supplémentaire avez-vous eu besoin, sans y être parvenu jusqu’à présent?"
data[, 214] <- factor(
  data[, 214],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[214] <- "S7_SQ005"
# LimeSurvey Field type: F
data[, 215] <- as.numeric(data[, 215])
attributes(data)$variable.labels[
  215
] <- "[Aide administrative ou sociale ] À cause du trouble psychotique, de quels types de soutien supplémentaire avez-vous eu besoin, sans y être parvenu jusqu’à présent?"
data[, 215] <- factor(
  data[, 215],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[215] <- "S7_SQ006"
# LimeSurvey Field type: F
data[, 216] <- as.numeric(data[, 216])
attributes(data)$variable.labels[
  216
] <- "[Soutien pour l\'adaptation de l\'environnement, ou matériel adapté] À cause du trouble psychotique, de quels types de soutien supplémentaire avez-vous eu besoin, sans y être parvenu jusqu’à présent?"
data[, 216] <- factor(
  data[, 216],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[216] <- "S7_SQ011"
# LimeSurvey Field type: F
data[, 217] <- as.numeric(data[, 217])
attributes(data)$variable.labels[
  217
] <- "[Soutien pour le retour au travail ] À cause du trouble psychotique, de quels types de soutien supplémentaire avez-vous eu besoin, sans y être parvenu jusqu’à présent?"
data[, 217] <- factor(
  data[, 217],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[217] <- "S7_SQ007"
# LimeSurvey Field type: F
data[, 218] <- as.numeric(data[, 218])
attributes(data)$variable.labels[
  218
] <- "[Soutien scolaire ou pour les études] À cause du trouble psychotique, de quels types de soutien supplémentaire avez-vous eu besoin, sans y être parvenu jusqu’à présent?"
data[, 218] <- factor(
  data[, 218],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[218] <- "S7_SQ008"
# LimeSurvey Field type: F
data[, 219] <- as.numeric(data[, 219])
attributes(data)$variable.labels[
  219
] <- "[Accompagnement spirituel ou religieux ] À cause du trouble psychotique, de quels types de soutien supplémentaire avez-vous eu besoin, sans y être parvenu jusqu’à présent?"
data[, 219] <- factor(
  data[, 219],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[219] <- "S7_SQ009"
# LimeSurvey Field type: F
data[, 220] <- as.numeric(data[, 220])
attributes(data)$variable.labels[
  220
] <- "[Je ne sais pas] À cause du trouble psychotique, de quels types de soutien supplémentaire avez-vous eu besoin, sans y être parvenu jusqu’à présent?"
data[, 220] <- factor(
  data[, 220],
  levels = c(1, 0),
  labels = c("Oui", "Non sélectionné")
)
names(data)[220] <- "S7_SQ010"
# LimeSurvey Field type: A
data[, 221] <- as.character(data[, 221])
attributes(data)$variable.labels[
  221
] <- "[Autre] À cause du trouble psychotique, de quels types de soutien supplémentaire avez-vous eu besoin, sans y être parvenu jusqu’à présent?"
names(data)[221] <- "S7_other"
# LimeSurvey Field type: A
data[, 222] <- as.character(data[, 222])
attributes(data)$variable.labels[
  222
] <- "[L’impact du trouble psychotique sur la qualité de vie générale (impact sur la mobilité, l\'autonomie, la capacité à vous habiller et laver seul, la gêne ou douleur, l\'anxiété ou la dépression; années vécues avec une incapacité)] Selon vous, quels aspects de votre trouble psychotique ou de sa prise en charge devraient être améliorés en priorité ? Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 222] <- factor(
  data[, 222],
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
names(data)[222] <- "P1_SQ001"
# LimeSurvey Field type: A
data[, 223] <- as.character(data[, 223])
attributes(data)$variable.labels[
  223
] <- "[L’impact sur votre santé physique (symptômes physiques, gêne ou douleur liées au à le touble psychotique)] Selon vous, quels aspects de votre trouble psychotique ou de sa prise en charge devraient être améliorés en priorité ? Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 223] <- factor(
  data[, 223],
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
names(data)[223] <- "P1_SQ002"
# LimeSurvey Field type: A
data[, 224] <- as.character(data[, 224])
attributes(data)$variable.labels[
  224
] <- "[L’impact  sur votre santé psychologique (symptômes psychologiques, anxiété, ou dépression liées au à le trouble psychotique)] Selon vous, quels aspects de votre trouble psychotique ou de sa prise en charge devraient être améliorés en priorité ? Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 224] <- factor(
  data[, 224],
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
names(data)[224] <- "P1_SQ003"
# LimeSurvey Field type: A
data[, 225] <- as.character(data[, 225])
attributes(data)$variable.labels[
  225
] <- "[L’impact sur votre autonomie (impact sur votre mobilité, sur votre capacité à vous laver et habiller seul(e) ; capacité à accomplir vos activités courantes comme le travail, études, travaux ménagers, activités familiales, ou loisirs)] Selon vous, quels aspects de votre trouble psychotique ou de sa prise en charge devraient être améliorés en priorité ? Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 225] <- factor(
  data[, 225],
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
names(data)[225] <- "P1_SQ004"
# LimeSurvey Field type: A
data[, 226] <- as.character(data[, 226])
attributes(data)$variable.labels[
  226
] <- "[L’impact sur votre vie sexuelle et reproductive] Selon vous, quels aspects de votre trouble psychotique ou de sa prise en charge devraient être améliorés en priorité ? Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 226] <- factor(
  data[, 226],
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
names(data)[226] <- "P1_SQ005"
# LimeSurvey Field type: A
data[, 227] <- as.character(data[, 227])
attributes(data)$variable.labels[
  227
] <- "[L’impact sur l’espérance de vie] Selon vous, quels aspects de votre trouble psychotique ou de sa prise en charge devraient être améliorés en priorité ? Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 227] <- factor(
  data[, 227],
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
names(data)[227] <- "P1_SQ006"
# LimeSurvey Field type: A
data[, 228] <- as.character(data[, 228])
attributes(data)$variable.labels[
  228
] <- "[L’impact sur votre scolarité ou vos études] Selon vous, quels aspects de votre trouble psychotique ou de sa prise en charge devraient être améliorés en priorité ? Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 228] <- factor(
  data[, 228],
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
names(data)[228] <- "P1_SQ007"
# LimeSurvey Field type: A
data[, 229] <- as.character(data[, 229])
attributes(data)$variable.labels[
  229
] <- "[L’impact sur votre travail] Selon vous, quels aspects de votre trouble psychotique ou de sa prise en charge devraient être améliorés en priorité ? Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 229] <- factor(
  data[, 229],
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
names(data)[229] <- "P1_SQ008"
# LimeSurvey Field type: A
data[, 230] <- as.character(data[, 230])
attributes(data)$variable.labels[
  230
] <- "[L’impact financier] Selon vous, quels aspects de votre trouble psychotique ou de sa prise en charge devraient être améliorés en priorité ? Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 230] <- factor(
  data[, 230],
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
names(data)[230] <- "P1_SQ009"
# LimeSurvey Field type: A
data[, 231] <- as.character(data[, 231])
attributes(data)$variable.labels[
  231
] <- "[L’impact sur votre vie sociale (relations avec la famille, votre partenaire, ou vos amis ; besoin de soutien supplémentaire- administratif, social, etc)] Selon vous, quels aspects de votre trouble psychotique ou de sa prise en charge devraient être améliorés en priorité ? Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 231] <- factor(
  data[, 231],
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
names(data)[231] <- "P1_SQ010"
# LimeSurvey Field type: A
data[, 232] <- as.character(data[, 232])
attributes(data)$variable.labels[
  232
] <- "[La qualité de votre prise en charge (la rapidité du diagnostic, la coordination et la continuité des soins, les informations reçues par les professionnels de santé, l’implication dans les décisions concernant vos soins ou traitements)] Selon vous, quels aspects de votre trouble psychotique ou de sa prise en charge devraient être améliorés en priorité ? Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 232] <- factor(
  data[, 232],
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
names(data)[232] <- "P1_SQ011"
# LimeSurvey Field type: A
data[, 233] <- as.character(data[, 233])
attributes(data)$variable.labels[
  233
] <- "[L’accès aux soins de santé (obtenir des soins lorsque vous en avez besoin, la disponibilité du traitement)] Selon vous, quels aspects de votre trouble psychotique ou de sa prise en charge devraient être améliorés en priorité ? Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 233] <- factor(
  data[, 233],
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
names(data)[233] <- "P1_SQ012"
# LimeSurvey Field type: A
data[, 234] <- as.character(data[, 234])
attributes(data)$variable.labels[
  234
] <- "[Les connaissances scientifiques (par exemple en termes de diagnostic, de traitement, ou de pronostic)] Selon vous, quels aspects de votre trouble psychotique ou de sa prise en charge devraient être améliorés en priorité ? Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 234] <- factor(
  data[, 234],
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
names(data)[234] <- "P1_SQ013"
# LimeSurvey Field type: A
data[, 235] <- as.character(data[, 235])
attributes(data)$variable.labels[
  235
] <- "[L’efficacité du traitement (capacité du traitement à contrôler les symptômes et améliorer la qualité de vie)] Selon vous, quels aspects de votre trouble psychotique ou de sa prise en charge devraient être améliorés en priorité ? Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 235] <- factor(
  data[, 235],
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
names(data)[235] <- "P1_SQ014"
# LimeSurvey Field type: A
data[, 236] <- as.character(data[, 236])
attributes(data)$variable.labels[
  236
] <- "[La pénibilité du traitement (en termes d’effets indésirables ou en termes de logistique/administration du traitement)] Selon vous, quels aspects de votre trouble psychotique ou de sa prise en charge devraient être améliorés en priorité ? Veuillez évaluer chaque aspect selon l’importance que vous lui accordez."
data[, 236] <- factor(
  data[, 236],
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
names(data)[236] <- "P1_SQ015"
# LimeSurvey Field type: F
data[, 237] <- as.numeric(data[, 237])
attributes(data)$variable.labels[
  237
] <- "Souhaitez-vous nous faire part d\'un ou de plusieurs autres besoins importants que vous n\'avez pas pu exprimer dans le questionnaire ?"
data[, 237] <- factor(data[, 237], levels = c(1, 2), labels = c("Oui", "Non"))
names(data)[237] <- "G1"
# LimeSurvey Field type: A
data[, 238] <- as.character(data[, 238])
attributes(data)$variable.labels[
  238
] <- "Quels besoins n\'ont pas été abordés dans le questionnaire ?"
names(data)[238] <- "G2"
# LimeSurvey Field type: F
data[, 239] <- as.numeric(data[, 239])
attributes(data)$variable.labels[
  239
] <- "En tant que personne remplissant le questionnaire pour quelqu’un atteint d’un trouble psychotique: vous considérez-vous comme « aidant proche » ?  C’est-à-dire venant en aide à cette personne en raison de son trouble psychotique, de manière régulière et à titre non professionnel. Par exemple, un parent aidant son enfant, un membre de la famille ou un ami aidant un proche."
data[, 239] <- factor(data[, 239], levels = c(1, 2), labels = c("Oui", "Non"))
names(data)[239] <- "CG1"
# LimeSurvey Field type: A
data[, 240] <- as.character(data[, 240])
attributes(data)$variable.labels[
  240
] <- "Par rapport à la personne que vous aidez, vous êtes :"
data[, 240] <- factor(
  data[, 240],
  levels = c("AO01", "AO02"),
  labels = c(
    "Un membre de la famille (par exemple, parent, enfant, grand-parent…)",
    "Une relation proche (par exemple, ami, voisin…)"
  )
)
names(data)[240] <- "CG2"
# LimeSurvey Field type: A
data[, 241] <- as.character(data[, 241])
attributes(data)$variable.labels[
  241
] <- "[Autre] Par rapport à la personne que vous aidez, vous êtes :"
names(data)[241] <- "CG2_other"
# LimeSurvey Field type: A
data[, 242] <- as.character(data[, 242])
attributes(data)$variable.labels[242] <- "A quel genre vous identifiez-vous ?"
data[, 242] <- factor(
  data[, 242],
  levels = c("AO01", "AO02", "AO03"),
  labels = c("Homme", "Femme", "Autre")
)
names(data)[242] <- "CG3"
# LimeSurvey Field type: F
data[, 243] <- as.numeric(data[, 243])
attributes(data)$variable.labels[243] <- "Quelle est votre année de naissance ?"
names(data)[243] <- "CG4"
# LimeSurvey Field type: F
data[, 244] <- as.numeric(data[, 244])
attributes(data)$variable.labels[
  244
] <- "La semaine dernière, combien de temps avez-vous passé à aider la personne dans des activités qu\'elle aurait normalement faites elle-même si elle était en bonne santé ? Par exemple dans les soins personnels (comme s’habiller/se déshabiller, aller aux toilettes…), les tâches ménagères (comme préparer les repas, nettoyer…) ou le soutien pratique (comme l’accompagner à l’extérieur à des rendez-vous médicaux ou autres…)."
names(data)[244] <- "CG5"
# LimeSurvey Field type: A
data[, 245] <- as.character(data[, 245])
attributes(data)$variable.labels[
  245
] <- "Selon vous, dans quelle mesure votre santé physique et/ou psychologique est impactée en raison de votre rôle d’aidant proche?"
data[, 245] <- factor(
  data[, 245],
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
names(data)[245] <- "CG6"
# LimeSurvey Field type: A
data[, 246] <- as.character(data[, 246])
attributes(data)$variable.labels[
  246
] <- "Selon vous, dans quelle mesure votre vie sociale est impactée en raison de votre rôle d’aidant proche?"
data[, 246] <- factor(
  data[, 246],
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
names(data)[246] <- "CG7"
# LimeSurvey Field type: F
data[, 247] <- as.numeric(data[, 247])
attributes(data)$variable.labels[
  247
] <- "Nous aimerions en savoir plus sur les besoins et les difficultés que vous rencontrez ou avez rencontrées dans le contexte de votre trouble psychotique. Si vous le souhaitez, vous pouvez participer à un entretien individuel (en ligne ou en face à face avec un chercheur) pour discuter plus en détail de vos expériences et de vos besoins. Cet entretien se déroulera de manière confidentielle et indépendamment des soins que vous recevez des prestataires de soins de santé. Il est prévu que 24 patients soient interrogés. Cet entretien individuel durera environ une heure et demie.  Souhaitez-vous participer à un entretien individuel?"
data[, 247] <- factor(data[, 247], levels = c(1, 2), labels = c("Oui", "Non"))
names(data)[247] <- "Follow"
# LimeSurvey Field type: A
data[, 248] <- as.character(data[, 248])
attributes(data)$variable.labels[
  248
] <- "[Adresse e-mail] Si vous êtes intéressé(e) par l\'entretien individuel, merci de nous indiquer vos coordonnées (numéro de téléphone et adresse mail) afin que nous puissons vous contacter."
names(data)[248] <- "NOM_Email"
# LimeSurvey Field type: A
data[, 249] <- as.character(data[, 249])
attributes(data)$variable.labels[
  249
] <- "[Confirmation de l\'adresse e-mail] Si vous êtes intéressé(e) par l\'entretien individuel, merci de nous indiquer vos coordonnées (numéro de téléphone et adresse mail) afin que nous puissons vous contacter."
names(data)[249] <- "NOM_Cemail"
# LimeSurvey Field type: A
data[, 250] <- as.character(data[, 250])
attributes(data)$variable.labels[
  250
] <- "[Numéro de GSM] Si vous êtes intéressé(e) par l\'entretien individuel, merci de nous indiquer vos coordonnées (numéro de téléphone et adresse mail) afin que nous puissons vous contacter."
names(data)[250] <- "NOM_GSM1"
# LimeSurvey Field type: A
data[, 251] <- as.character(data[, 251])
attributes(data)$variable.labels[
  251
] <- "Merci beaucoup pour votre collaboration!  Un membre de l’équipe de recherche vous recontactera d’ici quelques semaines pour vous tenir informé(e) de votre éventuelle participation à un entretien."
names(data)[251] <- "TXS"


# Extract variable labels --------------------------------------------------------

var_labels <- attr(data, "variable.labels")
var_names <- names(data)
var_list <- setNames(as.list(var_labels), var_names)

# Apply labels to the columns and turn factors into labelled ---------------------
data <- data |>
  set_variable_labels(.labels = var_list) |>
  mutate(across(where(is.factor), to_labelled))

# Remove unused attributes
attr(data, "variable.labels") <- NULL

# Generate data dictionnary ------------------------------------------------------

data_dict <- data |>
  generate_dictionary(details = "basic") |>
  convert_list_columns_to_character()

write.xlsx(
  data_dict,
  file = here("data", "metadata", "data_dictionary.xlsx"),
  sheetName = "FR",
  somearg = TRUE
)

# Save data ----------------------------------------------------------------------

saveRDS(data, here("data", "processed", "data_fr.rds"))
