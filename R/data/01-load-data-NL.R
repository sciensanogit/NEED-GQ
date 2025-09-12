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
attributes(data)$variable.labels[8] <- "U vult deze vragenlijst in"
data[, 8] <- factor(
  data[, 8],
  levels = c(1, 2),
  labels = c(
    "Voor uzelf",
    "Voor een andere volwassene. (De persoon die u vertegenwoordigt is momenteel niet in staat om de vragenlijst zelf in te vullen.)"
  )
)
names(data)[8] <- "D1"
# LimeSurvey Field type: A
data[, 9] <- as.character(data[, 9])
attributes(data)$variable.labels[
  9
] <- "Vanaf nu vragen wij u om alle vragen te beantwoorden alsof u de persoon bent die aan de ziekte lijdt. Geef \"ik weet het niet\" aan als u niet weet hoe de persoon zou antwoorden."
names(data)[9] <- "D1b"
# LimeSurvey Field type: A
data[, 10] <- as.character(data[, 10])
attributes(data)$variable.labels[10] <- "Met welk gender identificeert u zich?"
data[, 10] <- factor(
  data[, 10],
  levels = c("A1", "A2", "A3"),
  labels = c("Man", "Vrouw", "Anders")
)
names(data)[10] <- "D2"
# LimeSurvey Field type: F
data[, 11] <- as.numeric(data[, 11])
attributes(data)$variable.labels[11] <- "Wat is uw geboortejaar?"
names(data)[11] <- "D3"
# LimeSurvey Field type: F
data[, 12] <- as.numeric(data[, 12])
attributes(data)$variable.labels[12] <- "In welke provincie woont u?"
data[, 12] <- factor(
  data[, 12],
  levels = c(001, 002, 003, 004, 005, 006, 007, 008, 009, 010, 011, 012, 013),
  labels = c(
    "Antwerpen",
    "Waals-Brabant",
    "Brussel",
    "Henegouwen",
    "Luik",
    "Limburg",
    "Luxemburg",
    "Namen",
    "Oost-Vlaanderen",
    "Vlaams-Brabant",
    "West-Vlaanderen",
    "Ik woon niet in België",
    "Ik weet het niet"
  )
)
names(data)[12] <- "D4"
# LimeSurvey Field type: A
data[, 13] <- as.character(data[, 13])
attributes(data)$variable.labels[
  13
] <- "Hartelijk dank om deze vragenlijst in te vullen. Helaas komt u niet in aanmerking om verder deel te nemen aan dit onderzoek. Indien u interesse heeft in de resultaten van dit onderzoek, zullen deze gepubliceerd worden op de website [website] [wanneer]."
names(data)[13] <- "END1"
# LimeSurvey Field type: A
data[, 14] <- as.character(data[, 14])
attributes(data)$variable.labels[
  14
] <- "Wat is het hoogste diploma of opleidingsniveau dat u tot nu toe heeft behaald?"
data[, 14] <- factor(
  data[, 14],
  levels = c("001", "002", "003", "004", "005", "006", "008"),
  labels = c(
    "Geen diploma of lager onderwijs",
    "Lager secundair onderwijs",
    "Hoger secundair onderwijs",
    "Hoger onderwijs van korte type (bv. Bachelor)",
    "Hoger onderwijs van lange type (bv. Master)",
    "Doctoraat",
    "Ik weet het niet"
  )
)
names(data)[14] <- "D5"
# LimeSurvey Field type: A
data[, 15] <- as.character(data[, 15])
attributes(data)$variable.labels[
  15
] <- "[Anders] Wat is het hoogste diploma of opleidingsniveau dat u tot nu toe heeft behaald?"
names(data)[15] <- "D5_other"
# LimeSurvey Field type: F
data[, 16] <- as.numeric(data[, 16])
attributes(data)$variable.labels[16] <- "[Alleen] U woont…"
data[, 16] <- factor(
  data[, 16],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[16] <- "D6_SQ001"
# LimeSurvey Field type: F
data[, 17] <- as.numeric(data[, 17])
attributes(data)$variable.labels[17] <- "[Alleen met kind(eren)] U woont…"
data[, 17] <- factor(
  data[, 17],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[17] <- "D6_SQ002"
# LimeSurvey Field type: F
data[, 18] <- as.numeric(data[, 18])
attributes(data)$variable.labels[
  18
] <- "[Samenwonend (zonder kinderen)] U woont…"
data[, 18] <- factor(
  data[, 18],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[18] <- "D6_SQ003"
# LimeSurvey Field type: F
data[, 19] <- as.numeric(data[, 19])
attributes(data)$variable.labels[19] <- "[Samenwonend (met kinderen)] U woont…"
data[, 19] <- factor(
  data[, 19],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[19] <- "D6_SQ004"
# LimeSurvey Field type: F
data[, 20] <- as.numeric(data[, 20])
attributes(data)$variable.labels[20] <- "[Bij een of beide ouders] U woont…"
data[, 20] <- factor(
  data[, 20],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[20] <- "D6_SQ005"
# LimeSurvey Field type: F
data[, 21] <- as.numeric(data[, 21])
attributes(data)$variable.labels[
  21
] <- "[In een gedeelde woning / kot] U woont…"
data[, 21] <- factor(
  data[, 21],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[21] <- "D6_SQ006"
# LimeSurvey Field type: F
data[, 22] <- as.numeric(data[, 22])
attributes(data)$variable.labels[22] <- "[In een rusthuis] U woont…"
data[, 22] <- factor(
  data[, 22],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[22] <- "D6_SQ007"
# LimeSurvey Field type: F
data[, 23] <- as.numeric(data[, 23])
attributes(data)$variable.labels[23] <- "[Ik weet het niet] U woont…"
data[, 23] <- factor(
  data[, 23],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[23] <- "D6_SQ008"
# LimeSurvey Field type: A
data[, 24] <- as.character(data[, 24])
attributes(data)$variable.labels[24] <- "[Anders] U woont…"
names(data)[24] <- "D6_other"
# LimeSurvey Field type: F
data[, 25] <- as.numeric(data[, 25])
attributes(data)$variable.labels[25] <- "Wat is uw geboorteland?"
data[, 25] <- factor(
  data[, 25],
  levels = c(001, 002, 003),
  labels = c("België", "Ander land", "Ik weet het niet")
)
names(data)[25] <- "D7"
# Convert to character first
data[, 26] <- as.character(data[, 26])
# Set variable label
attributes(data)$variable.labels[26] <- "Selecteer het betrokken land"
# Define the country codes (A1 to A235)
country_codes <- paste0("A", 1:235)

country_labels <- c(
  "Afghanistan",
  "Zuid-Afrika",
  "Albanië",
  "Algerije",
  "Duitsland",
  "Andorra",
  "Angola",
  "Anguilla",
  "Antarctica",
  "Antigua en Barbuda",
  "Saoedi-Arabië",
  "Argentinië",
  "Armenië",
  "Aruba",
  "Australië",
  "Oostenrijk",
  "Azerbeidzjan",
  "Bahama’s",
  "Bahrein",
  "Bangladesh",
  "Barbados",
  "Belize",
  "Benin",
  "Bermuda",
  "Bhutan",
  "Belarus",
  "Bolivië",
  "Bonaire",
  "Bosnië en Herzegovina",
  "Botswana",
  "Brazilië",
  "Brunei",
  "Bulgarije",
  "Burkina Faso",
  "Burundi",
  "Cambodja",
  "Kameroen",
  "Canada",
  "Kaapverdië",
  "Chili",
  "China",
  "Cyprus",
  "Colombia",
  "Comoren",
  "Congo (Brazzaville)",
  "Congo (Democratische Republiek)",
  "Noord-Korea",
  "Zuid-Korea (Republiek Korea)",
  "Costa Rica",
  "Ivoorkust",
  "Kroatië",
  "Cuba",
  "Curaçao",
  "Denemarken en Faeröer",
  "Djibouti",
  "Dominica",
  "Egypte",
  "El Salvador",
  "Verenigde Arabische Emiraten",
  "Ecuador",
  "Eritrea",
  "Spanje en Canarische Eilanden",
  "Estland",
  "Eswatini (Swaziland)",
  "Verenigde Staten van Amerika",
  "Ethiopië",
  "Fiji",
  "Finland",
  "Frankrijk",
  "Gabon",
  "Gambia",
  "Georgië",
  "Ghana",
  "Gibraltar",
  "Griekenland",
  "Grenada",
  "Groenland",
  "Guadeloupe",
  "Guam",
  "Guatemala",
  "Guinee-Bissau",
  "Guinee (Conakry)",
  "Equatoriaal-Guinea",
  "Guyana (Georgetown)",
  "Frans-Guyana",
  "Haïti",
  "Honduras",
  "Hongkong",
  "Hongarije",
  "Kersteiland",
  "Kaaimaneilanden",
  "Cookeilanden",
  "Falklandeilanden",
  "Marshalleilanden",
  "Salomonseilanden",
  "Amerikaanse Maagdeneilanden",
  "Britse Maagdeneilanden",
  "India",
  "Indonesië",
  "Irak",
  "Iran",
  "Ierland",
  "IJsland",
  "Israël",
  "Italië",
  "Jamaica",
  "Japan",
  "Jordanië",
  "Kazachstan",
  "Kenia",
  "Kirgizië",
  "Kiribati",
  "Kosovo",
  "Koeweit",
  "Laos",
  "Lesotho",
  "Letland",
  "Libanon",
  "Liberia",
  "Libië",
  "Liechtenstein",
  "Litouwen",
  "Luxemburg",
  "Macao (China)",
  "Noord-Macedonië",
  "Madagaskar",
  "Maleisië",
  "Malawi",
  "Malediven",
  "Mali",
  "Malta",
  "Noordelijke Marianen (Amerikaans)",
  "Marokko",
  "Martinique",
  "Mauritius",
  "Mauritanië",
  "Mayotte",
  "Mexico",
  "Micronesië",
  "Moldavië",
  "Monaco",
  "Mongolië",
  "Montenegro",
  "Montserrat (Brits)",
  "Mozambique",
  "Myanmar",
  "Namibië",
  "Nauru",
  "Nepal",
  "Nicaragua",
  "Niger",
  "Nigeria",
  "Niue",
  "Noorwegen",
  "Nieuw-Caledonië",
  "Nieuw-Zeeland",
  "Oman",
  "Oeganda",
  "Oezbekistan",
  "Pakistan",
  "Palau",
  "Palestina",
  "Panama",
  "Papoea-Nieuw-Guinea",
  "Paraguay",
  "Nederland",
  "Peru",
  "Filipijnen",
  "Pitcairn",
  "Polen",
  "Frans-Polynesië",
  "Puerto Rico",
  "Portugal, Azoren, Madeira",
  "Qatar",
  "Centraal-Afrikaanse Republiek",
  "Dominicaanse Republiek",
  "Tsjechië",
  "Réunion",
  "Roemenië",
  "Verenigd Koninkrijk",
  "Rusland",
  "Rwanda",
  "Westelijke Sahara",
  "Saint-Barthélemy",
  "Saint Kitts en Nevis",
  "Sint-Eustatius en Saba",
  "San Marino",
  "Saint-Martin (Frankrijk)",
  "Sint-Maarten (Nederland)",
  "Saint-Pierre en Miquelon",
  "Saint Vincent en de Grenadines",
  "Sint-Helena – Tristan da Cunha – Ascension",
  "Saint Lucia",
  "Samoa",
  "Amerikaans Samoa",
  "São Tomé en Príncipe",
  "Senegal",
  "Servië",
  "Seychellen",
  "Sierra Leone",
  "Singapore",
  "Slowakije",
  "Slovenië",
  "Somalië",
  "Soedan",
  "Zuid-Soedan",
  "Sri Lanka",
  "Zweden",
  "Zwitserland",
  "Suriname",
  "Syrië",
  "Tadzjikistan",
  "Taiwan",
  "Tanzania",
  "Tsjaad",
  "Thailand",
  "Oost-Timor",
  "Togo",
  "Tokelau (Nieuw-Zeeland)",
  "Tonga",
  "Trinidad en Tobago",
  "Tunesië",
  "Turkmenistan",
  "Turks- en Caicoseilanden (Brits)",
  "Turkije",
  "Tuvalu",
  "Oekraïne",
  "Uruguay",
  "Vanuatu",
  "Venezuela",
  "Vietnam",
  "Wallis en Futuna",
  "Jemen",
  "Zambia",
  "Zimbabwe"
)

# Reassign as factor
data[, 26] <- factor(
  data[, 26],
  levels = country_codes,
  labels = country_labels
)
names(data)[26] <- "D8"
# LimeSurvey Field type: A
data[, 27] <- as.character(data[, 27])
attributes(data)$variable.labels[27] <- "[Anders] Selecteer het betrokken land"
names(data)[27] <- "D8_other"
# LimeSurvey Field type: A
data[, 28] <- as.character(data[, 28])
attributes(data)$variable.labels[
  28
] <- "Wat was uw voornaamste beroepsstatuut net vóór (het begin van) uw [de ziekte]?"
data[, 28] <- factor(
  data[, 28],
  levels = c("001", "002", "003", "004", "005", "006", "008"),
  labels = c(
    "Werknemer of zelfstandige (betaald werk)",
    "Werkzoekende, werkloos, OCMW",
    "Huisman/huisvrouw, zonder inkomen",
    "Student",
    "Gepensioneerd",
    "Invaliditeit",
    "Ik weet het niet"
  )
)
names(data)[28] <- "D9"
# LimeSurvey Field type: A
data[, 29] <- as.character(data[, 29])
attributes(data)$variable.labels[
  29
] <- "[Anders] Wat was uw voornaamste beroepsstatuut net vóór (het begin van) uw [de ziekte]?"
names(data)[29] <- "D9_other"
# LimeSurvey Field type: F
data[, 30] <- as.numeric(data[, 30])
attributes(data)$variable.labels[
  30
] <- "Sinds het begin van uw eerste symptomen, heeft u een betaalde job gehad?"
data[, 30] <- factor(
  data[, 30],
  levels = c(001, 002, 003),
  labels = c("Ja", "Nee", "Ik weet het niet")
)
names(data)[30] <- "D10"
# LimeSurvey Field type: A
data[, 31] <- as.character(data[, 31])
attributes(data)$variable.labels[
  31
] <- "Wat is momenteel uw voornaamste beroepsstatuut?"
data[, 31] <- factor(
  data[, 31],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A8"),
  labels = c(
    "Betaald werk (werknemer of zelfstandige)",
    "Werkzoekende, werkloos, OCMW",
    "Huisman/huisvrouw, zonder inkomen",
    "Student",
    "Gepensioneerd",
    "Invaliditeit",
    "Ik weet het niet"
  )
)
names(data)[31] <- "D11"
# LimeSurvey Field type: A
data[, 32] <- as.character(data[, 32])
attributes(data)$variable.labels[
  32
] <- "[Anders] Wat is momenteel uw voornaamste beroepsstatuut?"
names(data)[32] <- "D11_other"
# LimeSurvey Field type: F
data[, 33] <- as.numeric(data[, 33])
attributes(data)$variable.labels[
  33
] <- "Als u rekening houdt met alle inkomens van uw huishouden, in welke mate lukt het om rond te komen aan het einde van elke maand?"
data[, 33] <- factor(
  data[, 33],
  levels = c(001, 002, 003, 004, 005, 006, 007),
  labels = c(
    "Zeer gemakkelijk",
    "Gemakkelijk",
    "Tamelijk gemakkelijk",
    "Met enige moeite",
    "Met moeite",
    "Met grote moeite",
    "Ik weet het niet"
  )
)
names(data)[33] <- "D12"
# LimeSurvey Field type: F
data[, 34] <- as.numeric(data[, 34])
attributes(data)$variable.labels[
  34
] <- "Sinds wanneer heeft u ongeveer de diagnose [de ziekte] gekregen?"
data[, 34] <- factor(
  data[, 34],
  levels = c(001, 002, 003, 004, 005, 006, 007, 008, 009),
  labels = c(
    "Minder dan 2 maanden",
    "2 tot 6 maanden",
    "6 maanden tot 2 jaar",
    "2 tot 5 jaar",
    "5 tot 10 jaar",
    "Meer dan 10 jaar",
    "Ik weet het niet",
    "Ik heb geen diagnose van een arts gekregen",
    "009"
  )
)
names(data)[34] <- "D13"
# LimeSurvey Field type: F
data[, 35] <- as.numeric(data[, 35])
attributes(data)$variable.labels[35] <- "Geef het aantal jaren ongeveer aan:"
names(data)[35] <- "D13b"
# LimeSurvey Field type: A
data[, 36] <- as.character(data[, 36])
attributes(data)$variable.labels[
  36
] <- "Hartelijk dank om deze vragenlijst in te vullen. Helaas komt u niet in aanmerking om verder deel te nemen aan dit onderzoek. Indien u interesse heeft in de resultaten van dit onderzoek, zullen deze gepubliceerd worden op de website [website] [wanneer]."
names(data)[36] <- "END2"
# LimeSurvey Field type: F
data[, 37] <- as.numeric(data[, 37])
attributes(data)$variable.labels[
  37
] <- "Hoeveel tijd zat er tussen uw eerste medisch consult voor [de ziekte] en de diagnose?"
data[, 37] <- factor(
  data[, 37],
  levels = c(001, 002, 003, 004, 005),
  labels = c(
    "Minder dan 2 weken",
    "Tussen 2 weken en 2 maanden",
    "Tussen 2 maanden en 1 jaar",
    "Meer dan 1 jaar",
    "Ik weet het niet"
  )
)
names(data)[37] <- "HC1"
# LimeSurvey Field type: F
data[, 38] <- as.numeric(data[, 38])
attributes(data)$variable.labels[
  38
] <- "Bent u al eens opgenomen in het ziekenhuis door [de ziekte]? Beschouw enkel opnames met overnachting(en)."
data[, 38] <- factor(
  data[, 38],
  levels = c(001, 002, 003),
  labels = c("Ja", "Nee", "Ik weet het niet")
)
names(data)[38] <- "DSD1"
# LimeSurvey Field type: A
data[, 39] <- as.character(data[, 39])
attributes(data)$variable.labels[
  39
] <- "[[Ziekte/probleem 1]] Lijdt u aan één of meerdere van de volgende gezondheidsproblemen die in verband kunnen staan met [de ziekte]?"
data[, 39] <- factor(
  data[, 39],
  levels = c("A1", "A2", "A3"),
  labels = c("Ja", "Nee", "Ik weet het niet")
)
names(data)[39] <- "DSD2_001"

# LimeSurvey Field type: A
data[, 40] <- as.character(data[, 40])
attributes(data)$variable.labels[
  40
] <- "[[Ziekte/probleem 2]] Lijdt u aan één of meerdere van de volgende gezondheidsproblemen die in verband kunnen staan met [de ziekte]?"
data[, 40] <- factor(
  data[, 40],
  levels = c("A1", "A2", "A3"),
  labels = c("Ja", "Nee", "Ik weet het niet")
)
names(data)[40] <- "DSD2_002"

# LimeSurvey Field type: A
data[, 41] <- as.character(data[, 41])
attributes(data)$variable.labels[
  41
] <- "[[Ziekte/probleem 3]] Lijdt u aan één of meerdere van de volgende gezondheidsproblemen die in verband kunnen staan met [de ziekte]?"
data[, 41] <- factor(
  data[, 41],
  levels = c("A1", "A2", "A3"),
  labels = c("Ja", "Nee", "Ik weet het niet")
)
names(data)[41] <- "DSD2_003"

# LimeSurvey Field type: A
data[, 42] <- as.character(data[, 42])
attributes(data)$variable.labels[
  42
] <- "[[Andere]] Lijdt u aan één of meerdere van de volgende gezondheidsproblemen die in verband kunnen staan met [de ziekte]?"
data[, 42] <- factor(
  data[, 42],
  levels = c("A1", "A2", "A3"),
  labels = c("Ja", "Nee", "Ik weet het niet")
)
names(data)[42] <- "DSD2_004"

# LimeSurvey Field type: A
data[, 43] <- as.character(data[, 43])
attributes(data)$variable.labels[
  43
] <- "Lijdt u ook aan een of meerdere andere gezondheidsproblemen?"
data[, 43] <- factor(
  data[, 43],
  levels = c("A1", "A2", "A3"),
  labels = c("Ja", "Nee", "Ik weet het niet")
)
names(data)[43] <- "D14"

# LimeSurvey Field type: F
data[, 44] <- as.numeric(data[, 44])
attributes(data)$variable.labels[
  44
] <- "[Hart- of vaatziekte] Aan welke andere gezondheidsproblemen lijdt u? U kan meerdere vakjes aanvinken. Vermeld ook de exacte naam van uw probleem/problemen indien u die kent. Indien u (nog) geen diagnose heeft, vink dan 'ander gezondheidsprobleem zonder gekende diagnose' aan."
data[, 44] <- factor(
  data[, 44],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[44] <- "D15_2"

# LimeSurvey Field type: A
data[, 45] <- as.character(data[, 45])
attributes(data)$variable.labels[
  45
] <- "[Opmerking] [Hart- of vaatziekte] Aan welke andere gezondheidsproblemen lijdt u? U kan meerdere vakjes aanvinken. Vermeld ook de exacte naam van uw probleem/problemen indien u die kent. Indien u (nog) geen diagnose heeft, vink dan 'ander gezondheidsprobleem zonder gekende diagnose' aan."
names(data)[45] <- "D15_2comment"

# LimeSurvey Field type: F
data[, 46] <- as.numeric(data[, 46])
attributes(data)$variable.labels[
  46
] <- "[Ziekte van de luchtwegen] Aan welke andere gezondheidsproblemen lijdt u? U kan meerdere vakjes aanvinken. Vermeld ook de exacte naam van uw probleem/problemen indien u die kent. Indien u (nog) geen diagnose heeft, vink dan 'ander gezondheidsprobleem zonder gekende diagnose' aan."
data[, 46] <- factor(
  data[, 46],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[46] <- "D15_3"

# LimeSurvey Field type: A
data[, 47] <- as.character(data[, 47])
attributes(data)$variable.labels[
  47
] <- "[Opmerking] [Ziekte van de luchtwegen] Aan welke andere gezondheidsproblemen lijdt u? U kan meerdere vakjes aanvinken. Vermeld ook de exacte naam van uw probleem/problemen indien u die kent. Indien u (nog) geen diagnose heeft, vink dan 'ander gezondheidsprobleem zonder gekende diagnose' aan."
names(data)[47] <- "D15_3comment"

# LimeSurvey Field type: F
data[, 48] <- as.numeric(data[, 48])
attributes(data)$variable.labels[
  48
] <- "[Ziekte van het spijsverteringsstelsel] Aan welke andere gezondheidsproblemen lijdt u? U kan meerdere vakjes aanvinken. Vermeld ook de exacte naam van uw probleem/problemen indien u die kent. Indien u (nog) geen diagnose heeft, vink dan 'ander gezondheidsprobleem zonder gekende diagnose' aan."
data[, 48] <- factor(
  data[, 48],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[48] <- "D15_4"

# LimeSurvey Field type: A
data[, 49] <- as.character(data[, 49])
attributes(data)$variable.labels[
  49
] <- "[Opmerking] [Ziekte van het spijsverteringsstelsel] Aan welke andere gezondheidsproblemen lijdt u? U kan meerdere vakjes aanvinken. Vermeld ook de exacte naam van uw probleem/problemen indien u die kent. Indien u (nog) geen diagnose heeft, vink dan 'ander gezondheidsprobleem zonder gekende diagnose' aan."
names(data)[49] <- "D15_4comment"

# LimeSurvey Field type: F
data[, 50] <- as.numeric(data[, 50])
attributes(data)$variable.labels[
  50
] <- "[Huidaandoening] Aan welke andere gezondheidsproblemen lijdt u? U kan meerdere vakjes aanvinken. Vermeld ook de exacte naam van uw probleem/problemen indien u die kent. Indien u (nog) geen diagnose heeft, vink dan 'ander gezondheidsprobleem zonder gekende diagnose' aan."
data[, 50] <- factor(
  data[, 50],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[50] <- "D15_5"

# LimeSurvey Field type: A
data[, 51] <- as.character(data[, 51])
attributes(data)$variable.labels[
  51
] <- "[Opmerking] [Huidaandoening] Aan welke andere gezondheidsproblemen lijdt u? ..."
names(data)[51] <- "D15_5comment"

# LimeSurvey Field type: F
data[, 52] <- as.numeric(data[, 52])
attributes(data)$variable.labels[
  52
] <- "[Ziekte van botten, gewrichten of spieren] Aan welke andere gezondheidsproblemen lijdt u? ..."
data[, 52] <- factor(
  data[, 52],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[52] <- "D15_6"

# LimeSurvey Field type: A
data[, 53] <- as.character(data[, 53])
attributes(data)$variable.labels[
  53
] <- "[Opmerking] [Ziekte van botten, gewrichten of spieren] Aan welke andere gezondheidsproblemen lijdt u? ..."
names(data)[53] <- "D15_6comment"

# LimeSurvey Field type: F
data[, 54] <- as.numeric(data[, 54])
attributes(data)$variable.labels[
  54
] <- "[Psychisch of psychologisch gezondheidsprobleem] Aan welke andere gezondheidsproblemen lijdt u? ..."
data[, 54] <- factor(
  data[, 54],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[54] <- "D15_7"

# LimeSurvey Field type: A
data[, 55] <- as.character(data[, 55])
attributes(data)$variable.labels[
  55
] <- "[Opmerking] [Psychisch of psychologisch gezondheidsprobleem] Aan welke andere gezondheidsproblemen lijdt u? ..."
names(data)[55] <- "D15_7comment"

# LimeSurvey Field type: F
data[, 56] <- as.numeric(data[, 56])
attributes(data)$variable.labels[
  56
] <- "[Bloedziekte (hematologisch)] Aan welke andere gezondheidsproblemen lijdt u? ..."
data[, 56] <- factor(
  data[, 56],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[56] <- "D15_8"

# LimeSurvey Field type: A
data[, 57] <- as.character(data[, 57])
attributes(data)$variable.labels[
  57
] <- "[Opmerking] [Bloedziekte (hematologisch)] Aan welke andere gezondheidsproblemen lijdt u? ..."
names(data)[57] <- "D15_8comment"

# LimeSurvey Field type: F
data[, 58] <- as.numeric(data[, 58])
attributes(data)$variable.labels[
  58
] <- "[Auto-immuunziekte] Aan welke andere gezondheidsproblemen lijdt u? ..."
data[, 58] <- factor(
  data[, 58],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[58] <- "D15_9"

# LimeSurvey Field type: A
data[, 59] <- as.character(data[, 59])
attributes(data)$variable.labels[
  59
] <- "[Opmerking] [Auto-immuunziekte] Aan welke andere gezondheidsproblemen lijdt u? ..."
names(data)[59] <- "D15_9comment"

# LimeSurvey Field type: F
data[, 60] <- as.numeric(data[, 60])
attributes(data)$variable.labels[
  60
] <- "[Endocriene, nutritionele of metabole ziekte] Aan welke andere gezondheidsproblemen lijdt u? ..."
data[, 60] <- factor(
  data[, 60],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[60] <- "D15_10"

# LimeSurvey Field type: A
data[, 61] <- as.character(data[, 61])
attributes(data)$variable.labels[
  61
] <- "[Opmerking] [Endocriene, nutritionele of metabole ziekte] Aan welke andere gezondheidsproblemen lijdt u? ..."
names(data)[61] <- "D15_10comment"

# LimeSurvey Field type: F
data[, 62] <- as.numeric(data[, 62])
attributes(data)$variable.labels[
  62
] <- "[Ziekte van het zenuwstelsel (neurologisch)] Aan welke andere gezondheidsproblemen lijdt u? ..."
data[, 62] <- factor(
  data[, 62],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[62] <- "D15_11"

# LimeSurvey Field type: A
data[, 63] <- as.character(data[, 63])
attributes(data)$variable.labels[
  63
] <- "[Opmerking] [Ziekte van het zenuwstelsel (neurologisch)] Aan welke andere gezondheidsproblemen lijdt u? ..."
names(data)[63] <- "D15_11comment"

# LimeSurvey Field type: F
data[, 64] <- as.numeric(data[, 64])
attributes(data)$variable.labels[
  64
] <- "[Oogaandoening] Aan welke andere gezondheidsproblemen lijdt u? ..."
data[, 64] <- factor(
  data[, 64],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[64] <- "D15_12"

# LimeSurvey Field type: A
data[, 65] <- as.character(data[, 65])
attributes(data)$variable.labels[
  65
] <- "[Opmerking] [Oogaandoening] Aan welke andere gezondheidsproblemen lijdt u? ..."
names(data)[65] <- "D15_12comment"

# LimeSurvey Field type: F
data[, 66] <- as.numeric(data[, 66])
attributes(data)$variable.labels[
  66
] <- "[Oor- of evenwichtsaandoening] Aan welke andere gezondheidsproblemen lijdt u? U kunt meerdere vakjes aanvinken. Vermeld ook de exacte naam van uw probleem/problemen indien u die kent. Indien u (nog) geen diagnose heeft, vink dan 'ander gezondheidsprobleem zonder gekende diagnose' aan."
data[, 66] <- factor(
  data[, 66],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[66] <- "D15_13"

# LimeSurvey Field type: A
data[, 67] <- as.character(data[, 67])
attributes(data)$variable.labels[
  67
] <- "[Opmerking] [Oor- of evenwichtsaandoening] Aan welke andere gezondheidsproblemen lijdt u? U kunt meerdere vakjes aanvinken. Vermeld ook de exacte naam van uw probleem/problemen indien u die kent. Indien u (nog) geen diagnose heeft, vink dan 'ander gezondheidsprobleem zonder gekende diagnose' aan."
names(data)[67] <- "D15_13comment"

# LimeSurvey Field type: F
data[, 68] <- as.numeric(data[, 68])
attributes(data)$variable.labels[
  68
] <- "[Aandoening van voortplantingsorganen of urinair systeem (bv. blaas, nieren)] Aan welke andere gezondheidsproblemen lijdt u? U kunt meerdere vakjes aanvinken. Vermeld ook de exacte naam van uw probleem/problemen indien u die kent. Indien u (nog) geen diagnose heeft, vink dan 'ander gezondheidsprobleem zonder gekende diagnose' aan."
data[, 68] <- factor(
  data[, 68],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[68] <- "D15_14"

# LimeSurvey Field type: A
data[, 69] <- as.character(data[, 69])
attributes(data)$variable.labels[
  69
] <- "[Opmerking] [Aandoening van voortplantingsorganen of urinair systeem (bv. blaas, nieren)] Aan welke andere gezondheidsproblemen lijdt u? U kunt meerdere vakjes aanvinken. Vermeld ook de exacte naam van uw probleem/problemen indien u die kent. Indien u (nog) geen diagnose heeft, vink dan 'ander gezondheidsprobleem zonder gekende diagnose' aan."
names(data)[69] <- "D15_14comment"

# LimeSurvey Field type: F
data[, 70] <- as.numeric(data[, 70])
attributes(data)$variable.labels[
  70
] <- "[Aandoening die meerdere systemen treft] Aan welke andere gezondheidsproblemen lijdt u? U kunt meerdere vakjes aanvinken. Vermeld ook de exacte naam van uw probleem/problemen indien u die kent. Indien u (nog) geen diagnose heeft, vink dan 'ander gezondheidsprobleem zonder gekende diagnose' aan."
data[, 70] <- factor(
  data[, 70],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[70] <- "D15_15"

# LimeSurvey Field type: A
data[, 71] <- as.character(data[, 71])
attributes(data)$variable.labels[
  71
] <- "[Opmerking] [Aandoening die meerdere systemen treft] Aan welke andere gezondheidsproblemen lijdt u? U kunt meerdere vakjes aanvinken. Vermeld ook de exacte naam van uw probleem/problemen indien u die kent. Indien u (nog) geen diagnose heeft, vink dan 'ander gezondheidsprobleem zonder gekende diagnose' aan."
names(data)[71] <- "D15_15comment"

# LimeSurvey Field type: F
data[, 72] <- as.numeric(data[, 72])
attributes(data)$variable.labels[
  72
] <- "[Ander gezondheidsprobleem zonder gekende diagnose] Aan welke andere gezondheidsproblemen lijdt u? U kunt meerdere vakjes aanvinken. Vermeld ook de exacte naam van uw probleem/problemen indien u die kent. Indien u (nog) geen diagnose heeft, vink dan 'ander gezondheidsprobleem zonder gekende diagnose' aan."
data[, 72] <- factor(
  data[, 72],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[72] <- "D15_1"

# LimeSurvey Field type: A
data[, 73] <- as.character(data[, 73])
attributes(data)$variable.labels[
  73
] <- "[Opmerking] [Ander gezondheidsprobleem zonder gekende diagnose] Aan welke andere gezondheidsproblemen lijdt u? U kunt meerdere vakjes aanvinken. Vermeld ook de exacte naam van uw probleem/problemen indien u die kent. Indien u (nog) geen diagnose heeft, vink dan 'ander gezondheidsprobleem zonder gekende diagnose' aan."
names(data)[73] <- "D15_1comment"

# LimeSurvey Field type: F
data[, 74] <- as.numeric(data[, 74])
attributes(data)$variable.labels[
  74
] <- "[Ik weet het niet] Aan welke andere gezondheidsproblemen lijdt u? U kunt meerdere vakjes aanvinken. Vermeld ook de exacte naam van uw probleem/problemen indien u die kent. Indien u (nog) geen diagnose heeft, vink dan 'ander gezondheidsprobleem zonder gekende diagnose' aan."
data[, 74] <- factor(
  data[, 74],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[74] <- "D15_16"

# LimeSurvey Field type: A
data[, 75] <- as.character(data[, 75])
attributes(data)$variable.labels[
  75
] <- "[Opmerking] [Ik weet het niet] Aan welke andere gezondheidsproblemen lijdt u? U kunt meerdere vakjes aanvinken. Vermeld ook de exacte naam van uw probleem/problemen indien u die kent. Indien u (nog) geen diagnose heeft, vink dan 'ander gezondheidsprobleem zonder gekende diagnose' aan."
names(data)[75] <- "D15_16comment"

# LimeSurvey Field type: A
data[, 76] <- as.character(data[, 76])
attributes(data)$variable.labels[
  76
] <- "[Anders] Aan welke andere gezondheidsproblemen lijdt u? U kunt meerdere vakjes aanvinken. Vermeld ook de exacte naam van uw probleem/problemen indien u die kent. Indien u (nog) geen diagnose heeft, vink dan 'ander gezondheidsprobleem zonder gekende diagnose' aan."
names(data)[76] <- "D15_other"

# LimeSurvey Field type: A
data[, 77] <- as.character(data[, 77])
attributes(data)$variable.labels[
  77
] <- "[Opmerking bij 'Anders'] Aan welke andere gezondheidsproblemen lijdt u? U kunt meerdere vakjes aanvinken. Vermeld ook de exacte naam van uw probleem/problemen indien u die kent. Indien u (nog) geen diagnose heeft, vink dan 'ander gezondheidsprobleem zonder gekende diagnose' aan."
names(data)[77] <- "D15_othercomment"

# LimeSurvey Field type: F
data[, 78] <- as.numeric(data[, 78])
attributes(data)$variable.labels[
  78
] <- "Uw mobiliteit vóór uw eerste symptomen van [de ziekte]"
data[, 78] <- factor(
  data[, 78],
  levels = c(001, 002, 003, 004, 005, 006),
  labels = c(
    "Ik had geen problemen met lopen.",
    "Ik had lichte problemen met lopen.",
    "Ik had matige problemen met lopen.",
    "Ik had ernstige problemen met lopen.",
    "Ik was niet in staat om te lopen.",
    "Ik weet het niet"
  )
)
names(data)[78] <- "H1"

# LimeSurvey Field type: F
data[, 79] <- as.numeric(data[, 79])
attributes(data)$variable.labels[
  79
] <- "Uw zelfzorg vóór uw eerste symptomen van [de ziekte]"
data[, 79] <- factor(
  data[, 79],
  levels = c(001, 002, 003, 004, 005, 006),
  labels = c(
    "Ik had geen problemen om mezelf te wassen of aan te kleden.",
    "Ik had lichte problemen om mezelf te wassen of aan te kleden.",
    "Ik had matige problemen om mezelf te wassen of aan te kleden.",
    "Ik had ernstige problemen om mezelf te wassen of aan te kleden.",
    "Ik was niet in staat om mezelf te wassen of aan te kleden.",
    "Ik weet het niet"
  )
)
names(data)[79] <- "H2"

# LimeSurvey Field type: F
data[, 80] <- as.numeric(data[, 80])
attributes(data)$variable.labels[
  80
] <- "Uw dagelijkse activiteiten vóór uw eerste symptomen van [de ziekte] (bv. werk, studie, huishouden, gezinsactiviteiten of vrije tijd)"
data[, 80] <- factor(
  data[, 80],
  levels = c(001, 002, 003, 004, 005, 006),
  labels = c(
    "Ik had geen problemen om mijn dagelijkse activiteiten uit te voeren.",
    "Ik had lichte problemen om mijn dagelijkse activiteiten uit te voeren.",
    "Ik had matige problemen om mijn dagelijkse activiteiten uit te voeren.",
    "Ik had ernstige problemen om mijn dagelijkse activiteiten uit te voeren.",
    "Ik was niet in staat om mijn dagelijkse activiteiten uit te voeren.",
    "Ik weet het niet"
  )
)
names(data)[80] <- "H3"

# LimeSurvey Field type: F
data[, 81] <- as.numeric(data[, 81])
attributes(data)$variable.labels[
  81
] <- "Uw pijn of ongemak vóór uw eerste symptomen van [de ziekte]"
data[, 81] <- factor(
  data[, 81],
  levels = c(001, 002, 003, 004, 005, 006),
  labels = c(
    "Ik had geen pijn of ongemak.",
    "Ik had lichte pijn of ongemak.",
    "Ik had matige pijn of ongemak.",
    "Ik had ernstige pijn of ongemak.",
    "Ik had extreme pijn of ongemak.",
    "Ik weet het niet"
  )
)
names(data)[81] <- "H4"

# LimeSurvey Field type: F
data[, 82] <- as.numeric(data[, 82])
attributes(data)$variable.labels[
  82
] <- "Uw angst of somberheid vóór uw eerste symptomen van [de ziekte]"
data[, 82] <- factor(
  data[, 82],
  levels = c(001, 002, 003, 004, 005, 006),
  labels = c(
    "Ik was niet angstig of somber.",
    "Ik was licht angstig of somber.",
    "Ik was matig angstig of somber.",
    "Ik was ernstig angstig of somber.",
    "Ik was extreem angstig of somber.",
    "Ik weet het niet"
  )
)
names(data)[82] <- "H5"

# LimeSurvey Field type: F
data[, 83] <- as.numeric(data[, 83])
attributes(data)$variable.labels[
  83
] <- "We willen weten hoe goed of slecht uw gezondheid was VÓÓR uw eerste symptomen van [de ziekte] op een schaal van 0 tot 100. 100 = de beste gezondheid die u zich kunt voorstellen; 0 = de slechtste gezondheid. Vul een getal tussen 0 en 100 in om uw gezondheidstoestand VÓÓR uw eerste symptomen aan te geven."
names(data)[83] <- "H6"

# LimeSurvey Field type: A
data[, 84] <- as.character(data[, 84])
attributes(data)$variable.labels[
  84
] <- "We willen uw huidige gezondheidstoestand kennen, zoals u die vandaag ervaart. Vink het vakje aan naast de uitspraak die uw gezondheid VANDAAG het best beschrijft."
names(data)[84] <- "TXT"

# LimeSurvey Field type: A
data[, 85] <- as.character(data[, 85])
attributes(data)$variable.labels[85] <- "Uw mobiliteit vandaag"
data[, 85] <- factor(
  data[, 85],
  levels = c("Jena1", "Jena2", "Jena3", "Jena4", "Jena5", "Jena6"),
  labels = c(
    "Ik heb geen problemen met lopen.",
    "Ik heb lichte problemen met lopen.",
    "Ik heb matige problemen met lopen.",
    "Ik heb ernstige problemen met lopen.",
    "Ik ben niet in staat om te lopen.",
    "Ik weet het niet"
  )
)
names(data)[85] <- "H7"

# LimeSurvey Field type: F
data[, 86] <- as.numeric(data[, 86])
attributes(data)$variable.labels[86] <- "Uw zelfzorg vandaag"
data[, 86] <- factor(
  data[, 86],
  levels = c(001, 002, 003, 004, 005, 006),
  labels = c(
    "Ik heb geen problemen om mezelf te wassen of aan te kleden.",
    "Ik heb lichte problemen om mezelf te wassen of aan te kleden.",
    "Ik heb matige problemen om mezelf te wassen of aan te kleden.",
    "Ik heb ernstige problemen om mezelf te wassen of aan te kleden.",
    "Ik ben niet in staat om mezelf te wassen of aan te kleden.",
    "Ik weet het niet"
  )
)
names(data)[86] <- "H8"

# LimeSurvey Field type: F
data[, 87] <- as.numeric(data[, 87])
attributes(data)$variable.labels[
  87
] <- "Uw dagelijkse activiteiten vandaag (bv. werk, studie, huishouden, gezinsactiviteiten of vrije tijd)"
data[, 87] <- factor(
  data[, 87],
  levels = c(001, 002, 003, 004, 005, 006),
  labels = c(
    "Ik heb geen problemen om mijn dagelijkse activiteiten uit te voeren.",
    "Ik heb lichte problemen om mijn dagelijkse activiteiten uit te voeren.",
    "Ik heb matige problemen om mijn dagelijkse activiteiten uit te voeren.",
    "Ik heb ernstige problemen om mijn dagelijkse activiteiten uit te voeren.",
    "Ik ben niet in staat om mijn dagelijkse activiteiten uit te voeren.",
    "Ik weet het niet"
  )
)
names(data)[87] <- "H9"

# LimeSurvey Field type: F
data[, 88] <- as.numeric(data[, 88])
attributes(data)$variable.labels[88] <- "Uw pijn of ongemak vandaag"
data[, 88] <- factor(
  data[, 88],
  levels = c(001, 002, 003, 004, 005, 006),
  labels = c(
    "Ik heb geen pijn of ongemak.",
    "Ik heb lichte pijn of ongemak.",
    "Ik heb matige pijn of ongemak.",
    "Ik heb ernstige pijn of ongemak.",
    "Ik heb extreme pijn of ongemak.",
    "Ik weet het niet"
  )
)
names(data)[88] <- "H10"

# LimeSurvey Field type: F
data[, 89] <- as.numeric(data[, 89])
attributes(data)$variable.labels[89] <- "Uw angst of somberheid vandaag"
data[, 89] <- factor(
  data[, 89],
  levels = c(001, 002, 003, 004, 005, 006),
  labels = c(
    "Ik ben niet angstig of somber.",
    "Ik ben licht angstig of somber.",
    "Ik ben matig angstig of somber.",
    "Ik ben ernstig angstig of somber.",
    "Ik ben extreem angstig of somber.",
    "Ik weet het niet"
  )
)
names(data)[89] <- "H11"

# LimeSurvey Field type: F
data[, 90] <- as.numeric(data[, 90])
attributes(data)$variable.labels[
  90
] <- "We willen weten hoe goed of slecht uw gezondheid VANDAAG is op een schaal van 0 tot 100. 100 = de beste gezondheid die u zich kunt voorstellen; 0 = de slechtste gezondheid. Vul een getal tussen 0 en 100 in om uw gezondheidstoestand VANDAAG aan te geven."
names(data)[90] <- "H12"

# LimeSurvey Field type: A
data[, 91] <- as.character(data[, 91])
attributes(data)$variable.labels[
  91
] <- "Heeft u in de afgelopen 5 jaar een behandeling gekregen in verband met uw [ziekte]?"
data[, 91] <- factor(
  data[, 91],
  levels = c("A1", "A2", "A3"),
  labels = c("Ja", "Nee", "Ik weet het niet")
)
names(data)[91] <- "HC2"

# LimeSurvey Field type: F
data[, 92] <- as.numeric(data[, 92])
attributes(data)$variable.labels[
  92
] <- "[[Geneesmiddel type 1]] Welke behandelingen heeft u in de afgelopen 5 jaar gekregen voor uw [ziekte]?"
data[, 92] <- factor(
  data[, 92],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[92] <- "HC3_SQ005"

# LimeSurvey Field type: F
data[, 93] <- as.numeric(data[, 93])
attributes(data)$variable.labels[
  93
] <- "[[Geneesmiddel type 2]] Welke behandelingen heeft u in de afgelopen 5 jaar gekregen voor uw [ziekte]?"
data[, 93] <- factor(
  data[, 93],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[93] <- "HC3_SQ006"

# LimeSurvey Field type: F
data[, 94] <- as.numeric(data[, 94])
attributes(data)$variable.labels[
  94
] <- "[[Geneesmiddel type 3]] Welke behandelingen heeft u in de afgelopen 5 jaar gekregen voor uw [ziekte]?"
data[, 94] <- factor(
  data[, 94],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[94] <- "HC3_SQ007"

# LimeSurvey Field type: F
data[, 95] <- as.numeric(data[, 95])
attributes(data)$variable.labels[
  95
] <- "[[Overige]] Welke behandelingen heeft u in de afgelopen 5 jaar gekregen voor uw [ziekte]?"
data[, 95] <- factor(
  data[, 95],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[95] <- "HC3_SQ008"

# LimeSurvey Field type: F
data[, 96] <- as.numeric(data[, 96])
attributes(data)$variable.labels[
  96
] <- "[[Kinesitherapie]] Welke behandelingen heeft u in de afgelopen 5 jaar gekregen voor uw [ziekte]?"
data[, 96] <- factor(
  data[, 96],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[96] <- "HC3_SQ001"

# LimeSurvey Field type: F
data[, 97] <- as.numeric(data[, 97])
attributes(data)$variable.labels[
  97
] <- "[[Aanpassing van de voeding]] Welke behandelingen heeft u in de afgelopen 5 jaar gekregen voor uw [ziekte]?"
data[, 97] <- factor(
  data[, 97],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[97] <- "HC3_SQ002"

# LimeSurvey Field type: F
data[, 98] <- as.numeric(data[, 98])
attributes(data)$variable.labels[
  98
] <- "[[Chirurgische ingreep]] Welke behandelingen heeft u in de afgelopen 5 jaar gekregen voor uw [ziekte]?"
data[, 98] <- factor(
  data[, 98],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[98] <- "HC3_SQ003"

# LimeSurvey Field type: F
data[, 99] <- as.numeric(data[, 99])
attributes(data)$variable.labels[
  99
] <- "[Ik weet het niet] Welke behandelingen heeft u in de afgelopen 5 jaar gekregen voor uw [ziekte]?"
data[, 99] <- factor(
  data[, 99],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[99] <- "HC3_SQ004"

# LimeSurvey Field type: A
data[, 100] <- as.character(data[, 100])
attributes(data)$variable.labels[
  100
] <- "[Anders] Welke behandelingen heeft u in de afgelopen 5 jaar gekregen voor uw [ziekte]?"
names(data)[100] <- "HC3_other"

# LimeSurvey Field type: F
data[, 101] <- as.numeric(data[, 101])
attributes(data)$variable.labels[
  101
] <- "[[Bijwerking 1]] Welke bijwerking(en) had u tijdens of na de behandeling van [de ziekte] in de afgelopen 5 jaar?"
data[, 101] <- factor(
  data[, 101],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[101] <- "HC4_SQ005"

# LimeSurvey Field type: F
data[, 102] <- as.numeric(data[, 102])
attributes(data)$variable.labels[
  102
] <- "[[Bijwerking 2]] Welke bijwerking(en) had u tijdens of na de behandeling van [de ziekte] in de afgelopen 5 jaar?"
data[, 102] <- factor(
  data[, 102],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[102] <- "HC4_SQ006"

# LimeSurvey Field type: F
data[, 103] <- as.numeric(data[, 103])
attributes(data)$variable.labels[
  103
] <- "[[Bijwerking 3]] Welke bijwerking(en) had u tijdens of na de behandeling van [de ziekte] in de afgelopen 5 jaar?"
data[, 103] <- factor(
  data[, 103],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[103] <- "HC4_SQ007"

# LimeSurvey Field type: F
data[, 104] <- as.numeric(data[, 104])
attributes(data)$variable.labels[
  104
] <- "[[Etc.]] Welke bijwerking(en) had u tijdens of na de behandeling van [de ziekte] in de afgelopen 5 jaar?"
data[, 104] <- factor(
  data[, 104],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[104] <- "HC4_SQ008"

# LimeSurvey Field type: F
data[, 105] <- as.numeric(data[, 105])
attributes(data)$variable.labels[
  105
] <- "[[Verandering in uiterlijk]] Welke bijwerking(en) had u tijdens of na de behandeling van [de ziekte] in de afgelopen 5 jaar?"
data[, 105] <- factor(
  data[, 105],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[105] <- "HC4_SQ001"

# LimeSurvey Field type: F
data[, 106] <- as.numeric(data[, 106])
attributes(data)$variable.labels[
  106
] <- "[[Vermoeidheid of uitputting]] Welke bijwerking(en) had u tijdens of na de behandeling van [de ziekte] in de afgelopen 5 jaar?"
data[, 106] <- factor(
  data[, 106],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[106] <- "HC4_SQ002"

# LimeSurvey Field type: F
data[, 107] <- as.numeric(data[, 107])
attributes(data)$variable.labels[
  107
] <- "[[Complicaties van de operatie]] Welke bijwerking(en) had u tijdens of na de behandeling van [de ziekte] in de afgelopen 5 jaar?"
data[, 107] <- factor(
  data[, 107],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[107] <- "HC4_SQ003"

# LimeSurvey Field type: F
data[, 108] <- as.numeric(data[, 108])
attributes(data)$variable.labels[
  108
] <- "[Andere bijwerking] Welke bijwerking(en) had u tijdens of na de behandeling van [de ziekte] in de afgelopen 5 jaar?"
data[, 108] <- factor(
  data[, 108],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[108] <- "HC4_SQ010"

# LimeSurvey Field type: F
data[, 109] <- as.numeric(data[, 109])
attributes(data)$variable.labels[
  109
] <- "[Geen bijwerkingen] Welke bijwerking(en) had u tijdens of na de behandeling van [de ziekte] in de afgelopen 5 jaar?"
data[, 109] <- factor(
  data[, 109],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[109] <- "HC4_SQ004"

# LimeSurvey Field type: F
data[, 110] <- as.numeric(data[, 110])
attributes(data)$variable.labels[
  110
] <- "[Ik weet het niet] Welke bijwerking(en) had u tijdens of na de behandeling van [de ziekte] in de afgelopen 5 jaar?"
data[, 110] <- factor(
  data[, 110],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[110] <- "HC4_SQ009"

# LimeSurvey Field type: A
data[, 111] <- as.character(data[, 111])
attributes(data)$variable.labels[
  111
] <- "[Bijwerking 1] Welke andere bijwerking(en)?"
names(data)[111] <- "HC4b_SQ001"

# LimeSurvey Field type: A
data[, 112] <- as.character(data[, 112])
attributes(data)$variable.labels[
  112
] <- "[Bijwerking 2] Welke andere bijwerking(en)?"
names(data)[112] <- "HC4b_SQ002"

# LimeSurvey Field type: A
data[, 113] <- as.character(data[, 113])
attributes(data)$variable.labels[
  113
] <- "[Bijwerking 3] Welke andere bijwerking(en)?"
names(data)[113] <- "HC4b_SQ003"

# LimeSurvey Field type: A
data[, 114] <- as.character(data[, 114])
attributes(data)$variable.labels[
  114
] <- "[Bijwerking 4] Welke andere bijwerking(en)?"
names(data)[114] <- "HC4b_SQ004"

# LimeSurvey Field type: A
data[, 115] <- as.character(data[, 115])
attributes(data)$variable.labels[
  115
] <- "[Bijwerking 5] Welke andere bijwerking(en)?"
names(data)[115] <- "HC4b_SQ005"

# LimeSurvey Field type: A
data[, 116] <- as.character(data[, 116])
attributes(data)$variable.labels[
  116
] <- "[[Bijwerking 1]] Geef aan in welke mate elke bijwerking belastend voor u was."
data[, 116] <- factor(
  data[, 116],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Helemaal niet belastend",
    "Licht belastend",
    "Matig belastend",
    "Zeer belastend",
    "Extreem belastend",
    "Ik weet het niet"
  )
)
names(data)[116] <- "HC5_SQ005"

# LimeSurvey Field type: A
data[, 117] <- as.character(data[, 117])
attributes(data)$variable.labels[
  117
] <- "[[Bijwerking 2]] Geef aan in welke mate elke bijwerking belastend voor u was."
data[, 117] <- factor(
  data[, 117],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Helemaal niet belastend",
    "Licht belastend",
    "Matig belastend",
    "Zeer belastend",
    "Extreem belastend",
    "Ik weet het niet"
  )
)
names(data)[117] <- "HC5_SQ006"

# LimeSurvey Field type: A
data[, 118] <- as.character(data[, 118])
attributes(data)$variable.labels[
  118
] <- "[[Bijwerking 3]] Geef aan in welke mate elke bijwerking belastend voor u was."
data[, 118] <- factor(
  data[, 118],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Helemaal niet belastend",
    "Licht belastend",
    "Matig belastend",
    "Zeer belastend",
    "Extreem belastend",
    "Ik weet het niet"
  )
)
names(data)[118] <- "HC5_SQ007"

# LimeSurvey Field type: A
data[, 119] <- as.character(data[, 119])
attributes(data)$variable.labels[
  119
] <- "[[Etc.]] Geef aan in welke mate elke bijwerking belastend voor u was."
data[, 119] <- factor(
  data[, 119],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Helemaal niet belastend",
    "Licht belastend",
    "Matig belastend",
    "Zeer belastend",
    "Extreem belastend",
    "Ik weet het niet"
  )
)
names(data)[119] <- "HC5_SQ008"

# LimeSurvey Field type: A
data[, 120] <- as.character(data[, 120])
attributes(data)$variable.labels[
  120
] <- "[[Verandering in uiterlijk]] Geef aan in welke mate elke bijwerking belastend voor u was."
data[, 120] <- factor(
  data[, 120],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Helemaal niet belastend",
    "Licht belastend",
    "Matig belastend",
    "Zeer belastend",
    "Extreem belastend",
    "Ik weet het niet"
  )
)
names(data)[120] <- "HC5_SQ001"

# LimeSurvey Field type: A
data[, 121] <- as.character(data[, 121])
attributes(data)$variable.labels[
  121
] <- "[[Vermoeidheid of uitputting]] Geef aan in welke mate elke bijwerking belastend voor u was."
data[, 121] <- factor(
  data[, 121],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Helemaal niet belastend",
    "Licht belastend",
    "Matig belastend",
    "Zeer belastend",
    "Extreem belastend",
    "Ik weet het niet"
  )
)
names(data)[121] <- "HC5_SQ002"

# LimeSurvey Field type: A
data[, 122] <- as.character(data[, 122])
attributes(data)$variable.labels[
  122
] <- "[[Complicaties van de operatie]] Geef aan in welke mate elke bijwerking belastend voor u was."
data[, 122] <- factor(
  data[, 122],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Helemaal niet belastend",
    "Licht belastend",
    "Matig belastend",
    "Zeer belastend",
    "Extreem belastend",
    "Ik weet het niet"
  )
)
names(data)[122] <- "HC5_SQ003"

# LimeSurvey Field type: A
data[, 123] <- as.character(data[, 123])
attributes(data)$variable.labels[
  123
] <- "[{HC4b_SQ001.shown}] Geef aan in welke mate elke bijwerking belastend voor u was."
data[, 123] <- factor(
  data[, 123],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Helemaal niet belastend",
    "Licht belastend",
    "Matig belastend",
    "Zeer belastend",
    "Extreem belastend",
    "Ik weet het niet"
  )
)
names(data)[123] <- "HC5_SQ010"

# LimeSurvey Field type: A
data[, 124] <- as.character(data[, 124])
attributes(data)$variable.labels[
  124
] <- "[{HC4b_SQ002.shown}] Geef aan in welke mate elke bijwerking belastend voor u was."
data[, 124] <- factor(
  data[, 124],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Helemaal niet belastend",
    "Licht belastend",
    "Matig belastend",
    "Zeer belastend",
    "Extreem belastend",
    "Ik weet het niet"
  )
)
names(data)[124] <- "HC5_SQ011"

# LimeSurvey Field type: A
data[, 125] <- as.character(data[, 125])
attributes(data)$variable.labels[
  125
] <- "[{HC4b_SQ003.shown}] Geef aan in welke mate elke bijwerking belastend voor u was."
data[, 125] <- factor(
  data[, 125],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Helemaal niet belastend",
    "Licht belastend",
    "Matig belastend",
    "Zeer belastend",
    "Extreem belastend",
    "Ik weet het niet"
  )
)
names(data)[125] <- "HC5_SQ012"

# LimeSurvey Field type: A
data[, 126] <- as.character(data[, 126])
attributes(data)$variable.labels[
  126
] <- "[{HC4b_SQ004.shown}] Geef aan in welke mate elke bijwerking belastend voor u was."
data[, 126] <- factor(
  data[, 126],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Helemaal niet belastend",
    "Licht belastend",
    "Matig belastend",
    "Zeer belastend",
    "Extreem belastend",
    "Ik weet het niet"
  )
)
names(data)[126] <- "HC5_SQ013"

# LimeSurvey Field type: A
data[, 127] <- as.character(data[, 127])
attributes(data)$variable.labels[
  127
] <- "[{HC4b_SQ005.shown}] Geef aan in welke mate elke bijwerking belastend voor u was."
data[, 127] <- factor(
  data[, 127],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Helemaal niet belastend",
    "Licht belastend",
    "Matig belastend",
    "Zeer belastend",
    "Extreem belastend",
    "Ik weet het niet"
  )
)
names(data)[127] <- "HC5_SQ014"

# LimeSurvey Field type: F
data[, 128] <- as.numeric(data[, 128])
attributes(data)$variable.labels[
  128
] <- "Afgezien van bijwerkingen: in welke mate was de behandeling die u in de afgelopen 5 jaar voor [de ziekte] heeft gekregen belastend voor u? Bijvoorbeeld door toediening via injectie, naar het ziekenhuis moeten voor de behandeling, het geneesmiddel in de koelkast moeten bewaren, een strikt innameschema, enz."
data[, 128] <- factor(
  data[, 128],
  levels = c(001, 002, 003, 004, 005, 006),
  labels = c(
    "Helemaal niet belastend",
    "Licht belastend",
    "Matig belastend",
    "Zeer belastend",
    "Extreem belastend",
    "Ik weet het niet"
  )
)
names(data)[128] <- "HC6"

# LimeSurvey Field type: A
data[, 129] <- as.character(data[, 129])
attributes(data)$variable.labels[
  129
] <- "Sinds het begin van uw ziekte: heeft u een chirurgische ingreep (bv. [voorbeelden van ziekte-relevante ingrepen]) ondergaan vanwege uw [ziekte]?"
data[, 129] <- factor(
  data[, 129],
  levels = c("A1", "A2", "A3"),
  labels = c("Ja", "Nee", "Ik weet het niet")
)
names(data)[129] <- "DSHC1"

# LimeSurvey Field type: A
data[, 130] <- as.character(data[, 130])
attributes(data)$variable.labels[
  130
] <- "[[Specifiek symptoom 1]] Sinds u wordt opgevolgd of behandeld voor de ziekte: welke van de volgende symptomen heeft u ervaren en in welke mate waren ze belastend voor u? Negeer eventuele bijwerkingen van de behandeling."
data[, 130] <- factor(
  data[, 130],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Ik heb dit symptoom niet gehad",
    "Helemaal niet belastend",
    "Licht belastend",
    "Matig belastend",
    "Zeer belastend",
    "Extreem belastend",
    "Ik weet het niet"
  )
)
names(data)[130] <- "H13_SQ013"

# LimeSurvey Field type: A
data[, 131] <- as.character(data[, 131])
attributes(data)$variable.labels[
  131
] <- "[[Specifiek symptoom 2]] Sinds u wordt opgevolgd of behandeld voor de ziekte: welke van de volgende symptomen heeft u ervaren en in welke mate waren ze belastend voor u? Negeer eventuele bijwerkingen van de behandeling."
data[, 131] <- factor(
  data[, 131],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Ik heb dit symptoom niet gehad",
    "Helemaal niet belastend",
    "Licht belastend",
    "Matig belastend",
    "Zeer belastend",
    "Extreem belastend",
    "Ik weet het niet"
  )
)
names(data)[131] <- "H13_SQ014"

# LimeSurvey Field type: A
data[, 132] <- as.character(data[, 132])
attributes(data)$variable.labels[
  132
] <- "[Hoofdpijn] Sinds u wordt opgevolgd of behandeld voor de ziekte: welke van de volgende symptomen heeft u ervaren en in welke mate waren ze belastend voor u? Negeer eventuele bijwerkingen van de behandeling."
data[, 132] <- factor(
  data[, 132],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Ik heb dit symptoom niet gehad",
    "Helemaal niet belastend",
    "Licht belastend",
    "Matig belastend",
    "Zeer belastend",
    "Extreem belastend",
    "Ik weet het niet"
  )
)
names(data)[132] <- "H13_SQ001"

# LimeSurvey Field type: A
data[, 133] <- as.character(data[, 133])
attributes(data)$variable.labels[
  133
] <- "[Concentratieproblemen] Sinds u wordt opgevolgd of behandeld voor de ziekte: welke van de volgende symptomen heeft u ervaren en in welke mate waren ze belastend voor u? Negeer eventuele bijwerkingen van de behandeling."
data[, 133] <- factor(
  data[, 133],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Ik heb dit symptoom niet gehad",
    "Helemaal niet belastend",
    "Licht belastend",
    "Matig belastend",
    "Zeer belastend",
    "Extreem belastend",
    "Ik weet het niet"
  )
)
names(data)[133] <- "H13_SQ002"

# LimeSurvey Field type: A
data[, 134] <- as.character(data[, 134])
attributes(data)$variable.labels[
  134
] <- "[Energietekort] Sinds u wordt opgevolgd of behandeld voor de ziekte: welke van de volgende symptomen heeft u ervaren en in welke mate waren ze belastend voor u? Negeer eventuele bijwerkingen van de behandeling."
data[, 134] <- factor(
  data[, 134],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Ik heb dit symptoom niet gehad",
    "Helemaal niet belastend",
    "Licht belastend",
    "Matig belastend",
    "Zeer belastend",
    "Extreem belastend",
    "Ik weet het niet"
  )
)
names(data)[134] <- "H13_SQ003"

# LimeSurvey Field type: A
data[, 135] <- as.character(data[, 135])
attributes(data)$variable.labels[
  135
] <- "[Vermoeidheid of uitputting] Sinds u wordt opgevolgd of behandeld voor de ziekte: welke van de volgende symptomen heeft u ervaren en in welke mate waren ze belastend voor u? Negeer eventuele bijwerkingen van de behandeling."
data[, 135] <- factor(
  data[, 135],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Ik heb dit symptoom niet gehad",
    "Helemaal niet belastend",
    "Licht belastend",
    "Matig belastend",
    "Zeer belastend",
    "Extreem belastend",
    "Ik weet het niet"
  )
)
names(data)[135] <- "H13_SQ004"

# LimeSurvey Field type: A
data[, 136] <- as.character(data[, 136])
attributes(data)$variable.labels[
  136
] <- "[Gevoelens van onrust, nervositeit of prikkelbaarheid] Sinds u wordt opgevolgd of behandeld voor de ziekte: welke van de volgende symptomen heeft u ervaren en in welke mate waren ze belastend voor u? Negeer eventuele bijwerkingen van de behandeling."
data[, 136] <- factor(
  data[, 136],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Ik heb dit symptoom niet gehad",
    "Helemaal niet belastend",
    "Licht belastend",
    "Matig belastend",
    "Zeer belastend",
    "Extreem belastend",
    "Ik weet het niet"
  )
)
names(data)[136] <- "H13_SQ005"

# LimeSurvey Field type: A
data[, 137] <- as.character(data[, 137])
attributes(data)$variable.labels[
  137
] <- "[Woede of agressiviteit] Sinds u wordt opgevolgd of behandeld voor de ziekte: welke van de volgende symptomen heeft u ervaren en in welke mate waren ze belastend voor u? Negeer eventuele bijwerkingen van de behandeling."
data[, 137] <- factor(
  data[, 137],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Ik heb dit symptoom niet gehad",
    "Helemaal niet belastend",
    "Licht belastend",
    "Matig belastend",
    "Zeer belastend",
    "Extreem belastend",
    "Ik weet het niet"
  )
)
names(data)[137] <- "H13_SQ006"

# LimeSurvey Field type: A
data[, 138] <- as.character(data[, 138])
attributes(data)$variable.labels[
  138
] <- "[Stemmingswisselingen] Sinds u wordt opgevolgd of behandeld voor de ziekte: welke van de volgende symptomen heeft u ervaren en in welke mate waren ze belastend voor u? Negeer eventuele bijwerkingen van de behandeling."
data[, 138] <- factor(
  data[, 138],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Ik heb dit symptoom niet gehad",
    "Helemaal niet belastend",
    "Licht belastend",
    "Matig belastend",
    "Zeer belastend",
    "Extreem belastend",
    "Ik weet het niet"
  )
)
names(data)[138] <- "H13_SQ007"

# LimeSurvey Field type: A
data[, 139] <- as.character(data[, 139])
attributes(data)$variable.labels[
  139
] <- "[Angst of bezorgdheid] Sinds u wordt opgevolgd of behandeld voor de ziekte: welke van de volgende symptomen heeft u ervaren en in welke mate waren ze belastend voor u? Negeer eventuele bijwerkingen van de behandeling."
data[, 139] <- factor(
  data[, 139],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Ik heb dit symptoom niet gehad",
    "Helemaal niet belastend",
    "Licht belastend",
    "Matig belastend",
    "Zeer belastend",
    "Extreem belastend",
    "Ik weet het niet"
  )
)
names(data)[139] <- "H13_SQ008"

# LimeSurvey Field type: A
data[, 140] <- as.character(data[, 140])
attributes(data)$variable.labels[
  140
] <- "[Gevoel van neerslachtigheid, depressie of verdriet] Sinds u wordt opgevolgd of behandeld voor de ziekte: welke van de volgende symptomen heeft u ervaren en in welke mate waren ze belastend voor u? Negeer bijwerkingen van de behandeling."
data[, 140] <- factor(
  data[, 140],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Ik heb dit symptoom niet gehad",
    "Helemaal niet belastend",
    "Licht belastend",
    "Matig belastend",
    "Zeer belastend",
    "Extreem belastend",
    "Ik weet het niet"
  )
)
names(data)[140] <- "H13_SQ009"

# LimeSurvey Field type: A
data[, 141] <- as.character(data[, 141])
attributes(data)$variable.labels[
  141
] <- "[Stress] Sinds u wordt opgevolgd of behandeld voor de ziekte: welke van de volgende symptomen heeft u ervaren en in welke mate waren ze belastend voor u? Negeer bijwerkingen van de behandeling."
data[, 141] <- factor(
  data[, 141],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Ik heb dit symptoom niet gehad",
    "Helemaal niet belastend",
    "Licht belastend",
    "Matig belastend",
    "Zeer belastend",
    "Extreem belastend",
    "Ik weet het niet"
  )
)
names(data)[141] <- "H13_SQ015"

# LimeSurvey Field type: A
data[, 142] <- as.character(data[, 142])
attributes(data)$variable.labels[
  142
] <- "[Stigma of gevoel van discriminatie] Sinds u wordt opgevolgd of behandeld voor de ziekte: welke van de volgende symptomen heeft u ervaren en in welke mate waren ze belastend voor u? Negeer bijwerkingen van de behandeling."
data[, 142] <- factor(
  data[, 142],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Ik heb dit symptoom niet gehad",
    "Helemaal niet belastend",
    "Licht belastend",
    "Matig belastend",
    "Zeer belastend",
    "Extreem belastend",
    "Ik weet het niet"
  )
)
names(data)[142] <- "H13_SQ010"

# LimeSurvey Field type: A
data[, 143] <- as.character(data[, 143])
attributes(data)$variable.labels[
  143
] <- "[Verlies van zelfvertrouwen] Sinds u wordt opgevolgd of behandeld voor de ziekte: welke van de volgende symptomen heeft u ervaren en in welke mate waren ze belastend voor u? Negeer bijwerkingen van de behandeling."
data[, 143] <- factor(
  data[, 143],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Ik heb dit symptoom niet gehad",
    "Helemaal niet belastend",
    "Licht belastend",
    "Matig belastend",
    "Zeer belastend",
    "Extreem belastend",
    "Ik weet het niet"
  )
)
names(data)[143] <- "H13_SQ011"

# LimeSurvey Field type: A
data[, 144] <- as.character(data[, 144])
attributes(data)$variable.labels[
  144
] <- "[Ander symptoom] Sinds u wordt opgevolgd of behandeld voor de ziekte: welke van de volgende symptomen heeft u ervaren en in welke mate waren ze belastend voor u? Negeer bijwerkingen van de behandeling."
data[, 144] <- factor(
  data[, 144],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Ik heb dit symptoom niet gehad",
    "Helemaal niet belastend",
    "Licht belastend",
    "Matig belastend",
    "Zeer belastend",
    "Extreem belastend",
    "Ik weet het niet"
  )
)
names(data)[144] <- "H13_SQ012"

# LimeSurvey Field type: A
data[, 145] <- as.character(data[, 145])
attributes(data)$variable.labels[145] <- "Welk ander symptoom?"
names(data)[145] <- "H13b"

# LimeSurvey Field type: F
data[, 146] <- as.numeric(data[, 146])
attributes(data)$variable.labels[
  146
] <- "In welke mate heeft [de ziekte] uw seksleven beïnvloed?"
data[, 146] <- factor(
  data[, 146],
  levels = c(001, 002, 003, 004, 005, 006, 007, 008),
  labels = c(
    "Helemaal niet",
    "Licht",
    "Matig",
    "Veel",
    "Extreem",
    "Ik weet het niet",
    "Niet van toepassing",
    "Ik wil niet antwoorden"
  )
)
names(data)[146] <- "H14"

# LimeSurvey Field type: F
data[, 147] <- as.numeric(data[, 147])
attributes(data)$variable.labels[
  147
] <- "In welke mate heeft uw [ziekte] uw voortplantingsleven beïnvloed, d.w.z. uw mogelijkheid of beslissing om natuurlijk kinderen te krijgen of een zwangerschap uit te dragen? Bijvoorbeeld: IVF, genetische screening, sperma-/eiceldonatie, noodzaak om een zwangerschap uit te stellen, of afzien van biologische kinderen wegens de ziekte."
data[, 147] <- factor(
  data[, 147],
  levels = c(001, 002, 003, 004, 005, 006, 007, 008),
  labels = c(
    "Helemaal niet",
    "Licht",
    "Matig",
    "Veel",
    "Extreem",
    "Ik weet het niet",
    "Niet van toepassing (bijv. u hebt (nog) niet overwogen kinderen te krijgen, of u werd destijds niet door de ziekte getroffen)",
    "Ik wil niet antwoorden"
  )
)
names(data)[147] <- "H15"

# LimeSurvey Field type: A
data[, 148] <- as.character(data[, 148])
attributes(data)$variable.labels[
  148
] <- "Met ‘zorgtraject’ bedoelen we alle afspraken, behandelingen en begeleiding die zorgverleners aanbieden om uw gezondheidstoestand in verband met [de ziekte] te beheren en te verbeteren."
names(data)[148] <- "INFO"

# LimeSurvey Field type: F
data[, 149] <- as.numeric(data[, 149])
attributes(data)$variable.labels[
  149
] <- "Vindt u dat uw zorgtraject in de loop van de tijd goed georganiseerd en gepland was?"
data[, 149] <- factor(
  data[, 149],
  levels = c(001, 002, 003, 004, 005, 006),
  labels = c("Altijd", "Vaak", "Soms", "Zelden", "Nooit", "Ik weet het niet")
)
names(data)[149] <- "HC7"

# LimeSurvey Field type: F
data[, 150] <- as.numeric(data[, 150])
attributes(data)$variable.labels[
  150
] <- "Heeft u één of meer zorgverleners die verantwoordelijk zijn voor de coördinatie van de verschillende medische diensten die u nodig heeft?"
data[, 150] <- factor(
  data[, 150],
  levels = c(001, 002, 003, 004),
  labels = c(
    "Ja",
    "Nee",
    "Ik weet het niet",
    "Niet van toepassing: de opvolging gebeurt binnen één dienst, zonder nood aan coördinatie"
  )
)
names(data)[150] <- "HC8"

# LimeSurvey Field type: F
data[, 151] <- as.numeric(data[, 151])
attributes(data)$variable.labels[
  151
] <- "In welke mate ziet u dezelfde zorgverlener(s) tijdens uw reguliere afspraken of onderzoeken?"
data[, 151] <- factor(
  data[, 151],
  levels = c(001, 002, 003, 004, 005, 006, 007),
  labels = c(
    "Altijd",
    "Vaak",
    "Soms",
    "Zelden",
    "Nooit",
    "Ik weet het niet",
    "007"
  )
)
names(data)[151] <- "HC9"

# LimeSurvey Field type: F
data[, 152] <- as.numeric(data[, 152])
attributes(data)$variable.labels[
  152
] <- "In welke mate ontvangt u voldoende nuttige en begrijpelijke informatie van uw zorgverleners?"
data[, 152] <- factor(
  data[, 152],
  levels = c(001, 002, 003, 004, 005, 006),
  labels = c("Altijd", "Vaak", "Soms", "Zelden", "Nooit", "Ik weet het niet")
)
names(data)[152] <- "HC10"

# LimeSurvey Field type: F
data[, 153] <- as.numeric(data[, 153])
attributes(data)$variable.labels[
  153
] <- "Bent u zo veel als u wilt (of wilde) betrokken bij de beslissingen over uw zorg of behandeling?"
data[, 153] <- factor(
  data[, 153],
  levels = c(001, 002, 003, 004, 005, 006, 007),
  labels = c(
    "Ja, zeker",
    "Ja, in zekere mate",
    "Nee, niet echt",
    "Nee, zeker niet",
    "Nee, maar ik wilde sowieso niet betrokken zijn",
    "Niet van toepassing: er zijn geen beslissingen over de behandeling genomen",
    "Ik weet het niet"
  )
)
names(data)[153] <- "HC11"

# LimeSurvey Field type: A
data[, 154] <- as.character(data[, 154])
attributes(data)$variable.labels[
  154
] <- "Hebt u in de afgelopen 12 maanden zorg voor [de ziekte] niet gekregen terwijl u die wel nodig had? Dit kan gaan om een consult, behandeling, medische testen, revalidatie, of anders."
data[, 154] <- factor(
  data[, 154],
  levels = c("A1", "A2", "A3"),
  labels = c("Ja", "Nee", "Ik weet het niet")
)
names(data)[154] <- "HC12"

# LimeSurvey Field type: F
data[, 155] <- as.numeric(data[, 155])
attributes(data)$variable.labels[
  155
] <- "[Afstand tussen woonplaats en zorglocatie] Wat was/zijn de voornaamste reden(en) waarom u de zorg die u nodig had niet hebt ontvangen?"
data[, 155] <- factor(
  data[, 155],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[155] <- "HC13_001"

# LimeSurvey Field type: F
data[, 156] <- as.numeric(data[, 156])
attributes(data)$variable.labels[
  156
] <- "[Vervoersprobleem (bijv. geen openbaar vervoer in de buurt, geen eigen vervoer, niet in staat om zelf te rijden, niemand om u naar uw zorglocatie te brengen)] Wat was/zijn de voornaamste reden(en) waarom u de zorg die u nodig had niet hebt ontvangen?"
data[, 156] <- factor(
  data[, 156],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[156] <- "HC13_002"

# LimeSurvey Field type: F
data[, 157] <- as.numeric(data[, 157])
attributes(data)$variable.labels[
  157
] <- "[Tekort aan bekwaam personeel om de nodige zorg toe te dienen] Wat was/zijn de voornaamste reden(en) waarom u de zorg die u nodig had niet hebt ontvangen?"
data[, 157] <- factor(
  data[, 157],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[157] <- "HC13_003"

# LimeSurvey Field type: F
data[, 158] <- as.numeric(data[, 158])
attributes(data)$variable.labels[
  158
] <- "[Zeer lange wachttijden] Wat was/zijn de voornaamste reden(en) waarom u de zorg die u nodig had niet hebt ontvangen?"
data[, 158] <- factor(
  data[, 158],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[158] <- "HC13_004"

# LimeSurvey Field type: F
data[, 159] <- as.numeric(data[, 159])
attributes(data)$variable.labels[
  159
] <- "[Moeilijkheden om de zorg te betalen] Wat was/zijn de voornaamste reden(en) waarom u de zorg die u nodig had niet hebt ontvangen?"
data[, 159] <- factor(
  data[, 159],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[159] <- "HC13_005"

# LimeSurvey Field type: F
data[, 160] <- as.numeric(data[, 160])
attributes(data)$variable.labels[
  160
] <- "[Angst voor medische onderzoeken, het ziekenhuis of iets anders] Wat was/zijn de voornaamste reden(en) waarom u de zorg die u nodig had niet hebt ontvangen?"
data[, 160] <- factor(
  data[, 160],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[160] <- "HC13_006"

# LimeSurvey Field type: F
data[, 161] <- as.numeric(data[, 161])
attributes(data)$variable.labels[
  161
] <- "[Tijdgebrek door werk, kinderen of anders] Wat was/zijn de voornaamste reden(en) waarom u de zorg die u nodig had niet hebt ontvangen?"
data[, 161] <- factor(
  data[, 161],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[161] <- "HC13_007"

# LimeSurvey Field type: F
data[, 162] <- as.numeric(data[, 162])
attributes(data)$variable.labels[
  162
] <- "[Gebrek aan informatie] Wat was/zijn de voornaamste reden(en) waarom u de zorg die u nodig had niet hebt ontvangen?"
data[, 162] <- factor(
  data[, 162],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[162] <- "HC13_008"

# LimeSurvey Field type: F
data[, 163] <- as.numeric(data[, 163])
attributes(data)$variable.labels[
  163
] <- "[Taalproblemen] Wat was/zijn de voornaamste reden(en) waarom u de zorg die u nodig had niet hebt ontvangen?"
data[, 163] <- factor(
  data[, 163],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[163] <- "HC13_009"

# LimeSurvey Field type: A
data[, 164] <- as.character(data[, 164])
attributes(data)$variable.labels[
  164
] <- "[Anders] Wat was/zijn de voornaamste reden(en) waarom u de zorg die u nodig had niet hebt ontvangen?"
names(data)[164] <- "HC13_other"

# LimeSurvey Field type: F
data[, 165] <- as.numeric(data[, 165])
attributes(data)$variable.labels[
  165
] <- "In welke mate zijn uw school/opleiding beïnvloed door uw ziekte, qua aanwezigheid, prestaties, slagen of studiekeuze?"
data[, 165] <- factor(
  data[, 165],
  levels = c(001, 002, 003, 004, 005, 006, 007),
  labels = c(
    "Helemaal niet",
    "Licht",
    "Matig",
    "Veel",
    "Extreem",
    "Ik weet het niet",
    "Niet van toepassing: de ziekte trad op na het einde van mijn school/opleiding"
  )
)
names(data)[165] <- "S1"

# LimeSurvey Field type: A
data[, 166] <- as.character(data[, 166])
attributes(data)$variable.labels[
  166
] <- "Heeft u vanwege [de ziekte] uw werktijd verminderd?"
data[, 166] <- factor(
  data[, 166],
  levels = c("001", "002", "003", "005"),
  labels = c(
    "Ja, ik werk minder dan vroeger door mijn ziekte",
    "Ja, ik ben gestopt met werken door mijn ziekte",
    "Nee, de ziekte heeft geen impact gehad op mijn werktijd",
    "Ik weet het niet"
  )
)
names(data)[166] <- "S2"

# LimeSurvey Field type: A
data[, 167] <- as.character(data[, 167])
attributes(data)$variable.labels[
  167
] <- "[Anders] Heeft u vanwege [de ziekte] uw werktijd verminderd?"
names(data)[167] <- "S2_other"

# LimeSurvey Field type: A
data[, 168] <- as.character(data[, 168])
attributes(data)$variable.labels[
  168
] <- "Hoe lang bent u, ongeveer, arbeidsongeschikt geweest vanwege uw ziekte? Geef een ruwe schatting van het TOTAAL van alle ziekte- of verlofperiodes, al dan niet aaneensluitend. Voorbeeld: 1 maand + later 2 maanden = ‘van 3 tot 6 maanden’."
data[, 168] <- factor(
  data[, 168],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05"),
  labels = c(
    "Minder dan 1 maand",
    "1 tot 3 maanden",
    "4 maanden tot 1 jaar",
    "Langer dan 1 jaar",
    "Ik weet het niet"
  )
)
names(data)[168] <- "S3"

# LimeSurvey Field type: F
data[, 169] <- as.numeric(data[, 169])
attributes(data)$variable.labels[169] <- "Geef ongeveer het aantal jaren op:"
names(data)[169] <- "S3b"

# LimeSurvey Field type: A
data[, 170] <- as.character(data[, 170])
attributes(data)$variable.labels[
  170
] <- "De volgende vraag gaat over de afgelopen zeven dagen, exclusief vandaag."
names(data)[170] <- "TEXTS4"

# LimeSurvey Field type: F
data[, 171] <- as.numeric(data[, 171])
attributes(data)$variable.labels[
  171
] <- "[| [De ziekte] heeft geen enkel effect gehad op mijn werk | Door [mijn ziekte] heb ik helemaal niet kunnen werken] In welke mate heeft [de ziekte] in de afgelopen zeven dagen uw productiviteit beïnvloed tijdens het werk? Denk aan dagen waarop u beperkt was in hoeveelheid of soort werk, dagen waarop u minder heeft gedaan dan u wilde, of dagen waarop u uw werk niet zo zorgvuldig kon doen als gewoonlijk. Kies een laag cijfer als [de ziekte] weinig invloed had, een hoog cijfer als de invloed groot was."
names(data)[171] <- "S4_SQ001"

# LimeSurvey Field type: F
data[, 172] <- as.numeric(data[, 172])
attributes(data)$variable.labels[
  172
] <- "In welke mate hebben uw [ziekte] of medische behandeling u financiële moeilijkheden bezorgd?"
data[, 172] <- factor(
  data[, 172],
  levels = c(001, 002, 003, 004, 005, 006),
  labels = c(
    "Helemaal niet",
    "Licht",
    "Matig",
    "Veel",
    "Extreem",
    "Ik weet het niet"
  )
)
names(data)[172] <- "S5"

# LimeSurvey Field type: A
data[, 173] <- as.character(data[, 173])
attributes(data)$variable.labels[
  173
] <- "In welke mate belemmert uw ziekte uw relaties met familie, partner, vrienden of buren?"
data[, 173] <- factor(
  data[, 173],
  levels = c("A001", "A002", "A003", "A004", "A005", "A006"),
  labels = c(
    "Helemaal niet",
    "Licht",
    "Matig",
    "Veel",
    "Extreem",
    "Ik weet het niet"
  )
)
names(data)[173] <- "S6"

# LimeSurvey Field type: F
data[, 174] <- as.numeric(data[, 174])
attributes(data)$variable.labels[
  174
] <- "[Geen extra ondersteuning] Van welke vormen van extra ondersteuning had u, door [de ziekte], behoefte maar hebt u tot nu toe niet kunnen krijgen?"
data[, 174] <- factor(
  data[, 174],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[174] <- "S7_SQ001"

# LimeSurvey Field type: F
data[, 175] <- as.numeric(data[, 175])
attributes(data)$variable.labels[
  175
] <- "[Logistieke hulp (bijv. schoonmaken, koken, boodschappen, vervoer, kinderopvang)] Van welke vormen van extra ondersteuning had u, door [de ziekte], behoefte maar hebt u tot nu toe niet kunnen krijgen?"
data[, 175] <- factor(
  data[, 175],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[175] <- "S7_SQ002"

# LimeSurvey Field type: F
data[, 176] <- as.numeric(data[, 176])
attributes(data)$variable.labels[
  176
] <- "[Praten met andere patiënten met [de ziekte]] Van welke vormen van extra ondersteuning had u, door [de ziekte], behoefte maar hebt u tot nu toe niet kunnen krijgen?"
data[, 176] <- factor(
  data[, 176],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[176] <- "S7_SQ003"

# LimeSurvey Field type: F
data[, 177] <- as.numeric(data[, 177])
attributes(data)$variable.labels[
  177
] <- "[Psychologische ondersteuning] Van welke vormen van extra ondersteuning had u, door [de ziekte], behoefte maar hebt u tot nu toe niet kunnen krijgen?"
data[, 177] <- factor(
  data[, 177],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[177] <- "S7_SQ004"

# LimeSurvey Field type: F
data[, 178] <- as.numeric(data[, 178])
attributes(data)$variable.labels[
  178
] <- "[Medische ondersteuning] Van welke vormen van extra ondersteuning had u, door [de ziekte], behoefte maar hebt u tot nu toe niet kunnen krijgen?"
data[, 178] <- factor(
  data[, 178],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[178] <- "S7_SQ005"

# LimeSurvey Field type: F
data[, 179] <- as.numeric(data[, 179])
attributes(data)$variable.labels[
  179
] <- "[Administratieve of sociale hulp] Van welke vormen van extra ondersteuning had u, door [de ziekte], behoefte maar hebt u tot nu toe niet kunnen krijgen?"
data[, 179] <- factor(
  data[, 179],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[179] <- "S7_SQ006"

# LimeSurvey Field type: F
data[, 180] <- as.numeric(data[, 180])
attributes(data)$variable.labels[
  180
] <- "[Ondersteuning voor omgevingsaanpassing of aangepast materiaal] Van welke vormen van extra ondersteuning had u, door [de ziekte], behoefte maar hebt u tot nu toe niet kunnen krijgen?"
data[, 180] <- factor(
  data[, 180],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[180] <- "S7_SQ007"

# LimeSurvey Field type: F
data[, 181] <- as.numeric(data[, 181])
attributes(data)$variable.labels[
  181
] <- "[Ondersteuning bij terugkeer naar werk] Van welke vormen van extra ondersteuning had u, door [de ziekte], behoefte maar hebt u tot nu toe niet kunnen krijgen?"
data[, 181] <- factor(
  data[, 181],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[181] <- "S7_SQ008"

# LimeSurvey Field type: F
data[, 182] <- as.numeric(data[, 182])
attributes(data)$variable.labels[
  182
] <- "[Schoolse of studie-ondersteuning] Door [de ziekte], van welke vormen van extra ondersteuning had u behoefte maar is het nog niet gelukt die te krijgen?"
data[, 182] <- factor(
  data[, 182],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[182] <- "S7_SQ009"

# LimeSurvey Field type: F
data[, 183] <- as.numeric(data[, 183])
attributes(data)$variable.labels[
  183
] <- "[Spirituele of religieuze begeleiding] Door [de ziekte], van welke vormen van extra ondersteuning had u behoefte maar is het nog niet gelukt die te krijgen?"
data[, 183] <- factor(
  data[, 183],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[183] <- "S7_SQ010"

# LimeSurvey Field type: F
data[, 184] <- as.numeric(data[, 184])
attributes(data)$variable.labels[
  184
] <- "[Ik weet het niet] Door [de ziekte], van welke vormen van extra ondersteuning had u behoefte maar is het nog niet gelukt die te krijgen?"
data[, 184] <- factor(
  data[, 184],
  levels = c(1, 0),
  labels = c("Ja", "Niet geselecteerd")
)
names(data)[184] <- "S7_SQ012"

# LimeSurvey Field type: A
data[, 185] <- as.character(data[, 185])
attributes(data)$variable.labels[
  185
] <- "[Anders] Door [de ziekte], van welke vormen van extra ondersteuning had u behoefte maar is het nog niet gelukt die te krijgen?"
names(data)[185] <- "S7_other"

# LimeSurvey Field type: A
data[, 186] <- as.character(data[, 186])
attributes(data)$variable.labels[
  186
] <- "[Impact op de algemene levenskwaliteit (impact op mobiliteit, zelfstandigheid, het vermogen om uzelf te wassen en aan te kleden, ongemak of pijn, angst of depressie)] Naar uw mening: welke aspecten van uw ziekte of van de zorg daarvoor moeten met voorrang worden verbeterd? Beoordeel elk aspect volgens het belang dat u eraan hecht."
data[, 186] <- factor(
  data[, 186],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Helemaal niet prioritair",
    "Licht prioritair",
    "Matig prioritair",
    "Zeer prioritair",
    "Extreem prioritair",
    "Ik weet het niet"
  )
)
names(data)[186] <- "P1_001"

# LimeSurvey Field type: A
data[, 187] <- as.character(data[, 187])
attributes(data)$variable.labels[
  187
] <- "[Impact op uw lichamelijke gezondheid (fysieke symptomen, ongemak of pijn door de ziekte)] Naar uw mening: welke aspecten van uw ziekte of van de zorg daarvoor moeten met voorrang worden verbeterd? Beoordeel elk aspect volgens het belang dat u eraan hecht."
data[, 187] <- factor(
  data[, 187],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Helemaal niet prioritair",
    "Licht prioritair",
    "Matig prioritair",
    "Zeer prioritair",
    "Extreem prioritair",
    "Ik weet het niet"
  )
)
names(data)[187] <- "P1_002"

# LimeSurvey Field type: A
data[, 188] <- as.character(data[, 188])
attributes(data)$variable.labels[
  188
] <- "[Impact op uw psychische gezondheid (psychische symptomen, angst of depressie door de ziekte)] Naar uw mening: welke aspecten van uw ziekte of van de zorg daarvoor moeten met voorrang worden verbeterd? Beoordeel elk aspect volgens het belang dat u eraan hecht."
data[, 188] <- factor(
  data[, 188],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Helemaal niet prioritair",
    "Licht prioritair",
    "Matig prioritair",
    "Zeer prioritair",
    "Extreem prioritair",
    "Ik weet het niet"
  )
)
names(data)[188] <- "P1_003"

# LimeSurvey Field type: A
data[, 189] <- as.character(data[, 189])
attributes(data)$variable.labels[
  189
] <- "[Impact op uw zelfstandigheid (impact op uw mobiliteit, uw vermogen om uzelf te wassen en aan te kleden)] Naar uw mening: welke aspecten van uw ziekte of van de zorg daarvoor moeten met voorrang worden verbeterd? Beoordeel elk aspect volgens het belang dat u eraan hecht."
data[, 189] <- factor(
  data[, 189],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Helemaal niet prioritair",
    "Licht prioritair",
    "Matig prioritair",
    "Zeer prioritair",
    "Extreem prioritair",
    "Ik weet het niet"
  )
)
names(data)[189] <- "P1_004"

# LimeSurvey Field type: A
data[, 190] <- as.character(data[, 190])
attributes(data)$variable.labels[
  190
] <- "[Impact op uw seksueel en reproductief leven] Naar uw mening: welke aspecten van uw ziekte of van de zorg daarvoor moeten met voorrang worden verbeterd? Beoordeel elk aspect volgens het belang dat u eraan hecht."
data[, 190] <- factor(
  data[, 190],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Helemaal niet prioritair",
    "Licht prioritair",
    "Matig prioritair",
    "Zeer prioritair",
    "Extreem prioritair",
    "Ik weet het niet"
  )
)
names(data)[190] <- "P1_005"

# LimeSurvey Field type: A
data[, 191] <- as.character(data[, 191])
attributes(data)$variable.labels[
  191
] <- "[Impact op de levensverwachting] Naar uw mening: welke aspecten van uw ziekte of van de zorg daarvoor moeten met voorrang worden verbeterd? Beoordeel elk aspect volgens het belang dat u eraan hecht."
data[, 191] <- factor(
  data[, 191],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Helemaal niet prioritair",
    "Licht prioritair",
    "Matig prioritair",
    "Zeer prioritair",
    "Extreem prioritair",
    "Ik weet het niet"
  )
)
names(data)[191] <- "P1_006"

# LimeSurvey Field type: A
data[, 192] <- as.character(data[, 192])
attributes(data)$variable.labels[
  192
] <- "[Impact op uw school/opleiding] Naar uw mening: welke aspecten van uw ziekte of van de zorg daarvoor moeten met voorrang worden verbeterd? Beoordeel elk aspect volgens het belang dat u eraan hecht."
data[, 192] <- factor(
  data[, 192],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Helemaal niet prioritair",
    "Licht prioritair",
    "Matig prioritair",
    "Zeer prioritair",
    "Extreem prioritair",
    "Ik weet het niet"
  )
)
names(data)[192] <- "P1_007"

# LimeSurvey Field type: A
data[, 193] <- as.character(data[, 193])
attributes(data)$variable.labels[
  193
] <- "[Impact op uw werk] Naar uw mening: welke aspecten van uw ziekte of van de zorg daarvoor moeten met voorrang worden verbeterd? Beoordeel elk aspect volgens het belang dat u eraan hecht."
data[, 193] <- factor(
  data[, 193],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Helemaal niet prioritair",
    "Licht prioritair",
    "Matig prioritair",
    "Zeer prioritair",
    "Extreem prioritair",
    "Ik weet het niet"
  )
)
names(data)[193] <- "P1_008"

# LimeSurvey Field type: A
data[, 194] <- as.character(data[, 194])
attributes(data)$variable.labels[
  194
] <- "[Financiële impact] Naar uw mening: welke aspecten van uw ziekte of van de zorg daarvoor moeten met voorrang worden verbeterd? Beoordeel elk aspect volgens het belang dat u eraan hecht."
data[, 194] <- factor(
  data[, 194],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Helemaal niet prioritair",
    "Licht prioritair",
    "Matig prioritair",
    "Zeer prioritair",
    "Extreem prioritair",
    "Ik weet het niet"
  )
)
names(data)[194] <- "P1_009"

# LimeSurvey Field type: A
data[, 195] <- as.character(data[, 195])
attributes(data)$variable.labels[
  195
] <- "[Impact van de ziekte op uw sociale leven (relaties met familie, partner of vrienden)] Naar uw mening: welke aspecten van uw ziekte of van de zorg daarvoor moeten met voorrang worden verbeterd? Beoordeel elk aspect volgens het belang dat u eraan hecht."
data[, 195] <- factor(
  data[, 195],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Helemaal niet prioritair",
    "Licht prioritair",
    "Matig prioritair",
    "Zeer prioritair",
    "Extreem prioritair",
    "Ik weet het niet"
  )
)
names(data)[195] <- "P1_010"

# LimeSurvey Field type: A
data[, 196] <- as.character(data[, 196])
attributes(data)$variable.labels[
  196
] <- "[Kwaliteit van uw zorg (snelheid van diagnose, screeningsprogramma’s, coördinatie en continuïteit van zorg, informatie van zorgverleners, betrokkenheid bij beslissingen over uw zorg of behandeling)] Naar uw mening: welke aspecten van uw ziekte of van de zorg daarvoor moeten met voorrang worden verbeterd? Beoordeel elk aspect volgens het belang dat u eraan hecht."
data[, 196] <- factor(
  data[, 196],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Helemaal niet prioritair",
    "Licht prioritair",
    "Matig prioritair",
    "Zeer prioritair",
    "Extreem prioritair",
    "Ik weet het niet"
  )
)
names(data)[196] <- "P1_011"

# LimeSurvey Field type: A
data[, 197] <- as.character(data[, 197])
attributes(data)$variable.labels[
  197
] <- "[Toegang tot gezondheidszorg (zorg krijgen wanneer u die nodig hebt, beschikbaarheid van behandeling)] Naar uw mening: welke aspecten van uw ziekte of van de zorg daarvoor moeten met voorrang worden verbeterd? Beoordeel elk aspect volgens het belang dat u eraan hecht."
data[, 197] <- factor(
  data[, 197],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Helemaal niet prioritair",
    "Licht prioritair",
    "Matig prioritair",
    "Zeer prioritair",
    "Extreem prioritair",
    "Ik weet het niet"
  )
)
names(data)[197] <- "P1_012"

# LimeSurvey Field type: A
data[, 198] <- as.character(data[, 198])
attributes(data)$variable.labels[
  198
] <- "[Wetenschappelijke kennis (bijv. op vlak van diagnose, behandeling of prognose)] Naar uw mening: welke aspecten van uw ziekte of van de zorg daarvoor moeten met voorrang worden verbeterd? Beoordeel elk aspect volgens het belang dat u eraan hecht."
data[, 198] <- factor(
  data[, 198],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Helemaal niet prioritair",
    "Licht prioritair",
    "Matig prioritair",
    "Zeer prioritair",
    "Extreem prioritair",
    "Ik weet het niet"
  )
)
names(data)[198] <- "P1_013"

# LimeSurvey Field type: A
data[, 199] <- as.character(data[, 199])
attributes(data)$variable.labels[
  199
] <- "[Doeltreffendheid van de behandeling (vermogen van de behandeling om de ziekte te genezen, symptomen of levenskwaliteit te verbeteren)] Naar uw mening: welke aspecten van uw ziekte of van de zorg daarvoor moeten met voorrang worden verbeterd? Beoordeel elk aspect volgens het belang dat u eraan hecht."
data[, 199] <- factor(
  data[, 199],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Helemaal niet prioritair",
    "Licht prioritair",
    "Matig prioritair",
    "Zeer prioritair",
    "Extreem prioritair",
    "Ik weet het niet"
  )
)
names(data)[199] <- "P1_014"

# LimeSurvey Field type: A
data[, 200] <- as.character(data[, 200])
attributes(data)$variable.labels[
  200
] <- "[Belastendheid van de behandeling (in termen van bijwerkingen of in termen van logistiek/toediening van de behandeling)] Naar uw mening: welke aspecten van uw ziekte of van de zorg daarvoor moeten met voorrang worden verbeterd? Beoordeel elk aspect volgens het belang dat u eraan hecht."
data[, 200] <- factor(
  data[, 200],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Helemaal niet prioritair",
    "Licht prioritair",
    "Matig prioritair",
    "Zeer prioritair",
    "Extreem prioritair",
    "Ik weet het niet"
  )
)
names(data)[200] <- "P1_015"

# LimeSurvey Field type: F
data[, 201] <- as.numeric(data[, 201])
attributes(data)$variable.labels[
  201
] <- "Wilt u nog één of meer andere belangrijke behoeften in verband met [de ziekte] met ons delen die u in de vragenlijst niet kon aangeven?"
data[, 201] <- factor(data[, 201], levels = c(1, 2), labels = c("Ja", "Nee"))
names(data)[201] <- "G1"

# LimeSurvey Field type: A
data[, 202] <- as.character(data[, 202])
attributes(data)$variable.labels[
  202
] <- "Welke behoeften zijn niet aan bod gekomen in de vragenlijst?"
names(data)[202] <- "G2"

# LimeSurvey Field type: F
data[, 203] <- as.numeric(data[, 203])
attributes(data)$variable.labels[
  203
] <- "Als persoon die de vragenlijst invult voor iemand met [de ziekte]: beschouwt u zichzelf als mantelzorger? Dat wil zeggen: u helpt deze persoon regelmatig en onbezoldigd wegens zijn/haar ziekte. Bijvoorbeeld: een ouder die zijn/haar kind helpt, een familielid of vriend die een naaste helpt."
data[, 203] <- factor(data[, 203], levels = c(1, 2), labels = c("Ja", "Nee"))
names(data)[203] <- "CG1"

# LimeSurvey Field type: F
data[, 204] <- as.numeric(data[, 204])
attributes(data)$variable.labels[
  204
] <- "In relatie tot de persoon die u helpt, bent u: [duid het passende antwoord aan]"
data[, 204] <- factor(
  data[, 204],
  levels = c(001, 002, 003),
  labels = c(
    "Een familielid (bijv. ouder, kind, grootouder…)",
    "Een naaste (bijv. vriend, buur…)",
    "Anders: gelieve te preciseren."
  )
)
names(data)[204] <- "CG2"

# LimeSurvey Field type: A
data[, 205] <- as.character(data[, 205])
attributes(data)$variable.labels[
  205
] <- "[Opmerking] In relatie tot de persoon die u helpt, bent u: [duid het passende antwoord aan]"
names(data)[205] <- "CG2_comment"

# LimeSurvey Field type: F
data[, 206] <- as.numeric(data[, 206])
attributes(data)$variable.labels[206] <- "Met welk gender identificeert u zich?"
data[, 206] <- factor(
  data[, 206],
  levels = c(001, 002, 003),
  labels = c("Man", "Vrouw", "Anders")
)
names(data)[206] <- "CG3"

# LimeSurvey Field type: F
data[, 207] <- as.numeric(data[, 207])
attributes(data)$variable.labels[207] <- "Wat is uw geboortejaar?"
names(data)[207] <- "CG4"

# LimeSurvey Field type: F
data[, 208] <- as.numeric(data[, 208])
attributes(data)$variable.labels[
  208
] <- "Hoeveel tijd hebt u afgelopen week besteed aan het helpen van de persoon bij activiteiten die hij/zij normaal zelf zou hebben gedaan als hij/zij gezond was? Bijvoorbeeld persoonlijke zorg (zoals aan- en uitkleden, naar het toilet…), huishoudelijke taken (zoals maaltijden bereiden, schoonmaken…) of praktische ondersteuning (zoals begeleiden naar afspraken binnen of buiten, medische of andere afspraken…)."
names(data)[208] <- "CG5"

# LimeSurvey Field type: A
data[, 209] <- as.character(data[, 209])
attributes(data)$variable.labels[
  209
] <- "In welke mate wordt uw lichamelijke en/of psychische gezondheid beïnvloed door uw rol als mantelzorger, naar uw eigen inschatting?"
data[, 209] <- factor(
  data[, 209],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Helemaal niet",
    "Licht",
    "Matig",
    "Veel",
    "Extreem",
    "Ik weet het niet"
  )
)
names(data)[209] <- "CG6"

# LimeSurvey Field type: A
data[, 210] <- as.character(data[, 210])
attributes(data)$variable.labels[
  210
] <- "In welke mate wordt uw sociale leven beïnvloed door uw rol als mantelzorger, naar uw eigen inschatting?"
data[, 210] <- factor(
  data[, 210],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Helemaal niet",
    "Licht",
    "Matig",
    "Veel",
    "Extreem",
    "Ik weet het niet"
  )
)
names(data)[210] <- "CG7"

# LimeSurvey Field type: F
data[, 211] <- as.numeric(data[, 211])
attributes(data)$variable.labels[
  211
] <- "We willen graag meer te weten komen over de behoeften en moeilijkheden die u ervaart of hebt ervaren in de context van uw [ziekte]. Indien u dat wenst, kunt u deelnemen aan een individueel gesprek (online of face-to-face met een onderzoeker) om uw ervaringen en behoeften in meer detail te bespreken. Dit gesprek verloopt vertrouwelijk en heeft geen impact op de zorg die u van professionals ontvangt. Er is voorzien dat [X] patiënten worden bevraagd. Het gesprek duurt ongeveer anderhalf uur. Wilt u deelnemen aan een individueel gesprek?"
data[, 211] <- factor(data[, 211], levels = c(1, 2), labels = c("Ja", "Nee"))
names(data)[211] <- "Follow"

# LimeSurvey Field type: A
data[, 212] <- as.character(data[, 212])
attributes(data)$variable.labels[
  212
] <- "[Naam] Gelieve uw contactgegevens mee te delen zodat we u kunnen contacteren."
names(data)[212] <- "NOM_NAME"

# LimeSurvey Field type: A
data[, 213] <- as.character(data[, 213])
attributes(data)$variable.labels[
  213
] <- "[Voornaam] Gelieve uw contactgegevens mee te delen zodat we u kunnen contacteren."
names(data)[213] <- "NOM_FNAME"

# LimeSurvey Field type: A
data[, 214] <- as.character(data[, 214])
attributes(data)$variable.labels[
  214
] <- "[E-mailadres] Gelieve uw contactgegevens mee te delen zodat we u kunnen contacteren."
names(data)[214] <- "NOM_Email"

# LimeSurvey Field type: A
data[, 215] <- as.character(data[, 215])
attributes(data)$variable.labels[
  215
] <- "[Bevestiging van het e-mailadres] Gelieve uw contactgegevens mee te delen zodat we u kunnen contacteren."
names(data)[215] <- "NOM_Cemail"

# LimeSurvey Field type: A
data[, 216] <- as.character(data[, 216])
attributes(data)$variable.labels[
  216
] <- "[GSM-nummer] Gelieve uw contactgegevens mee te delen zodat we u kunnen contacteren."
names(data)[216] <- "NOM_GSM"

# LimeSurvey Field type: A
data[, 217] <- as.character(data[, 217])
attributes(data)$variable.labels[
  217
] <- "[Ander telefoonnummer] Gelieve uw contactgegevens mee te delen zodat we u kunnen contacteren."
names(data)[217] <- "NOM_NAME1"

# LimeSurvey Field type: A
data[, 218] <- as.character(data[, 218])
attributes(data)$variable.labels[
  218
] <- "Hartelijk dank voor uw medewerking! Een lid van het onderzoeksteam zal u binnen enkele weken opnieuw contacteren om u te informeren over uw eventuele deelname aan een gesprek."
names(data)[218] <- "TXS"
