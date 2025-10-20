#' Name         : data_en.R
#' Author       : Alexandre Bohyn
#' Date         : 2025-10-08
#' Purpose      : Load the NEED data using code answers and code variables using English
#'                labels.
#' Files created: - `data/processed/data_en.rds`
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

# Remove the fields containing sensitive information
data <- data[, 1:247]


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
attributes(data)$variable.labels[8] <- "You are completing this questionnaire"
data[, 8] <- factor(
  data[, 8],
  levels = c(1, 2),
  labels = c(
    "For yourself",
    "For another person for whom you are the legal representative. (The person you represent is not able to answer themselves)"
  )
)
names(data)[8] <- "D1"
# LimeSurvey Field type: A
data[, 9] <- as.character(data[, 9])
attributes(data)$variable.labels[
  9
] <- "From now on, please answer all questions as if you were the person with the psychotic disorder. Indicate \"I don't know\" if you do not know how the person would respond."
names(data)[9] <- "D1b"
# LimeSurvey Field type: A
data[, 10] <- as.character(data[, 10])
attributes(data)$variable.labels[10] <- "Which gender do you identify with?"
data[, 10] <- factor(
  data[, 10],
  levels = c("A1", "A2", "A3"),
  labels = c("Man", "Woman", "Other")
)
names(data)[10] <- "D2"
# LimeSurvey Field type: F
data[, 11] <- as.numeric(data[, 11])
attributes(data)$variable.labels[11] <- "What is your year of birth?"
names(data)[11] <- "D3"
# LimeSurvey Field type: A
data[, 12] <- as.character(data[, 12])
attributes(data)$variable.labels[
  12
] <- "Thank you for your participation. Unfortunately, you do not meet the conditions to continue this study."
names(data)[12] <- "END0"
# LimeSurvey Field type: A
data[, 13] <- as.character(data[, 13])
attributes(data)$variable.labels[13] <- "In which province do you live?"
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
    "Antwerp",
    "Walloon Brabant",
    "Brussels",
    "Hainaut",
    "Liège",
    "Limburg",
    "Luxembourg",
    "Namur",
    "East Flanders",
    "Flemish Brabant",
    "West Flanders",
    "I do not live in Belgium",
    "I don't know"
  )
)
names(data)[13] <- "D4"
# LimeSurvey Field type: A
data[, 14] <- as.character(data[, 14])
attributes(data)$variable.labels[
  14
] <- "Thank you for your participation. Unfortunately, you do not meet the conditions to continue this study."
names(data)[14] <- "END1"
# LimeSurvey Field type: A
data[, 15] <- as.character(data[, 15])
attributes(data)$variable.labels[
  15
] <- "What is the highest diploma or level of education you have obtained so far?"
data[, 15] <- factor(
  data[, 15],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "No diploma or primary education",
    "Lower secondary education",
    "Upper secondary education",
    "Short-cycle higher education (e.g., Bachelor)",
    "Long-cycle higher education (e.g., Master)",
    "Doctorate",
    "I don't know"
  )
)
names(data)[15] <- "D5"
# LimeSurvey Field type: A
data[, 16] <- as.character(data[, 16])
attributes(data)$variable.labels[
  16
] <- "[Other] What is the highest diploma or level of education you have obtained so far?"
names(data)[16] <- "D5_other"
# LimeSurvey Field type: A
data[, 17] <- as.character(data[, 17])
attributes(data)$variable.labels[17] <- "You live …"
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
    "Alone",
    "Alone with child(ren)",
    "With a partner (no children)",
    "With a partner (with children)",
    "With one or both parents",
    "In shared housing / flat share",
    "In a psychiatric nursing home",
    "In protected housing",
    "In supervised housing",
    "In hospital (temporarily)",
    "In a nursing home",
    "I don't know"
  )
)
names(data)[17] <- "D6"
# LimeSurvey Field type: A
data[, 18] <- as.character(data[, 18])
attributes(data)$variable.labels[18] <- "[Other] You live …"
names(data)[18] <- "D6_other"
# LimeSurvey Field type: A
data[, 19] <- as.character(data[, 19])
attributes(data)$variable.labels[19] <- "What is your country of birth?"
data[, 19] <- factor(
  data[, 19],
  levels = c("A1", "A2", "A3"),
  labels = c("Belgium", "Another country", "I don't know")
)
names(data)[19] <- "D7"
# LimeSurvey Field type: A
data[, 20] <- as.character(data[, 20])
attributes(data)$variable.labels[20] <- "Select the relevant country"
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
    "South Africa",
    "Albania",
    "Algeria",
    "Germany",
    "Andorra",
    "Angola",
    "Anguilla",
    "Antarctica",
    "Antigua and Barbuda",
    "Saudi Arabia",
    "Argentina",
    "Armenia",
    "Aruba",
    "Australia",
    "Austria",
    "Azerbaijan",
    "The Bahamas",
    "Bahrain",
    "Bangladesh",
    "Barbados",
    "Belize",
    "Benin",
    "Bermuda",
    "Bhutan",
    "Belarus",
    "Bolivia",
    "Bonaire",
    "Bosnia and Herzegovina",
    "Botswana",
    "Brazil",
    "Brunei",
    "Bulgaria",
    "Burkina Faso",
    "Burundi",
    "Cambodia",
    "Cameroon",
    "Canada",
    "Cabo Verde",
    "Chile",
    "China",
    "Cyprus",
    "Colombia",
    "Comoros",
    "Congo (Brazzaville)",
    "Congo (Democratic Republic)",
    "North Korea",
    "South Korea (Republic of Korea)",
    "Costa Rica",
    "Côte d’Ivoire",
    "Croatia",
    "Cuba",
    "Curaçao",
    "Denmark and the Faroe Islands",
    "Djibouti",
    "Dominica",
    "Egypt",
    "El Salvador",
    "United Arab Emirates",
    "Ecuador",
    "Eritrea",
    "Spain and the Canary Islands",
    "Estonia",
    "Eswatini (Swaziland)",
    "United States of America",
    "Ethiopia",
    "Fiji",
    "Finland",
    "France",
    "Gabon",
    "Gambia",
    "Georgia",
    "Ghana",
    "Gibraltar",
    "Greece",
    "Grenada",
    "Greenland",
    "Guadeloupe",
    "Guam",
    "Guatemala",
    "Guinea-Bissau",
    "Guinea (Conakry)",
    "Equatorial Guinea",
    "Guyana",
    "French Guiana",
    "Haiti",
    "Honduras",
    "Hong Kong",
    "Hungary",
    "Christmas Island",
    "Cayman Islands",
    "Cook Islands",
    "Falkland Islands",
    "Marshall Islands",
    "Solomon Islands",
    "U.S. Virgin Islands",
    "British Virgin Islands",
    "India",
    "Indonesia",
    "Iraq",
    "Iran",
    "Ireland",
    "Iceland",
    "Israel",
    "Italy",
    "Jamaica",
    "Japan",
    "Jordan",
    "Kazakhstan",
    "Kenya",
    "Kyrgyzstan",
    "Kiribati",
    "Kosovo",
    "Kuwait",
    "Laos",
    "Lesotho",
    "Latvia",
    "Lebanon",
    "Liberia",
    "Libya",
    "Liechtenstein",
    "Lithuania",
    "Luxembourg",
    "Macao (China)",
    "North Macedonia",
    "Madagascar",
    "Malaysia",
    "Malawi",
    "Maldives",
    "Mali",
    "Malta",
    "Northern Mariana Islands (U.S.)",
    "Morocco",
    "Martinique",
    "Mauritius",
    "Mauritania",
    "Mayotte",
    "Mexico",
    "Micronesia",
    "Moldova",
    "Monaco",
    "Mongolia",
    "Montenegro",
    "Montserrat",
    "Mozambique",
    "Myanmar",
    "Namibia",
    "Nauru",
    "Nepal",
    "Nicaragua",
    "Niger",
    "Nigeria",
    "Niue",
    "Norway",
    "New Caledonia",
    "New Zealand",
    "Oman",
    "Uganda",
    "Uzbekistan",
    "Pakistan",
    "Palau",
    "Palestine",
    "Panama",
    "Papua New Guinea",
    "Paraguay",
    "Netherlands",
    "Peru",
    "Philippines",
    "Pitcairn",
    "Poland",
    "French Polynesia",
    "Puerto Rico",
    "Portugal, Azores, Madeira",
    "Qatar",
    "Central African Republic",
    "Dominican Republic",
    "Czech Republic",
    "Réunion",
    "Romania",
    "United Kingdom",
    "Russia",
    "Rwanda",
    "Western Sahara",
    "Saint Barthélemy",
    "Saint Kitts and Nevis",
    "Sint Eustatius and Saba",
    "San Marino",
    "Saint Martin (France)",
    "Sint Maarten (Netherlands)",
    "Saint Pierre and Miquelon",
    "Saint Vincent and the Grenadines",
    "Saint Helena – Tristan da Cunha – Ascension",
    "Saint Lucia",
    "Samoa",
    "American Samoa",
    "São Tomé and Príncipe",
    "Senegal",
    "Serbia",
    "Seychelles",
    "Sierra Leone",
    "Singapore",
    "Slovakia",
    "Slovenia",
    "Somalia",
    "Sudan",
    "South Sudan",
    "Sri Lanka",
    "Sweden",
    "Switzerland",
    "Suriname",
    "Syria",
    "Tajikistan",
    "Taiwan",
    "Tanzania",
    "Chad",
    "Thailand",
    "Timor-Leste",
    "Togo",
    "Tokelau (New Zealand)",
    "Tonga",
    "Trinidad and Tobago",
    "Tunisia",
    "Turkmenistan",
    "Turks and Caicos Islands",
    "Türkiye",
    "Tuvalu",
    "Ukraine",
    "Uruguay",
    "Vanuatu",
    "Venezuela",
    "Vietnam",
    "Wallis and Futuna",
    "Yemen",
    "Zambia",
    "Zimbabwe",
    "I don't know"
  )
)
names(data)[20] <- "D8"
# LimeSurvey Field type: A
data[, 21] <- as.character(data[, 21])
attributes(data)$variable.labels[21] <- "[Other] Select the relevant country"
names(data)[21] <- "D8_other"
# LimeSurvey Field type: A
data[, 22] <- as.character(data[, 22])
attributes(data)$variable.labels[
  22
] <- "What was your main employment status just before the onset of your psychotic disorder?"
data[, 22] <- factor(
  data[, 22],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Paid employment (employee or self-employed)",
    "Job seeker, unemployed, social assistance",
    "Homemaker, no income",
    "Student",
    "Retired",
    "Disability",
    "I don't know"
  )
)
names(data)[22] <- "D9"
# LimeSurvey Field type: A
data[, 23] <- as.character(data[, 23])
attributes(data)$variable.labels[
  23
] <- "[Other] What was your main employment status just before the onset of your psychotic disorder?"
names(data)[23] <- "D9_other"
# LimeSurvey Field type: A
data[, 24] <- as.character(data[, 24])
attributes(data)$variable.labels[
  24
] <- "Since the onset of your first psychotic symptoms, have you had paid employment?"
data[, 24] <- factor(
  data[, 24],
  levels = c("A1", "A2", "A3"),
  labels = c("Yes", "No", "I don't know")
)
names(data)[24] <- "D10"
# LimeSurvey Field type: A
data[, 25] <- as.character(data[, 25])
attributes(data)$variable.labels[
  25
] <- "What is your current main employment status?"
data[, 25] <- factor(
  data[, 25],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Paid employment (employee or self-employed)",
    "Job seeker, unemployed, social assistance",
    "Homemaker, no income",
    "Student",
    "Retired",
    "Disability",
    "I don't know"
  )
)
names(data)[25] <- "D11"
# LimeSurvey Field type: A
data[, 26] <- as.character(data[, 26])
attributes(data)$variable.labels[
  26
] <- "[Other] What is your current main employment status?"
names(data)[26] <- "D11_other"
# LimeSurvey Field type: A
data[, 27] <- as.character(data[, 27])
attributes(data)$variable.labels[
  27
] <- "Considering all income in your household, how easy or difficult is it to make ends meet at the end of each month?"
data[, 27] <- factor(
  data[, 27],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6", "A7"),
  labels = c(
    "Very easily",
    "Easily",
    "Fairly easily",
    "With some difficulty",
    "With difficulty",
    "With great difficulty",
    "I don't know"
  )
)
names(data)[27] <- "D12"
# LimeSurvey Field type: A
data[, 28] <- as.character(data[, 28])
attributes(data)$variable.labels[
  28
] <- "Approximately how long ago were you diagnosed with a psychotic disorder?"
data[, 28] <- factor(
  data[, 28],
  levels = c("A1", "A3", "A4", "A5", "A6", "A8"),
  labels = c(
    "Less than 6 months",
    "6 months to 2 years",
    "2 to 5 years",
    "5 to 10 years",
    "More than 10 years",
    "I don't know"
  )
)
names(data)[28] <- "D13"
# LimeSurvey Field type: F
data[, 29] <- as.numeric(data[, 29])
attributes(data)$variable.labels[
  29
] <- "Please indicate the approximate number of years:"
names(data)[29] <- "D13b"
# LimeSurvey Field type: A
data[, 30] <- as.character(data[, 30])
attributes(data)$variable.labels[
  30
] <- "How much time passed between your first psychotic symptoms and your first contact with a psychiatrist?"
data[, 30] <- factor(
  data[, 30],
  levels = c("A1", "A2", "A3", "A4", "A6", "A5"),
  labels = c(
    "Less than 1 month",
    "Between 1 month and 6 months",
    "Between 6 months and 1 year",
    "Between 1 year and 2 years",
    "More than 2 years",
    "I don't know"
  )
)
names(data)[30] <- "DSHC1"
# LimeSurvey Field type: A
data[, 31] <- as.character(data[, 31])
attributes(data)$variable.labels[
  31
] <- "How much time passed between your first medical appointment for the psychotic disorder and the diagnosis?"
data[, 31] <- factor(
  data[, 31],
  levels = c("A1", "A2", "A3", "A4", "A6", "A5"),
  labels = c(
    "Less than 1 month",
    "Between 1 month and 6 months",
    "Between 6 months and 1 year",
    "Between 1 year and 2 years",
    "More than 2 years",
    "I don't know"
  )
)
names(data)[31] <- "HC1"
# LimeSurvey Field type: F
data[, 32] <- as.numeric(data[, 32])
attributes(data)$variable.labels[
  32
] <- "[Schizophrenia] Which diagnosis(es) have you received?"
data[, 32] <- factor(
  data[, 32],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[32] <- "DSD1_A1"
# LimeSurvey Field type: F
data[, 33] <- as.numeric(data[, 33])
attributes(data)$variable.labels[
  33
] <- "[Schizoaffective disorder] Which diagnosis(es) have you received?"
data[, 33] <- factor(
  data[, 33],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[33] <- "DSD1_A2"
# LimeSurvey Field type: F
data[, 34] <- as.numeric(data[, 34])
attributes(data)$variable.labels[
  34
] <- "[Schizophreniform disorder] Which diagnosis(es) have you received?"
data[, 34] <- factor(
  data[, 34],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[34] <- "DSD1_A3"
# LimeSurvey Field type: F
data[, 35] <- as.numeric(data[, 35])
attributes(data)$variable.labels[
  35
] <- "[Delusional disorder] Which diagnosis(es) have you received?"
data[, 35] <- factor(
  data[, 35],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[35] <- "DSD1_A4"
# LimeSurvey Field type: F
data[, 36] <- as.numeric(data[, 36])
attributes(data)$variable.labels[
  36
] <- "[Brief psychotic disorder] Which diagnosis(es) have you received?"
data[, 36] <- factor(
  data[, 36],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[36] <- "DSD1_A5"
# LimeSurvey Field type: F
data[, 37] <- as.numeric(data[, 37])
attributes(data)$variable.labels[
  37
] <- "[Shared psychotic disorder] Which diagnosis(es) have you received?"
data[, 37] <- factor(
  data[, 37],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[37] <- "DSD1_A6"
# LimeSurvey Field type: F
data[, 38] <- as.numeric(data[, 38])
attributes(data)$variable.labels[
  38
] <- "[Substance-induced psychotic disorder] Which diagnosis(es) have you received?"
data[, 38] <- factor(
  data[, 38],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[38] <- "DSD1_A7"
# LimeSurvey Field type: F
data[, 39] <- as.numeric(data[, 39])
attributes(data)$variable.labels[
  39
] <- "[Psychotic disorder due to another medical condition] Which diagnosis(es) have you received?"
data[, 39] <- factor(
  data[, 39],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[39] <- "DSD1_A8"
# LimeSurvey Field type: F
data[, 40] <- as.numeric(data[, 40])
attributes(data)$variable.labels[
  40
] <- "[Unspecified psychotic disorder] Which diagnosis(es) have you received?"
data[, 40] <- factor(
  data[, 40],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[40] <- "DSD1_A9"
# LimeSurvey Field type: F
data[, 41] <- as.numeric(data[, 41])
attributes(data)$variable.labels[
  41
] <- "[Bipolar disorder with psychotic features] Which diagnosis(es) have you received?"
data[, 41] <- factor(
  data[, 41],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[41] <- "DSD1_A10"
# LimeSurvey Field type: F
data[, 42] <- as.numeric(data[, 42])
attributes(data)$variable.labels[
  42
] <- "[I don't know] Which diagnosis(es) have you received?"
data[, 42] <- factor(
  data[, 42],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[42] <- "DSD1_A11"
# LimeSurvey Field type: F
data[, 43] <- as.numeric(data[, 43])
attributes(data)$variable.labels[
  43
] <- "[I prefer not to answer] Which diagnosis(es) have you received?"
data[, 43] <- factor(
  data[, 43],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[43] <- "DSD1_A12"
# LimeSurvey Field type: A
data[, 44] <- as.character(data[, 44])
attributes(data)$variable.labels[
  44
] <- "[Other] Which diagnosis(es) have you received?"
names(data)[44] <- "DSD1_other"
# LimeSurvey Field type: A
data[, 45] <- as.character(data[, 45])
attributes(data)$variable.labels[
  45
] <- "Thank you for your participation. Unfortunately, you are not eligible to continue this study because we do not include psychotic disorders due to another medical condition."
names(data)[45] <- "END3"
# LimeSurvey Field type: A
data[, 46] <- as.character(data[, 46])
attributes(data)$variable.labels[
  46
] <- "Have you ever been hospitalized because of the psychotic disorder? Consider only hospitalizations with overnight stay(s)."
data[, 46] <- factor(
  data[, 46],
  levels = c("A1", "A2", "A3"),
  labels = c("Yes", "No", "I don't know")
)
names(data)[46] <- "DSD2"
# LimeSurvey Field type: A
data[, 47] <- as.character(data[, 47])
attributes(data)$variable.labels[
  47
] <- "{if(((is_empty(DSD1_A1.NAOK)) and (is_empty(DSD1_A2.NAOK)) and (is_empty(DSD1_A3.NAOK)) and (is_empty(DSD1_A4.NAOK)) and (is_empty(DSD1_A5.NAOK)) and (is_empty(DSD1_A6.NAOK)) and (is_empty(DSD1_A7.NAOK)) and (is_empty(DSD1_A9.NAOK)) and (is_empty(DSD1_A10.NAOK)) and (is_empty(DSD1_A11.NAOK)) and (is_empty(DSD1_A12.NAOK)) and (is_empty(DSD1_other)) and (DSD1_A8.NAOK == \"Y\")),'uitgesloten','in')}"
names(data)[47] <- "G00Q10" # left logic text unchanged to avoid breaking relevance
# LimeSurvey Field type: A
data[, 48] <- as.character(data[, 48])
attributes(data)$variable.labels[
  48
] <- "[Obsessive–compulsive disorder (OCD)] Do you have one or more of the following health problems that may be associated with the psychotic disorder?"
data[, 48] <- factor(
  data[, 48],
  levels = c("A1", "A2", "A3"),
  labels = c("Yes", "No", "I don't know")
)
names(data)[48] <- "DSD3_SQ1"
# LimeSurvey Field type: A
data[, 49] <- as.character(data[, 49])
attributes(data)$variable.labels[
  49
] <- "[Depression] Do you have one or more of the following health problems that may be associated with the psychotic disorder?"
data[, 49] <- factor(
  data[, 49],
  levels = c("A1", "A2", "A3"),
  labels = c("Yes", "No", "I don't know")
)
names(data)[49] <- "DSD3_SQ2"
# LimeSurvey Field type: A
data[, 50] <- as.character(data[, 50])
attributes(data)$variable.labels[
  50
] <- "[Bipolar disorder] Do you have one or more of the following health problems that may be associated with the psychotic disorder?"
data[, 50] <- factor(
  data[, 50],
  levels = c("A1", "A2", "A3"),
  labels = c("Yes", "No", "I don't know")
)
names(data)[50] <- "DSD3_SQ3"
# LimeSurvey Field type: A
data[, 51] <- as.character(data[, 51])
attributes(data)$variable.labels[
  51
] <- "[Alcohol use disorder] Do you have one or more of the following health problems that may be associated with the psychotic disorder?"
data[, 51] <- factor(
  data[, 51],
  levels = c("A1", "A2", "A3"),
  labels = c("Yes", "No", "I don't know")
)
names(data)[51] <- "DSD3_SQ4"
# LimeSurvey Field type: A
data[, 52] <- as.character(data[, 52])
attributes(data)$variable.labels[
  52
] <- "[Substance use disorder] Do you have one or more of the following health problems that may be associated with the psychotic disorder?"
data[, 52] <- factor(
  data[, 52],
  levels = c("A1", "A2", "A3"),
  labels = c("Yes", "No", "I don't know")
)
names(data)[52] <- "DSD3_SQ5"
# LimeSurvey Field type: A
data[, 53] <- as.character(data[, 53])
attributes(data)$variable.labels[
  53
] <- "[Anxiety disorder or panic disorder] Do you have one or more of the following health problems that may be associated with the psychotic disorder?"
data[, 53] <- factor(
  data[, 53],
  levels = c("A1", "A2", "A3"),
  labels = c("Yes", "No", "I don't know")
)
names(data)[53] <- "DSD3_SQ9"
# LimeSurvey Field type: A
data[, 54] <- as.character(data[, 54])
attributes(data)$variable.labels[
  54
] <- "[Post-traumatic stress disorder (PTSD)] Do you have one or more of the following health problems that may be associated with the psychotic disorder?"
data[, 54] <- factor(
  data[, 54],
  levels = c("A1", "A2", "A3"),
  labels = c("Yes", "No", "I don't know")
)
names(data)[54] <- "DSD3_SQ6"
# LimeSurvey Field type: A
data[, 55] <- as.character(data[, 55])
attributes(data)$variable.labels[
  55
] <- "[Personality disorder] Do you have one or more of the following health problems that may be associated with the psychotic disorder?"
data[, 55] <- factor(
  data[, 55],
  levels = c("A1", "A2", "A3"),
  labels = c("Yes", "No", "I don't know")
)
names(data)[55] <- "DSD3_SQ7"
# LimeSurvey Field type: A
data[, 56] <- as.character(data[, 56])
attributes(data)$variable.labels[
  56
] <- "[Autism spectrum disorder] Do you have one or more of the following health problems that may be associated with the psychotic disorder?"
data[, 56] <- factor(
  data[, 56],
  levels = c("A1", "A2", "A3"),
  labels = c("Yes", "No", "I don't know")
)
names(data)[56] <- "DSD3_SQ8"
# LimeSurvey Field type: A
data[, 57] <- as.character(data[, 57])
attributes(data)$variable.labels[
  57
] <- "[Attention-deficit/hyperactivity disorder (ADHD)] Do you have one or more of the following health problems that may be associated with the psychotic disorder?"
data[, 57] <- factor(
  data[, 57],
  levels = c("A1", "A2", "A3"),
  labels = c("Yes", "No", "I don't know")
)
names(data)[57] <- "DSD3_SQ10"
# LimeSurvey Field type: A
data[, 58] <- as.character(data[, 58])
attributes(data)$variable.labels[
  58
] <- "[Eating disorder (e.g., anorexia, bulimia)] Do you have one or more of the following health problems that may be associated with the psychotic disorder?"
data[, 58] <- factor(
  data[, 58],
  levels = c("A1", "A2", "A3"),
  labels = c("Yes", "No", "I don't know")
)
names(data)[58] <- "DSD3_SQ11"
# LimeSurvey Field type: A
data[, 59] <- as.character(data[, 59])
attributes(data)$variable.labels[
  59
] <- "Do you also have any other health problem(s)?"
data[, 59] <- factor(
  data[, 59],
  levels = c("A1", "A2", "A3"),
  labels = c("Yes", "No", "I don't know")
)
names(data)[59] <- "D14"
# LimeSurvey Field type: F
data[, 60] <- as.numeric(data[, 60])
attributes(data)$variable.labels[
  60
] <- "[Disease of the heart or blood vessels (e.g., hypertension)] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
data[, 60] <- factor(
  data[, 60],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[60] <- "D15_2"
# LimeSurvey Field type: A
data[, 61] <- as.character(data[, 61])
attributes(data)$variable.labels[
  61
] <- "[Comment] [Disease of the heart or blood vessels (e.g., hypertension)] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
names(data)[61] <- "D15_2comment"
# LimeSurvey Field type: F
data[, 62] <- as.numeric(data[, 62])
attributes(data)$variable.labels[
  62
] <- "[Disease of the respiratory system (e.g., asthma)] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
data[, 62] <- factor(
  data[, 62],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[62] <- "D15_3"
# LimeSurvey Field type: A
data[, 63] <- as.character(data[, 63])
attributes(data)$variable.labels[
  63
] <- "[Comment] [Disease of the respiratory system (e.g., asthma)] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
names(data)[63] <- "D15_3comment"
# LimeSurvey Field type: F
data[, 64] <- as.numeric(data[, 64])
attributes(data)$variable.labels[
  64
] <- "[Disease of the digestive system (e.g., irritable bowel syndrome)] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
data[, 64] <- factor(
  data[, 64],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[64] <- "D15_4"
# LimeSurvey Field type: A
data[, 65] <- as.character(data[, 65])
attributes(data)$variable.labels[
  65
] <- "[Comment] [Disease of the digestive system (e.g., irritable bowel syndrome)] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
names(data)[65] <- "D15_4comment"
# LimeSurvey Field type: F
data[, 66] <- as.numeric(data[, 66])
attributes(data)$variable.labels[
  66
] <- "[Skin disease] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
data[, 66] <- factor(
  data[, 66],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[66] <- "D15_5"
# LimeSurvey Field type: A
data[, 67] <- as.character(data[, 67])
attributes(data)$variable.labels[
  67
] <- "[Comment] [Skin disease] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
names(data)[67] <- "D15_5comment"
# LimeSurvey Field type: F
data[, 68] <- as.numeric(data[, 68])
attributes(data)$variable.labels[
  68
] <- "[Disease of bones, joints, or muscles (e.g., osteoarthritis, rheumatoid arthritis)] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
data[, 68] <- factor(
  data[, 68],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[68] <- "D15_6"
# LimeSurvey Field type: A
data[, 69] <- as.character(data[, 69])
attributes(data)$variable.labels[
  69
] <- "[Comment] [Disease of bones, joints, or muscles (e.g., osteoarthritis, rheumatoid arthritis)] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
names(data)[69] <- "D15_6comment"
# LimeSurvey Field type: F
data[, 70] <- as.numeric(data[, 70])
attributes(data)$variable.labels[
  70
] <- "[Other mental or psychological disorder not mentioned in the previous question] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
data[, 70] <- factor(
  data[, 70],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[70] <- "D15_7"
# LimeSurvey Field type: A
data[, 71] <- as.character(data[, 71])
attributes(data)$variable.labels[
  71
] <- "[Comment] [Other mental or psychological disorder not mentioned in the previous question] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
names(data)[71] <- "D15_7comment"
# LimeSurvey Field type: F
data[, 72] <- as.numeric(data[, 72])
attributes(data)$variable.labels[
  72
] <- "[Neurodevelopmental disorder (e.g., developmental delay)] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
data[, 72] <- factor(
  data[, 72],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[72] <- "D15_17"
# LimeSurvey Field type: A
data[, 73] <- as.character(data[, 73])
attributes(data)$variable.labels[
  73
] <- "[Comment] [Neurodevelopmental disorder (e.g., developmental delay)] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
names(data)[73] <- "D15_17comment"
# LimeSurvey Field type: F
data[, 74] <- as.numeric(data[, 74])
attributes(data)$variable.labels[
  74
] <- "[Disease of the nervous system (neurological) (e.g., dementia, multiple sclerosis)] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
data[, 74] <- factor(
  data[, 74],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[74] <- "D15_11"
# LimeSurvey Field type: A
data[, 75] <- as.character(data[, 75])
attributes(data)$variable.labels[
  75
] <- "[Comment] [Disease of the nervous system (neurological) (e.g., dementia, multiple sclerosis)] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
names(data)[75] <- "D15_11comment"
# LimeSurvey Field type: F
data[, 76] <- as.numeric(data[, 76])
attributes(data)$variable.labels[
  76
] <- "[Disease of the blood (hematological) (e.g., anemia)] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
data[, 76] <- factor(
  data[, 76],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[76] <- "D15_8"
# LimeSurvey Field type: A
data[, 77] <- as.character(data[, 77])
attributes(data)$variable.labels[
  77
] <- "[Comment] [Disease of the blood (hematological) (e.g., anemia)] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
names(data)[77] <- "D15_8comment"
# LimeSurvey Field type: F
data[, 78] <- as.numeric(data[, 78])
attributes(data)$variable.labels[
  78
] <- "[Immune disease (e.g., allergies, autoinflammatory diseases)] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
data[, 78] <- factor(
  data[, 78],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[78] <- "D15_9"
# LimeSurvey Field type: A
data[, 79] <- as.character(data[, 79])
attributes(data)$variable.labels[
  79
] <- "[Comment] [Immune disease (e.g., allergies, autoinflammatory diseases)] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
names(data)[79] <- "D15_9comment"
# LimeSurvey Field type: F
data[, 80] <- as.numeric(data[, 80])
attributes(data)$variable.labels[
  80
] <- "[Endocrine, nutritional, or metabolic disease (e.g., diabetes, high cholesterol, obesity, hypothyroidism)] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
data[, 80] <- factor(
  data[, 80],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[80] <- "D15_10"
# LimeSurvey Field type: A
data[, 81] <- as.character(data[, 81])
attributes(data)$variable.labels[
  81
] <- "[Comment] [Endocrine, nutritional, or metabolic disease (e.g., diabetes, high cholesterol, obesity, hypothyroidism)] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
names(data)[81] <- "D15_10comment"
# LimeSurvey Field type: F
data[, 82] <- as.numeric(data[, 82])
attributes(data)$variable.labels[
  82
] <- "[Eye disease] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
data[, 82] <- factor(
  data[, 82],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[82] <- "D15_12"
# LimeSurvey Field type: A
data[, 83] <- as.character(data[, 83])
attributes(data)$variable.labels[
  83
] <- "[Comment] [Eye disease] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
names(data)[83] <- "D15_12comment"
# LimeSurvey Field type: F
data[, 84] <- as.numeric(data[, 84])
attributes(data)$variable.labels[
  84
] <- "[Ear or vestibular system disease] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
data[, 84] <- factor(
  data[, 84],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[84] <- "D15_13"
# LimeSurvey Field type: A
data[, 85] <- as.character(data[, 85])
attributes(data)$variable.labels[
  85
] <- "[Comment] [Ear or vestibular system disease] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
names(data)[85] <- "D15_13comment"
# LimeSurvey Field type: F
data[, 86] <- as.numeric(data[, 86])
attributes(data)$variable.labels[
  86
] <- "[Disease of the reproductive organs or urinary system (e.g., kidney failure, endometriosis)] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
data[, 86] <- factor(
  data[, 86],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[86] <- "D15_14"
# LimeSurvey Field type: A
data[, 87] <- as.character(data[, 87])
attributes(data)$variable.labels[
  87
] <- "[Comment] [Disease of the reproductive organs or urinary system (e.g., kidney failure, endometriosis)] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
names(data)[87] <- "D15_14comment"
# LimeSurvey Field type: F
data[, 88] <- as.numeric(data[, 88])
attributes(data)$variable.labels[
  88
] <- "[Sleep disorders (e.g., obstructive sleep apnea)] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
data[, 88] <- factor(
  data[, 88],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[88] <- "D15_18"
# LimeSurvey Field type: A
data[, 89] <- as.character(data[, 89])
attributes(data)$variable.labels[
  89
] <- "[Comment] [Sleep disorders (e.g., obstructive sleep apnea)] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
names(data)[89] <- "D15_18comment"
# LimeSurvey Field type: F
data[, 90] <- as.numeric(data[, 90])
attributes(data)$variable.labels[
  90
] <- "[Disease affecting multiple systems (e.g., psoriasis)] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
data[, 90] <- factor(
  data[, 90],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[90] <- "D15_15"
# LimeSurvey Field type: A
data[, 91] <- as.character(data[, 91])
attributes(data)$variable.labels[
  91
] <- "[Comment] [Disease affecting multiple systems (e.g., psoriasis)] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
names(data)[91] <- "D15_15comment"
# LimeSurvey Field type: F
data[, 92] <- as.numeric(data[, 92])
attributes(data)$variable.labels[
  92
] <- "[No known diagnosis] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
data[, 92] <- factor(
  data[, 92],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[92] <- "D15_19"
# LimeSurvey Field type: A
data[, 93] <- as.character(data[, 93])
attributes(data)$variable.labels[
  93
] <- "[Comment] [No known diagnosis] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
names(data)[93] <- "D15_19comment"
# LimeSurvey Field type: F
data[, 94] <- as.numeric(data[, 94])
attributes(data)$variable.labels[
  94
] <- "[I don't know] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
data[, 94] <- factor(
  data[, 94],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[94] <- "D15_16"
# LimeSurvey Field type: A
data[, 95] <- as.character(data[, 95])
attributes(data)$variable.labels[
  95
] <- "[Comment] [I don't know] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
names(data)[95] <- "D15_16comment"
# LimeSurvey Field type: A
data[, 96] <- as.character(data[, 96])
attributes(data)$variable.labels[
  96
] <- "[Other] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
names(data)[96] <- "D15_other"
# LimeSurvey Field type: A
data[, 97] <- as.character(data[, 97])
attributes(data)$variable.labels[
  97
] <- "[Comment for other] Which other health problems do you have? You may tick multiple boxes. Please also specify the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “no known diagnosis”."
names(data)[97] <- "D15_othercomment"
# LimeSurvey Field type: A
data[, 98] <- as.character(data[, 98])
attributes(data)$variable.labels[
  98
] <- "Your mobility before your first psychotic symptoms"
data[, 98] <- factor(
  data[, 98],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "I had no problems walking.",
    "I had slight problems walking.",
    "I had moderate problems walking.",
    "I had severe problems walking.",
    "I was unable to walk.",
    "I don't know."
  )
)
names(data)[98] <- "H1"
# LimeSurvey Field type: A
data[, 99] <- as.character(data[, 99])
attributes(data)$variable.labels[
  99
] <- "Your self-care before your first psychotic symptoms"
data[, 99] <- factor(
  data[, 99],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "I had no problems washing or dressing by myself.",
    "I had slight problems washing or dressing by myself.",
    "I had moderate problems washing or dressing by myself.",
    "I had severe problems washing or dressing by myself.",
    "I was unable to wash or dress by myself.",
    "I don't know."
  )
)
names(data)[99] <- "H2"
# LimeSurvey Field type: A
data[, 100] <- as.character(data[, 100])
attributes(data)$variable.labels[
  100
] <- "Your usual activities before your first psychotic symptoms (e.g., work, study, shopping, housework, using public transport, activities with family or seeing friends, leisure)"
data[, 100] <- factor(
  data[, 100],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "I had no problems performing my usual activities.",
    "I had slight problems performing my usual activities.",
    "I had moderate problems performing my usual activities.",
    "I had severe problems performing my usual activities.",
    "I was unable to perform my usual activities.",
    "I don't know."
  )
)
names(data)[100] <- "H3"
# LimeSurvey Field type: A
data[, 101] <- as.character(data[, 101])
attributes(data)$variable.labels[
  101
] <- "Your pain or discomfort before your first psychotic symptoms"
data[, 101] <- factor(
  data[, 101],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "I had no pain or discomfort.",
    "I had slight pain or discomfort.",
    "I had moderate pain or discomfort.",
    "I had severe pain or discomfort.",
    "I had extreme pain or discomfort.",
    "I don't know."
  )
)
names(data)[101] <- "H4"
# LimeSurvey Field type: A
data[, 102] <- as.character(data[, 102])
attributes(data)$variable.labels[
  102
] <- "Your anxiety or depression before your first psychotic symptoms"
data[, 102] <- factor(
  data[, 102],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "I was not anxious or depressed.",
    "I was slightly anxious or depressed.",
    "I was moderately anxious or depressed.",
    "I was severely anxious or depressed.",
    "I was extremely anxious or depressed.",
    "I don't know."
  )
)
names(data)[102] <- "H5"
# LimeSurvey Field type: F
data[, 103] <- as.numeric(data[, 103])
attributes(data)$variable.labels[
  103
] <- "We would like to know how good or bad your health was BEFORE your first psychotic symptoms on a scale from 0 to 100. 100 means the best health you can imagine; 0 means the worst health you can imagine. Please enter a number between 0 and 100 to indicate your health BEFORE your first psychotic symptoms."
names(data)[103] <- "H6"
# LimeSurvey Field type: A
data[, 104] <- as.character(data[, 104])
attributes(data)$variable.labels[
  104
] <- "We would like to know your current health status, as you experience it today. Please tick the box next to the statement that best describes your health TODAY."
names(data)[104] <- "TXT"
# LimeSurvey Field type: A
data[, 105] <- as.character(data[, 105])
attributes(data)$variable.labels[105] <- "Your mobility today"
data[, 105] <- factor(
  data[, 105],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "I have no problems walking.",
    "I have slight problems walking.",
    "I have moderate problems walking.",
    "I have severe problems walking.",
    "I am unable to walk.",
    "I don't know."
  )
)
names(data)[105] <- "H7"
# LimeSurvey Field type: A
data[, 106] <- as.character(data[, 106])
attributes(data)$variable.labels[106] <- "Your self-care today"
data[, 106] <- factor(
  data[, 106],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "I have no problems washing or dressing by myself.",
    "I have slight problems washing or dressing by myself.",
    "I have moderate problems washing or dressing by myself.",
    "I have severe problems washing or dressing by myself.",
    "I am unable to wash or dress by myself.",
    "I don't know."
  )
)
names(data)[106] <- "H8"
# LimeSurvey Field type: A
data[, 107] <- as.character(data[, 107])
attributes(data)$variable.labels[
  107
] <- "Your usual activities today (e.g., work, study, shopping, housework, using public transport, activities with family or seeing friends, leisure)"
data[, 107] <- factor(
  data[, 107],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "I have no problems performing my usual activities.",
    "I have slight problems performing my usual activities.",
    "I have moderate problems performing my usual activities.",
    "I have severe problems performing my usual activities.",
    "I am unable to perform my usual activities.",
    "I don't know."
  )
)
names(data)[107] <- "H9"
# LimeSurvey Field type: A
data[, 108] <- as.character(data[, 108])
attributes(data)$variable.labels[108] <- "Your pain or discomfort today"
data[, 108] <- factor(
  data[, 108],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "I have no pain or discomfort.",
    "I have slight pain or discomfort.",
    "I have moderate pain or discomfort.",
    "I have severe pain or discomfort.",
    "I have extreme pain or discomfort.",
    "I don't know."
  )
)
names(data)[108] <- "H10"
# LimeSurvey Field type: A
data[, 109] <- as.character(data[, 109])
attributes(data)$variable.labels[109] <- "Your anxiety or depression today"
data[, 109] <- factor(
  data[, 109],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "I am not anxious or depressed.",
    "I am slightly anxious or depressed.",
    "I am moderately anxious or depressed.",
    "I am severely anxious or depressed.",
    "I am extremely anxious or depressed.",
    "I don't know."
  )
)
names(data)[109] <- "H11"
# LimeSurvey Field type: F
data[, 110] <- as.numeric(data[, 110])
attributes(data)$variable.labels[
  110
] <- "We would like to know how good or bad your health is TODAY on a scale from 0 to 100. 100 means the best health you can imagine; 0 means the worst health you can imagine. Please enter a number between 0 and 100 to indicate your health TODAY."
names(data)[110] <- "H12"
# LimeSurvey Field type: A
data[, 111] <- as.character(data[, 111])
attributes(data)$variable.labels[
  111
] <- "Have you received treatment related to your psychotic disorder in the past 5 years?"
data[, 111] <- factor(
  data[, 111],
  levels = c("A1", "A2", "A3"),
  labels = c("Yes", "No", "I don't know")
)
names(data)[111] <- "HC2"
# LimeSurvey Field type: F
data[, 112] <- as.numeric(data[, 112])
attributes(data)$variable.labels[
  112
] <- "[Atypical (second-generation) antipsychotics (e.g., Aripiprazole, Abilify, Sycrest, Reagila, Olanzapine, Zypadhera, Invega, Xeplion, Trevicta, Quetiapine, Risperidone, Serdolect)] Which treatments have you received for the psychotic disorder in the past 5 years?"
data[, 112] <- factor(
  data[, 112],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[112] <- "HC3_SQ005"
# LimeSurvey Field type: F
data[, 113] <- as.numeric(data[, 113])
attributes(data)$variable.labels[
  113
] <- "[Typical (first-generation) antipsychotics (e.g., Clopixol, Haldol, Nozinan, Fluanxol, Etumine, Deanxit)] Which treatments have you received for the psychotic disorder in the past 5 years?"
data[, 113] <- factor(
  data[, 113],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[113] <- "HC3_SQ006"
# LimeSurvey Field type: F
data[, 114] <- as.numeric(data[, 114])
attributes(data)$variable.labels[
  114
] <- "[Clozapine (e.g., Clozapine Sandoz, Leponex)] Which treatments have you received for the psychotic disorder in the past 5 years?"
data[, 114] <- factor(
  data[, 114],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[114] <- "HC3_SQ007"
# LimeSurvey Field type: F
data[, 115] <- as.numeric(data[, 115])
attributes(data)$variable.labels[
  115
] <- "[Antidepressants used to treat depression, obsessive–compulsive disorder, or panic disorder (e.g., Citalopram, Escitalopram, Fluoxetine, Sertraline, Edronax, Redomex, Duloxetine, Venlafaxine)] Which treatments have you received for the psychotic disorder in the past 5 years?"
data[, 115] <- factor(
  data[, 115],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[115] <- "HC3_SQ008"
# LimeSurvey Field type: F
data[, 116] <- as.numeric(data[, 116])
attributes(data)$variable.labels[
  116
] <- "[Tranquilizers (e.g., Diazepam, Valium, Lormetazepam, Lorazepam)] Which treatments have you received for the psychotic disorder in the past 5 years?"
data[, 116] <- factor(
  data[, 116],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[116] <- "HC3_SQ001"
# LimeSurvey Field type: F
data[, 117] <- as.numeric(data[, 117])
attributes(data)$variable.labels[
  117
] <- "[Psychotherapy (e.g., cognitive behavioral therapy, psychoeducation, etc.)] Which treatments have you received for the psychotic disorder in the past 5 years?"
data[, 117] <- factor(
  data[, 117],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[117] <- "HC3_SQ002"
# LimeSurvey Field type: F
data[, 118] <- as.numeric(data[, 118])
attributes(data)$variable.labels[
  118
] <- "[Electroconvulsive therapy (ECT)] Which treatments have you received for the psychotic disorder in the past 5 years?"
data[, 118] <- factor(
  data[, 118],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[118] <- "HC3_SQ003"
# LimeSurvey Field type: F
data[, 119] <- as.numeric(data[, 119])
attributes(data)$variable.labels[
  119
] <- "[Other non-invasive brain stimulation: transcranial direct current stimulation (tDCS) or repetitive transcranial magnetic stimulation (rTMS)] Which treatments have you received for the psychotic disorder in the past 5 years?"
data[, 119] <- factor(
  data[, 119],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[119] <- "HC3_SQ012"
# LimeSurvey Field type: F
data[, 120] <- as.numeric(data[, 120])
attributes(data)$variable.labels[
  120
] <- "[Deep brain stimulation] Which treatments have you received for the psychotic disorder in the past 5 years?"
data[, 120] <- factor(
  data[, 120],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[120] <- "HC3_SQ013"
# LimeSurvey Field type: F
data[, 121] <- as.numeric(data[, 121])
attributes(data)$variable.labels[
  121
] <- "[Physical exercise] Which treatments have you received for the psychotic disorder in the past 5 years?"
data[, 121] <- factor(
  data[, 121],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[121] <- "HC3_SQ011"
# LimeSurvey Field type: F
data[, 122] <- as.numeric(data[, 122])
attributes(data)$variable.labels[
  122
] <- "[Peer support] Which treatments have you received for the psychotic disorder in the past 5 years?"
data[, 122] <- factor(
  data[, 122],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[122] <- "HC3_SQ010"
# LimeSurvey Field type: F
data[, 123] <- as.numeric(data[, 123])
attributes(data)$variable.labels[
  123
] <- "[I don't know] Which treatments have you received for the psychotic disorder in the past 5 years?"
data[, 123] <- factor(
  data[, 123],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[123] <- "HC3_SQ004"
# LimeSurvey Field type: A
data[, 124] <- as.character(data[, 124])
attributes(data)$variable.labels[
  124
] <- "[Other] Which treatments have you received for the psychotic disorder in the past 5 years?"
names(data)[124] <- "HC3_other"
# LimeSurvey Field type: F
data[, 125] <- as.numeric(data[, 125])
attributes(data)$variable.labels[
  125
] <- "[Weight gain] Which side effect(s) did you have during or after treatment for the psychotic disorder in the past 5 years?"
data[, 125] <- factor(
  data[, 125],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[125] <- "HC4_SQ001"
# LimeSurvey Field type: F
data[, 126] <- as.numeric(data[, 126])
attributes(data)$variable.labels[
  126
] <- "[Hyperglycemia (high blood sugar) or diabetes] Which side effect(s) did you have during or after treatment for the psychotic disorder in the past 5 years?"
data[, 126] <- factor(
  data[, 126],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[126] <- "HC4_SQ002"
# LimeSurvey Field type: F
data[, 127] <- as.numeric(data[, 127])
attributes(data)$variable.labels[
  127
] <- "[High cholesterol (excess blood lipids)] Which side effect(s) did you have during or after treatment for the psychotic disorder in the past 5 years?"
data[, 127] <- factor(
  data[, 127],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[127] <- "HC4_SQ003"
# LimeSurvey Field type: F
data[, 128] <- as.numeric(data[, 128])
attributes(data)$variable.labels[
  128
] <- "[Low white blood cell count] Which side effect(s) did you have during or after treatment for the psychotic disorder in the past 5 years?"
data[, 128] <- factor(
  data[, 128],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[128] <- "HC4_SQ004"
# LimeSurvey Field type: F
data[, 129] <- as.numeric(data[, 129])
attributes(data)$variable.labels[
  129
] <- "[Movement disorders] Which side effect(s) did you have during or after treatment for the psychotic disorder in the past 5 years?"
data[, 129] <- factor(
  data[, 129],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[129] <- "HC4_SQ019"
# LimeSurvey Field type: F
data[, 130] <- as.numeric(data[, 130])
attributes(data)$variable.labels[
  130
] <- "[Agitation, difficulty staying still, urge to move] Which side effect(s) did you have during or after treatment for the psychotic disorder in the past 5 years?"
data[, 130] <- factor(
  data[, 130],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[130] <- "HC4_SQ005"
# LimeSurvey Field type: F
data[, 131] <- as.numeric(data[, 131])
attributes(data)$variable.labels[
  131
] <- "[Involuntary, sometimes painful, muscle contractions] Which side effect(s) did you have during or after treatment for the psychotic disorder in the past 5 years?"
data[, 131] <- factor(
  data[, 131],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[131] <- "HC4_SQ006"
# LimeSurvey Field type: F
data[, 132] <- as.numeric(data[, 132])
attributes(data)$variable.labels[
  132
] <- "[Tremors and/or facial rigidity] Which side effect(s) did you have during or after treatment for the psychotic disorder in the past 5 years?"
data[, 132] <- factor(
  data[, 132],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[132] <- "HC4_SQ007"
# LimeSurvey Field type: F
data[, 133] <- as.numeric(data[, 133])
attributes(data)$variable.labels[
  133
] <- "[Involuntary facial movements, such as chewing, tongue protrusion, or eye blinking] Which side effect(s) did you have during or after treatment for the psychotic disorder in the past 5 years?"
data[, 133] <- factor(
  data[, 133],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[133] <- "HC4_SQ008"
# LimeSurvey Field type: F
data[, 134] <- as.numeric(data[, 134])
attributes(data)$variable.labels[
  134
] <- "[Fatigue or drowsiness] Which side effect(s) did you have during or after treatment for the psychotic disorder in the past 5 years?"
data[, 134] <- factor(
  data[, 134],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[134] <- "HC4_SQ009"
# LimeSurvey Field type: F
data[, 135] <- as.numeric(data[, 135])
attributes(data)$variable.labels[
  135
] <- "[Dizziness] Which side effect(s) did you have during or after treatment for the psychotic disorder in the past 5 years?"
data[, 135] <- factor(
  data[, 135],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[135] <- "HC4_SQ010"
# LimeSurvey Field type: F
data[, 136] <- as.numeric(data[, 136])
attributes(data)$variable.labels[
  136
] <- "[Dry mouth or eyes] Which side effect(s) did you have during or after treatment for the psychotic disorder in the past 5 years?"
data[, 136] <- factor(
  data[, 136],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[136] <- "HC4_SQ011"
# LimeSurvey Field type: F
data[, 137] <- as.numeric(data[, 137])
attributes(data)$variable.labels[
  137
] <- "[Nausea] Which side effect(s) did you have during or after treatment for the psychotic disorder in the past 5 years?"
data[, 137] <- factor(
  data[, 137],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[137] <- "HC4_SQ012"
# LimeSurvey Field type: F
data[, 138] <- as.numeric(data[, 138])
attributes(data)$variable.labels[
  138
] <- "[Constipation] Which side effect(s) did you have during or after treatment for the psychotic disorder in the past 5 years?"
data[, 138] <- factor(
  data[, 138],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[138] <- "HC4_SQ013"
# LimeSurvey Field type: F
data[, 139] <- as.numeric(data[, 139])
attributes(data)$variable.labels[
  139
] <- "[Myocarditis (inflammation of the heart muscle)] Which side effect(s) did you have during or after treatment for the psychotic disorder in the past 5 years?"
data[, 139] <- factor(
  data[, 139],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[139] <- "HC4_SQ014"
# LimeSurvey Field type: F
data[, 140] <- as.numeric(data[, 140])
attributes(data)$variable.labels[
  140
] <- "[Sexual dysfunction (e.g., decreased libido)] Which side effect(s) did you have during or after treatment for the psychotic disorder in the past 5 years?"
data[, 140] <- factor(
  data[, 140],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[140] <- "HC4_SQ015"
# LimeSurvey Field type: F
data[, 141] <- as.numeric(data[, 141])
attributes(data)$variable.labels[
  141
] <- "[Memory problems or “brain fog”] Which side effect(s) did you have during or after treatment for the psychotic disorder in the past 5 years?"
data[, 141] <- factor(
  data[, 141],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[141] <- "HC4_SQ016"
# LimeSurvey Field type: F
data[, 142] <- as.numeric(data[, 142])
attributes(data)$variable.labels[
  142
] <- "[Affective blunting (lack of motivation, lack of interest)] Which side effect(s) did you have during or after treatment for the psychotic disorder in the past 5 years?"
data[, 142] <- factor(
  data[, 142],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[142] <- "HC4_SQ017"
# LimeSurvey Field type: F
data[, 143] <- as.numeric(data[, 143])
attributes(data)$variable.labels[
  143
] <- "[No side effects] Which side effect(s) did you have during or after treatment for the psychotic disorder in the past 5 years?"
data[, 143] <- factor(
  data[, 143],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[143] <- "HC4_SQ018"
# LimeSurvey Field type: A
data[, 144] <- as.character(data[, 144])
attributes(data)$variable.labels[
  144
] <- "[Other] Which side effect(s) did you have during or after treatment for the psychotic disorder in the past 5 years?"
names(data)[144] <- "HC4_other"
# LimeSurvey Field type: A
data[, 145] <- as.character(data[, 145])
attributes(data)$variable.labels[
  145
] <- "[Weight gain] Indicate how burdensome each side effect was for you."
data[, 145] <- factor(
  data[, 145],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[145] <- "HC5_SQ001"
# LimeSurvey Field type: A
data[, 146] <- as.character(data[, 146])
attributes(data)$variable.labels[
  146
] <- "[Hyperglycemia (high blood sugar) or diabetes] Indicate how burdensome each side effect was for you."
data[, 146] <- factor(
  data[, 146],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[146] <- "HC5_SQ002"
# LimeSurvey Field type: A
data[, 147] <- as.character(data[, 147])
attributes(data)$variable.labels[
  147
] <- "[High cholesterol (excess blood lipids)] Indicate how burdensome each side effect was for you."
data[, 147] <- factor(
  data[, 147],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[147] <- "HC5_SQ003"
# LimeSurvey Field type: A
data[, 148] <- as.character(data[, 148])
attributes(data)$variable.labels[
  148
] <- "[Low white blood cell count] Indicate how burdensome each side effect was for you."
data[, 148] <- factor(
  data[, 148],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[148] <- "HC5_SQ004"
# LimeSurvey Field type: A
data[, 149] <- as.character(data[, 149])
attributes(data)$variable.labels[
  149
] <- "[Agitation, difficulty staying still, urge to move] Indicate how burdensome each side effect was for you."
data[, 149] <- factor(
  data[, 149],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[149] <- "HC5_SQ005"
# LimeSurvey Field type: A
data[, 150] <- as.character(data[, 150])
attributes(data)$variable.labels[
  150
] <- "[Involuntary and sometimes painful muscle contractions] Indicate how burdensome each side effect was for you."
data[, 150] <- factor(
  data[, 150],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[150] <- "HC5_SQ006"
# LimeSurvey Field type: A
data[, 151] <- as.character(data[, 151])
attributes(data)$variable.labels[
  151
] <- "[Tremors and/or facial rigidity] Indicate how burdensome each side effect was for you."
data[, 151] <- factor(
  data[, 151],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[151] <- "HC5_SQ007"
# LimeSurvey Field type: A
data[, 152] <- as.character(data[, 152])
attributes(data)$variable.labels[
  152
] <- "[Involuntary facial movements, such as chewing, sticking out the tongue, or blinking] Indicate how burdensome each side effect was for you."
data[, 152] <- factor(
  data[, 152],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[152] <- "HC5_SQ008"
# LimeSurvey Field type: A
data[, 153] <- as.character(data[, 153])
attributes(data)$variable.labels[
  153
] <- "[Fatigue or drowsiness] Indicate how burdensome each side effect was for you."
data[, 153] <- factor(
  data[, 153],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[153] <- "HC5_SQ009"
# LimeSurvey Field type: A
data[, 154] <- as.character(data[, 154])
attributes(data)$variable.labels[
  154
] <- "[Dizziness] Indicate how burdensome each side effect was for you."
data[, 154] <- factor(
  data[, 154],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[154] <- "HC5_SQ010"
# LimeSurvey Field type: A
data[, 155] <- as.character(data[, 155])
attributes(data)$variable.labels[
  155
] <- "[Dry mouth or eyes] Indicate how burdensome each side effect was for you."
data[, 155] <- factor(
  data[, 155],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[155] <- "HC5_SQ011"
# LimeSurvey Field type: A
data[, 156] <- as.character(data[, 156])
attributes(data)$variable.labels[
  156
] <- "[Nausea] Indicate how burdensome each side effect was for you."
data[, 156] <- factor(
  data[, 156],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[156] <- "HC5_SQ012"
# LimeSurvey Field type: A
data[, 157] <- as.character(data[, 157])
attributes(data)$variable.labels[
  157
] <- "[Constipation] Indicate how burdensome each side effect was for you."
data[, 157] <- factor(
  data[, 157],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[157] <- "HC5_SQ013"
# LimeSurvey Field type: A
data[, 158] <- as.character(data[, 158])
attributes(data)$variable.labels[
  158
] <- "[Myocarditis (inflammation of the heart muscle)] Indicate how burdensome each side effect was for you."
data[, 158] <- factor(
  data[, 158],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[158] <- "HC5_SQ014"
# LimeSurvey Field type: A
data[, 159] <- as.character(data[, 159])
attributes(data)$variable.labels[
  159
] <- "[Sexual dysfunction (e.g., decreased libido)] Indicate how burdensome each side effect was for you."
data[, 159] <- factor(
  data[, 159],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[159] <- "HC5_SQ015"
# LimeSurvey Field type: A
data[, 160] <- as.character(data[, 160])
attributes(data)$variable.labels[
  160
] <- "[Memory problems or “brain fog”] Indicate how burdensome each side effect was for you."
data[, 160] <- factor(
  data[, 160],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[160] <- "HC5_SQ016"
# LimeSurvey Field type: A
data[, 161] <- as.character(data[, 161])
attributes(data)$variable.labels[
  161
] <- "[Affective blunting (lack of motivation, lack of interest)] Indicate how burdensome each side effect was for you."
data[, 161] <- factor(
  data[, 161],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[161] <- "HC5_SQ017"
# LimeSurvey Field type: A
data[, 162] <- as.character(data[, 162])
attributes(data)$variable.labels[
  162
] <- "[No side effects] Indicate how burdensome each side effect was for you."
data[, 162] <- factor(
  data[, 162],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[162] <- "HC5_SQ018"
# LimeSurvey Field type: A
data[, 163] <- as.character(data[, 163])
attributes(data)$variable.labels[
  163
] <- "Apart from side effects, how burdensome was the treatment you received for the psychotic disorder in the past 5 years? For example, due to injections, needing to go to the hospital to receive treatment, a strict dosing schedule, the need to keep the medication refrigerated, etc."
data[, 163] <- factor(
  data[, 163],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[163] <- "HC6"
# LimeSurvey Field type: A
data[, 164] <- as.character(data[, 164])
attributes(data)$variable.labels[
  164
] <- "[The feeling that things are said on TV or written in newspapers especially about you; that people are deliberately trying to harm you; that there is a conspiracy against you; the feeling of hearing your thoughts repeated like an echo; or other altered perceptions of reality.] Since you have been followed or treated for the psychotic disorder, which of the following symptoms have you experienced and how burdensome were they for you? Do not take treatment side effects into account."
data[, 164] <- factor(
  data[, 164],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "I have not had this symptom",
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[164] <- "H13_SQ013"
# LimeSurvey Field type: A
data[, 165] <- as.character(data[, 165])
attributes(data)$variable.labels[
  165
] <- "[Hearing, seeing, or feeling something that is not there. For example, hearing one or more voices when you are alone; seeing objects, people, or animals that others do not see.] Since you have been followed or treated for the psychotic disorder, which of the following symptoms have you experienced and how burdensome were they for you? Do not take treatment side effects into account."
data[, 165] <- factor(
  data[, 165],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "I have not had this symptom",
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[165] <- "H13_SQ014"
# LimeSurvey Field type: A
data[, 166] <- as.character(data[, 166])
attributes(data)$variable.labels[
  166
] <- "[Feelings of influence, control, or passivity. For example, the impression of having thoughts in your head that you do not recognize as your own; the feeling of being controlled by a force or power outside yourself.] Since you have been followed or treated for the psychotic disorder, which of the following symptoms have you experienced and how burdensome were they for you? Do not take treatment side effects into account."
data[, 166] <- factor(
  data[, 166],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "I have not had this symptom",
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[166] <- "H13_SQ016"
# LimeSurvey Field type: A
data[, 167] <- as.character(data[, 167])
attributes(data)$variable.labels[
  167
] <- "[Disorganized thinking, such as feeling that your mind is blank, the impression that your thoughts have been taken out of your head, or having thoughts in your head that you do not recognize as your own.] Since you have been followed or treated for the psychotic disorder, which of the following symptoms have you experienced and how burdensome were they for you? Do not take treatment side effects into account."
data[, 167] <- factor(
  data[, 167],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "I have not had this symptom",
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[167] <- "H13_SQ017"
# LimeSurvey Field type: A
data[, 168] <- as.character(data[, 168])
attributes(data)$variable.labels[
  168
] <- "[Disorganized behavior. For example, feeling you neglect your appearance or personal hygiene, or feeling you never manage to finish what you start.] Since you have been followed or treated for the psychotic disorder, which of the following symptoms have you experienced and how burdensome were they for you? Do not take treatment side effects into account."
data[, 168] <- factor(
  data[, 168],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "I have not had this symptom",
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[168] <- "H13_SQ018"
# LimeSurvey Field type: A
data[, 169] <- as.character(data[, 169])
attributes(data)$variable.labels[
  169
] <- "[Inability to feel interest or pleasure, lack of motivation or enthusiasm, feeling that your emotions are blunted.] Since you have been followed or treated for the psychotic disorder, which of the following symptoms have you experienced and how burdensome were they for you? Do not take treatment side effects into account."
data[, 169] <- factor(
  data[, 169],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "I have not had this symptom",
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[169] <- "H13_SQ019"
# LimeSurvey Field type: A
data[, 170] <- as.character(data[, 170])
attributes(data)$variable.labels[
  170
] <- "[Social isolation, or feeling you have no interest in being with other people.] Since you have been followed or treated for the psychotic disorder, which of the following symptoms have you experienced and how burdensome were they for you? Do not take treatment side effects into account."
data[, 170] <- factor(
  data[, 170],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "I have not had this symptom",
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[170] <- "H13_SQ020"
# LimeSurvey Field type: A
data[, 171] <- as.character(data[, 171])
attributes(data)$variable.labels[
  171
] <- "[Agitation or feeling tense] Since you have been followed or treated for the psychotic disorder, which of the following symptoms have you experienced and how burdensome were they for you? Do not take treatment side effects into account."
data[, 171] <- factor(
  data[, 171],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "I have not had this symptom",
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[171] <- "H13_SQ021"
# LimeSurvey Field type: A
data[, 172] <- as.character(data[, 172])
attributes(data)$variable.labels[
  172
] <- "[Problems with concentration] Since you have been followed or treated for the psychotic disorder, which of the following symptoms have you experienced and how burdensome were they for you? Do not take treatment side effects into account."
data[, 172] <- factor(
  data[, 172],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "I have not had this symptom",
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[172] <- "H13_SQ002"
# LimeSurvey Field type: A
data[, 173] <- as.character(data[, 173])
attributes(data)$variable.labels[
  173
] <- "[Fatigue or exhaustion] Since you have been followed or treated for the psychotic disorder, which of the following symptoms have you experienced and how burdensome were they for you? Do not take treatment side effects into account."
data[, 173] <- factor(
  data[, 173],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "I have not had this symptom",
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[173] <- "H13_SQ004"
# LimeSurvey Field type: A
data[, 174] <- as.character(data[, 174])
attributes(data)$variable.labels[
  174
] <- "[Fear or anxiety] Since you have been followed or treated for the psychotic disorder, which of the following symptoms have you experienced and how burdensome were they for you? Do not take treatment side effects into account."
data[, 174] <- factor(
  data[, 174],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "I have not had this symptom",
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[174] <- "H13_SQ008"
# LimeSurvey Field type: A
data[, 175] <- as.character(data[, 175])
attributes(data)$variable.labels[
  175
] <- "[Feeling down, depressed, or sad] Since you have been followed or treated for the psychotic disorder, which of the following symptoms have you experienced and how burdensome were they for you? Do not take treatment side effects into account."
data[, 175] <- factor(
  data[, 175],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "I have not had this symptom",
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[175] <- "H13_SQ009"
# LimeSurvey Field type: A
data[, 176] <- as.character(data[, 176])
attributes(data)$variable.labels[
  176
] <- "[Stress] Since you have been followed or treated for the psychotic disorder, which of the following symptoms have you experienced and how burdensome were they for you? Do not take treatment side effects into account."
data[, 176] <- factor(
  data[, 176],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "I have not had this symptom",
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[176] <- "H13_SQ015"
# LimeSurvey Field type: A
data[, 177] <- as.character(data[, 177])
attributes(data)$variable.labels[
  177
] <- "[Self-harm behaviors or urges] Since you have been followed or treated for the psychotic disorder, which of the following symptoms have you experienced and how burdensome were they for you? Do not take treatment side effects into account."
data[, 177] <- factor(
  data[, 177],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "I have not had this symptom",
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[177] <- "H13_SQ003"
# LimeSurvey Field type: A
data[, 178] <- as.character(data[, 178])
attributes(data)$variable.labels[
  178
] <- "[Feeling that you no longer want to live] Since you have been followed or treated for the psychotic disorder, which of the following symptoms have you experienced and how burdensome were they for you? Do not take treatment side effects into account."
data[, 178] <- factor(
  data[, 178],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "I have not had this symptom",
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[178] <- "H13_SQ005"
# LimeSurvey Field type: A
data[, 179] <- as.character(data[, 179])
attributes(data)$variable.labels[
  179
] <- "[Stigma or feeling discriminated against] Since you have been followed or treated for the psychotic disorder, which of the following symptoms have you experienced and how burdensome were they for you? Do not take treatment side effects into account."
data[, 179] <- factor(
  data[, 179],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "I have not had this symptom",
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[179] <- "H13_SQ010"
# LimeSurvey Field type: A
data[, 180] <- as.character(data[, 180])
attributes(data)$variable.labels[
  180
] <- "[Loss of self-confidence] Since you have been followed or treated for the psychotic disorder, which of the following symptoms have you experienced and how burdensome were they for you? Do not take treatment side effects into account."
data[, 180] <- factor(
  data[, 180],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "I have not had this symptom",
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[180] <- "H13_SQ011"
# LimeSurvey Field type: A
data[, 181] <- as.character(data[, 181])
attributes(data)$variable.labels[
  181
] <- "[Other] Since you have been followed or treated for the psychotic disorder, which of the following symptoms have you experienced and how burdensome were they for you? Do not take treatment side effects into account."
data[, 181] <- factor(
  data[, 181],
  levels = c("A0", "A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c(
    "I have not had this symptom",
    "Not at all burdensome",
    "Slightly burdensome",
    "Moderately burdensome",
    "Very burdensome",
    "Extremely burdensome",
    "I don't know"
  )
)
names(data)[181] <- "H13_SQ022"
# LimeSurvey Field type: A
data[, 182] <- as.character(data[, 182])
attributes(data)$variable.labels[
  182
] <- "To what extent has the psychotic disorder interfered with your sexual life?"
data[, 182] <- factor(
  data[, 182],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06", "AO07", "AO08"),
  labels = c(
    "Not at all",
    "Slightly",
    "Moderately",
    "A lot",
    "Extremely",
    "I don't know",
    "Not applicable",
    "I prefer not to answer"
  )
)
names(data)[182] <- "H14"
# LimeSurvey Field type: A
data[, 183] <- as.character(data[, 183])
attributes(data)$variable.labels[
  183
] <- "To what extent has the psychotic disorder interfered with your reproductive life, i.e., with your ability or decision to conceive children naturally or to carry a pregnancy to term? For example: IVF, genetic screening, sperm/egg donation, needing to delay a pregnancy, or giving up having biological children because of the psychotic disorder."
data[, 183] <- factor(
  data[, 183],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06", "AO07", "AO08"),
  labels = c(
    "Not at all",
    "Slightly",
    "Moderately",
    "A lot",
    "Extremely",
    "I don't know",
    "Not applicable (e.g., you have not yet considered having children, or you were not affected by the disorder ",
    "I prefer not to answer"
  )
)
names(data)[183] <- "H15"
# LimeSurvey Field type: A
data[, 184] <- as.character(data[, 184])
attributes(data)$variable.labels[
  184
] <- "By ‘care’ we mean all appointments, treatments, and supports offered by health professionals to manage and improve your health related to the psychotic disorder."
names(data)[184] <- "INFO"
# LimeSurvey Field type: A
data[, 185] <- as.character(data[, 185])
attributes(data)$variable.labels[
  185
] <- "Do you consider that your care has been well organized and planned over time?"
data[, 185] <- factor(
  data[, 185],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c("Always", "Often", "Sometimes", "Rarely", "Never", "I don't know")
)
names(data)[185] <- "HC7"
# LimeSurvey Field type: A
data[, 186] <- as.character(data[, 186])
attributes(data)$variable.labels[
  186
] <- "Do you have one or more health professionals who are responsible for coordinating the different medical services you need?"
data[, 186] <- factor(
  data[, 186],
  levels = c("A1", "A2", "A3", "A4"),
  labels = c(
    "Yes",
    "No",
    "I don't know",
    "Not applicable: follow-up is only in one service, with no need for coordination"
  )
)
names(data)[186] <- "HC8"
# LimeSurvey Field type: A
data[, 187] <- as.character(data[, 187])
attributes(data)$variable.labels[
  187
] <- "To what extent do you see the same health professional(s) during your regular appointments or examinations?"
data[, 187] <- factor(
  data[, 187],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c("Always", "Often", "Sometimes", "Rarely", "Never", "I don't know")
)
names(data)[187] <- "HC9"
# LimeSurvey Field type: A
data[, 188] <- as.character(data[, 188])
attributes(data)$variable.labels[
  188
] <- "To what extent do you receive enough useful and understandable information from your health professionals?"
data[, 188] <- factor(
  data[, 188],
  levels = c("A1", "A2", "A3", "A4", "A5", "A6"),
  labels = c("Always", "Often", "Sometimes", "Rarely", "Never", "I don't know")
)
names(data)[188] <- "HC10"
# LimeSurvey Field type: A
data[, 189] <- as.character(data[, 189])
attributes(data)$variable.labels[
  189
] <- "Are you involved as much as you wish in decisions about your care or treatment?"
data[, 189] <- factor(
  data[, 189],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06", "AO07"),
  labels = c(
    "Yes, definitely",
    "Yes, to some extent",
    "No, not really",
    "No, definitely not",
    "No, but I did not want to be involved anyway",
    "Not applicable: no decisions were made about treatment",
    "I don't know"
  )
)
names(data)[189] <- "HC11"
# LimeSurvey Field type: A
data[, 190] <- as.character(data[, 190])
attributes(data)$variable.labels[
  190
] <- "In the past 12 months, was there any care for the psychotic disorder that you did not receive even though you needed it? This could be a consultation, treatment, medical tests, rehabilitation, or other."
data[, 190] <- factor(
  data[, 190],
  levels = c("A1", "A2", "A3"),
  labels = c("Yes", "No", "I don't know")
)
names(data)[190] <- "HC12"
# LimeSurvey Field type: F
data[, 191] <- as.numeric(data[, 191])
attributes(data)$variable.labels[
  191
] <- "[Distance between home and place of care] What were the main reason(s) you did not receive the care you needed?"
data[, 191] <- factor(
  data[, 191],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[191] <- "HC13_SQ001"
# LimeSurvey Field type: F
data[, 192] <- as.numeric(data[, 192])
attributes(data)$variable.labels[
  192
] <- "[Transport problem (e.g., no nearby public transport, no personal vehicle, unable to drive your own vehicle, no one to take you to your care location)] What were the main reason(s) you did not receive the care you needed?"
data[, 192] <- factor(
  data[, 192],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[192] <- "HC13_SQ002"
# LimeSurvey Field type: F
data[, 193] <- as.numeric(data[, 193])
attributes(data)$variable.labels[
  193
] <- "[Lack of qualified staff to provide the care you need] What were the main reason(s) you did not receive the care you needed?"
data[, 193] <- factor(
  data[, 193],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[193] <- "HC13_SQ003"
# LimeSurvey Field type: F
data[, 194] <- as.numeric(data[, 194])
attributes(data)$variable.labels[
  194
] <- "[Very long waiting times] What were the main reason(s) you did not receive the care you needed?"
data[, 194] <- factor(
  data[, 194],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[194] <- "HC13_SQ004"
# LimeSurvey Field type: F
data[, 195] <- as.numeric(data[, 195])
attributes(data)$variable.labels[
  195
] <- "[Difficulties paying for care] What were the main reason(s) you did not receive the care you needed?"
data[, 195] <- factor(
  data[, 195],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[195] <- "HC13_SQ005"
# LimeSurvey Field type: F
data[, 196] <- as.numeric(data[, 196])
attributes(data)$variable.labels[
  196
] <- "[Fear of medical tests, the hospital, or something else] What were the main reason(s) you did not receive the care you needed?"
data[, 196] <- factor(
  data[, 196],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[196] <- "HC13_SQ006"
# LimeSurvey Field type: F
data[, 197] <- as.numeric(data[, 197])
attributes(data)$variable.labels[
  197
] <- "[Lack of time because of work, children, or other] What were the main reason(s) you did not receive the care you needed?"
data[, 197] <- factor(
  data[, 197],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[197] <- "HC13_SQ007"
# LimeSurvey Field type: F
data[, 198] <- as.numeric(data[, 198])
attributes(data)$variable.labels[
  198
] <- "[Lack of information] What were the main reason(s) you did not receive the care you needed?"
data[, 198] <- factor(
  data[, 198],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[198] <- "HC13_SQ009"
# LimeSurvey Field type: F
data[, 199] <- as.numeric(data[, 199])
attributes(data)$variable.labels[
  199
] <- "[Language difficulties] What were the main reason(s) you did not receive the care you needed?"
data[, 199] <- factor(
  data[, 199],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[199] <- "HC13_SQ008"
# LimeSurvey Field type: A
data[, 200] <- as.character(data[, 200])
attributes(data)$variable.labels[
  200
] <- "[Other] For what main reason(s) did you not receive the care you needed?"
names(data)[200] <- "HC13_other"
# LimeSurvey Field type: A
data[, 201] <- as.character(data[, 201])
attributes(data)$variable.labels[
  201
] <- "To what extent has your schooling or studies been affected by the psychotic disorder, in terms of attendance, performance, achievement, or choice of studies?"
data[, 201] <- factor(
  data[, 201],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06", "AO07"),
  labels = c(
    "Not at all",
    "Slightly",
    "Moderately",
    "A lot",
    "Extremely",
    "I don't know",
    "Not applicable: the psychotic disorder occurred after schooling/studies were completed"
  )
)
names(data)[201] <- "S1"
# LimeSurvey Field type: A
data[, 202] <- as.character(data[, 202])
attributes(data)$variable.labels[
  202
] <- "Because of the psychotic disorder, have you reduced your working time?"
data[, 202] <- factor(
  data[, 202],
  levels = c("AO01", "AO02", "AO03", "AO04"),
  labels = c(
    "Yes, I work less than before because of my psychotic disorder",
    "Yes, I stopped working because of my psychotic disorder",
    "No, the psychotic disorder did not affect my working time",
    "I don't know"
  )
)
names(data)[202] <- "S2"
# LimeSurvey Field type: A
data[, 203] <- as.character(data[, 203])
attributes(data)$variable.labels[
  203
] <- "[Other] Because of the psychotic disorder, have you reduced your working time?"
names(data)[203] <- "S2_other"
# LimeSurvey Field type: A
data[, 204] <- as.character(data[, 204])
attributes(data)$variable.labels[
  204
] <- "Approximately how long were you unable to work because of your psychotic disorder?"
data[, 204] <- factor(
  data[, 204],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05"),
  labels = c(
    "Less than 1 month",
    "1 to 3 months",
    "4 months to 1 year",
    "More than 1 year",
    "I don't know"
  )
)
names(data)[204] <- "S3"
# LimeSurvey Field type: F
data[, 205] <- as.numeric(data[, 205])
attributes(data)$variable.labels[
  205
] <- "Please indicate approximately the number of years:"
names(data)[205] <- "S3b"
# LimeSurvey Field type: A
data[, 206] <- as.character(data[, 206])
attributes(data)$variable.labels[
  206
] <- "The next question concerns the past seven days, not including today."
names(data)[206] <- "TXT1"
# LimeSurvey Field type: F
data[, 207] <- as.numeric(data[, 207])
attributes(data)$variable.labels[
  207
] <- "[| 0 = The psychotic disorder had no effect on my work | 10 = Because of the psychotic disorder, I was not able to work at all] Over the past seven days, to what extent has the psychotic disorder affected your productivity while working? Think of days when you were limited in the amount or type of work you could do, days when you accomplished less than you would have liked, or days when you could not do your work as carefully as usual. Choose a low number if the psychotic disorder had little impact on your work. Choose a high number if it had a strong impact."
names(data)[207] <- "S4_SQ001"
# LimeSurvey Field type: A
data[, 208] <- as.character(data[, 208])
attributes(data)$variable.labels[
  208
] <- "To what extent has your psychotic disorder or medical treatment caused you financial difficulties?"
data[, 208] <- factor(
  data[, 208],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Not at all",
    "Slightly",
    "Moderately",
    "A lot",
    "Extremely",
    "I don't know"
  )
)
names(data)[208] <- "S5"
# LimeSurvey Field type: A
data[, 209] <- as.character(data[, 209])
attributes(data)$variable.labels[
  209
] <- "To what extent does your psychotic disorder interfere with your relationships with family, your partner, friends, or neighbors?"
data[, 209] <- factor(
  data[, 209],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Not at all",
    "Slightly",
    "Moderately",
    "A lot",
    "Extremely",
    "I don't know"
  )
)
names(data)[209] <- "S6"
# LimeSurvey Field type: F
data[, 210] <- as.numeric(data[, 210])
attributes(data)$variable.labels[
  210
] <- "[No additional support] Because of the psychotic disorder, what types of additional support have you needed but have not been able to obtain so far?"
data[, 210] <- factor(
  data[, 210],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[210] <- "S7_SQ001"
# LimeSurvey Field type: F
data[, 211] <- as.numeric(data[, 211])
attributes(data)$variable.labels[
  211
] <- "[Practical help (e.g., cleaning, cooking, shopping, transport, childcare)] Because of the psychotic disorder, what types of additional support have you needed but have not been able to obtain so far?"
data[, 211] <- factor(
  data[, 211],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[211] <- "S7_SQ002"
# LimeSurvey Field type: F
data[, 212] <- as.numeric(data[, 212])
attributes(data)$variable.labels[
  212
] <- "[Talking to other patients with a psychotic disorder] Because of the psychotic disorder, what types of additional support have you needed but have not been able to obtain so far?"
data[, 212] <- factor(
  data[, 212],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[212] <- "S7_SQ003"
# LimeSurvey Field type: F
data[, 213] <- as.numeric(data[, 213])
attributes(data)$variable.labels[
  213
] <- "[Psychological support] Because of the psychotic disorder, what types of additional support have you needed but have not been able to obtain so far?"
data[, 213] <- factor(
  data[, 213],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[213] <- "S7_SQ004"
# LimeSurvey Field type: F
data[, 214] <- as.numeric(data[, 214])
attributes(data)$variable.labels[
  214
] <- "[Medical support] Because of the psychotic disorder, what types of additional support have you needed but have not been able to obtain so far?"
data[, 214] <- factor(
  data[, 214],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[214] <- "S7_SQ005"
# LimeSurvey Field type: F
data[, 215] <- as.numeric(data[, 215])
attributes(data)$variable.labels[
  215
] <- "[Administrative or social assistance] Because of the psychotic disorder, what types of additional support have you needed but have not been able to obtain so far?"
data[, 215] <- factor(
  data[, 215],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[215] <- "S7_SQ006"
# LimeSurvey Field type: F
data[, 216] <- as.numeric(data[, 216])
attributes(data)$variable.labels[
  216
] <- "[Support for environmental adaptations or assistive equipment] Because of the psychotic disorder, what types of additional support have you needed but have not been able to obtain so far?"
data[, 216] <- factor(
  data[, 216],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[216] <- "S7_SQ011"
# LimeSurvey Field type: F
data[, 217] <- as.numeric(data[, 217])
attributes(data)$variable.labels[
  217
] <- "[Return-to-work support] Because of the psychotic disorder, what types of additional support have you needed but have not been able to obtain so far?"
data[, 217] <- factor(
  data[, 217],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[217] <- "S7_SQ007"
# LimeSurvey Field type: F
data[, 218] <- as.numeric(data[, 218])
attributes(data)$variable.labels[
  218
] <- "[School or study support] Because of the psychotic disorder, what types of additional support have you needed but have not been able to obtain so far?"
data[, 218] <- factor(
  data[, 218],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[218] <- "S7_SQ008"
# LimeSurvey Field type: F
data[, 219] <- as.numeric(data[, 219])
attributes(data)$variable.labels[
  219
] <- "[Spiritual or religious support] Because of the psychotic disorder, what types of additional support have you needed but have not been able to obtain so far?"
data[, 219] <- factor(
  data[, 219],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[219] <- "S7_SQ009"
# LimeSurvey Field type: F
data[, 220] <- as.numeric(data[, 220])
attributes(data)$variable.labels[
  220
] <- "[I don't know] Because of the psychotic disorder, what types of additional support have you needed but have not been able to obtain so far?"
data[, 220] <- factor(
  data[, 220],
  levels = c(1, 0),
  labels = c("Yes", "Not selected")
)
names(data)[220] <- "S7_SQ010"
# LimeSurvey Field type: A
data[, 221] <- as.character(data[, 221])
attributes(data)$variable.labels[
  221
] <- "[Other] Because of the psychotic disorder, what types of additional support have you needed but have not been able to obtain so far?"
names(data)[221] <- "S7_other"
# LimeSurvey Field type: A
data[, 222] <- as.character(data[, 222])
attributes(data)$variable.labels[
  222
] <- "[Impact of the psychotic disorder on overall quality of life (impact on mobility, self-care, ability to dress and wash independently, pain/discomfort, anxiety or depression; years lived with disability)] In your opinion, which aspects of your psychotic disorder or its management should be improved as a priority? Please rate each aspect according to the importance you give it."
data[, 222] <- factor(
  data[, 222],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Not at all a priority",
    "Slight priority",
    "Moderate priority",
    "High priority",
    "Extremely high priority",
    "I don't know"
  )
)
names(data)[222] <- "P1_SQ001"
# LimeSurvey Field type: A
data[, 223] <- as.character(data[, 223])
attributes(data)$variable.labels[
  223
] <- "[Impact on your physical health (physical symptoms, pain or discomfort related to the psychotic disorder)] In your opinion, which aspects of your psychotic disorder or its management should be improved as a priority? Please rate each aspect according to the importance you give it."
data[, 223] <- factor(
  data[, 223],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Not at all a priority",
    "Slight priority",
    "Moderate priority",
    "High priority",
    "Extremely high priority",
    "I don't know"
  )
)
names(data)[223] <- "P1_SQ002"
# LimeSurvey Field type: A
data[, 224] <- as.character(data[, 224])
attributes(data)$variable.labels[
  224
] <- "[Impact on your psychological health (psychological symptoms, anxiety, or depression related to the psychotic disorder)] In your opinion, which aspects of your psychotic disorder or its management should be improved as a priority? Please rate each aspect according to the importance you give it."
data[, 224] <- factor(
  data[, 224],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Not at all a priority",
    "Slight priority",
    "Moderate priority",
    "High priority",
    "Extremely high priority",
    "I don't know"
  )
)
names(data)[224] <- "P1_SQ003"
# LimeSurvey Field type: A
data[, 225] <- as.character(data[, 225])
attributes(data)$variable.labels[
  225
] <- "[Impact on your independence (impact on mobility, ability to wash and dress independently; ability to carry out usual activities such as work, studies, housework, family activities, or leisure)] In your opinion, which aspects of your psychotic disorder or its management should be improved as a priority? Please rate each aspect according to the importance you give it."
data[, 225] <- factor(
  data[, 225],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Not at all a priority",
    "Slight priority",
    "Moderate priority",
    "High priority",
    "Extremely high priority",
    "I don't know"
  )
)
names(data)[225] <- "P1_SQ004"
# LimeSurvey Field type: A
data[, 226] <- as.character(data[, 226])
attributes(data)$variable.labels[
  226
] <- "[Impact on your sexual and reproductive life] In your opinion, which aspects of your psychotic disorder or its management should be improved as a priority? Please rate each aspect according to the importance you give it."
data[, 226] <- factor(
  data[, 226],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Not at all a priority",
    "Slight priority",
    "Moderate priority",
    "High priority",
    "Extremely high priority",
    "I don't know"
  )
)
names(data)[226] <- "P1_SQ005"
# LimeSurvey Field type: A
data[, 227] <- as.character(data[, 227])
attributes(data)$variable.labels[
  227
] <- "[Impact on life expectancy] In your opinion, which aspects of your psychotic disorder or its management should be improved as a priority? Please rate each aspect according to the importance you give it."
data[, 227] <- factor(
  data[, 227],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Not at all a priority",
    "Slight priority",
    "Moderate priority",
    "High priority",
    "Extremely high priority",
    "I don't know"
  )
)
names(data)[227] <- "P1_SQ006"
# LimeSurvey Field type: A
data[, 228] <- as.character(data[, 228])
attributes(data)$variable.labels[
  228
] <- "[Impact on your schooling or studies] In your opinion, which aspects of your psychotic disorder or its management should be improved as a priority? Please rate each aspect according to the importance you give it."
data[, 228] <- factor(
  data[, 228],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Not at all a priority",
    "Slight priority",
    "Moderate priority",
    "High priority",
    "Extremely high priority",
    "I don't know"
  )
)
names(data)[228] <- "P1_SQ007"
# LimeSurvey Field type: A
data[, 229] <- as.character(data[, 229])
attributes(data)$variable.labels[
  229
] <- "[Impact on your work] In your opinion, which aspects of your psychotic disorder or its management should be improved as a priority? Please rate each aspect according to the importance you give it."
data[, 229] <- factor(
  data[, 229],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Not at all a priority",
    "Slight priority",
    "Moderate priority",
    "High priority",
    "Extremely high priority",
    "I don't know"
  )
)
names(data)[229] <- "P1_SQ008"
# LimeSurvey Field type: A
data[, 230] <- as.character(data[, 230])
attributes(data)$variable.labels[
  230
] <- "[Financial impact] In your opinion, which aspects of your psychotic disorder or its management should be improved as a priority? Please rate each aspect according to the importance you give it."
data[, 230] <- factor(
  data[, 230],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Not at all a priority",
    "Slight priority",
    "Moderate priority",
    "High priority",
    "Extremely high priority",
    "I don't know"
  )
)
names(data)[230] <- "P1_SQ009"
# LimeSurvey Field type: A
data[, 231] <- as.character(data[, 231])
attributes(data)$variable.labels[
  231
] <- "[Impact on your social life (relationships with family, your partner, or friends; need for additional support—administrative, social, etc.)] In your opinion, which aspects of your psychotic disorder or its management should be improved as a priority? Please rate each aspect according to the importance you give it."
data[, 231] <- factor(
  data[, 231],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Not at all a priority",
    "Slight priority",
    "Moderate priority",
    "High priority",
    "Extremely high priority",
    "I don't know"
  )
)
names(data)[231] <- "P1_SQ010"
# LimeSurvey Field type: A
data[, 232] <- as.character(data[, 232])
attributes(data)$variable.labels[
  232
] <- "[Quality of your care (speed of diagnosis, coordination and continuity of care, information received from healthcare professionals, involvement in decisions about your care or treatments)] In your opinion, which aspects of your psychotic disorder or its management should be improved as a priority? Please rate each aspect according to the importance you give it."
data[, 232] <- factor(
  data[, 232],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Not at all a priority",
    "Slight priority",
    "Moderate priority",
    "High priority",
    "Extremely high priority",
    "I don't know"
  )
)
names(data)[232] <- "P1_SQ011"
# LimeSurvey Field type: A
data[, 233] <- as.character(data[, 233])
attributes(data)$variable.labels[
  233
] <- "[Access to healthcare (obtaining care when needed, availability of treatment)] In your opinion, which aspects of your psychotic disorder or its management should be improved as a priority? Please rate each aspect according to the importance you give it."
data[, 233] <- factor(
  data[, 233],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Not at all a priority",
    "Slight priority",
    "Moderate priority",
    "High priority",
    "Extremely high priority",
    "I don't know"
  )
)
names(data)[233] <- "P1_SQ012"
# LimeSurvey Field type: A
data[, 234] <- as.character(data[, 234])
attributes(data)$variable.labels[
  234
] <- "[Scientific knowledge (e.g., regarding diagnosis, treatment, or prognosis)] In your opinion, which aspects of your psychotic disorder or its management should be improved as a priority? Please rate each aspect according to the importance you give it."
data[, 234] <- factor(
  data[, 234],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Not at all a priority",
    "Slight priority",
    "Moderate priority",
    "High priority",
    "Extremely high priority",
    "I don't know"
  )
)
names(data)[234] <- "P1_SQ013"
# LimeSurvey Field type: A
data[, 235] <- as.character(data[, 235])
attributes(data)$variable.labels[
  235
] <- "[Treatment effectiveness (ability of the treatment to control symptoms and improve quality of life)] In your opinion, which aspects of your psychotic disorder or its management should be improved as a priority? Please rate each aspect according to the importance you give it."
data[, 235] <- factor(
  data[, 235],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Not at all a priority",
    "Slight priority",
    "Moderate priority",
    "High priority",
    "Extremely high priority",
    "I don't know"
  )
)
names(data)[235] <- "P1_SQ014"
# LimeSurvey Field type: A
data[, 236] <- as.character(data[, 236])
attributes(data)$variable.labels[
  236
] <- "[Treatment burden (in terms of side effects or in terms of logistics/administration of the treatment)] In your opinion, which aspects of your psychotic disorder or its management should be improved as a priority? Please rate each aspect according to the importance you give it."
data[, 236] <- factor(
  data[, 236],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Not at all a priority",
    "Slight priority",
    "Moderate priority",
    "High priority",
    "Extremely high priority",
    "I don't know"
  )
)
names(data)[236] <- "P1_SQ015"
# LimeSurvey Field type: F
data[, 237] <- as.numeric(data[, 237])
attributes(data)$variable.labels[
  237
] <- "Would you like to tell us about any other important needs that you were not able to express in the questionnaire?"
data[, 237] <- factor(data[, 237], levels = c(1, 2), labels = c("Yes", "No"))
names(data)[237] <- "G1"

# LimeSurvey Field type: A
data[, 238] <- as.character(data[, 238])
attributes(data)$variable.labels[
  238
] <- "Which needs were not addressed in the questionnaire?"
names(data)[238] <- "G2"
# LimeSurvey Field type: F
data[, 239] <- as.numeric(data[, 239])
attributes(data)$variable.labels[
  239
] <- "As the person completing the questionnaire for someone with a psychotic disorder: do you consider yourself an 'informal caregiver'? That is, someone who helps this person because of their psychotic disorder, on a regular basis and not as a professional. For example, a parent helping their child, or a family member or friend helping a loved one."
data[, 239] <- factor(data[, 239], levels = c(1, 2), labels = c("Yes", "No"))
names(data)[239] <- "CG1"
# LimeSurvey Field type: A
data[, 240] <- as.character(data[, 240])
attributes(data)$variable.labels[
  240
] <- "In relation to the person you help, you are:"
data[, 240] <- factor(
  data[, 240],
  levels = c("AO01", "AO02"),
  labels = c(
    "A family member (e.g., parent, child, grandparent...)",
    "A close relation (e.g., friend, neighbor...)"
  )
)
names(data)[240] <- "CG2"
# LimeSurvey Field type: A
data[, 241] <- as.character(data[, 241])
attributes(data)$variable.labels[
  241
] <- "[Other] In relation to the person you help, you are:"
names(data)[241] <- "CG2_other"
# LimeSurvey Field type: A
data[, 242] <- as.character(data[, 242])
attributes(data)$variable.labels[242] <- "Which gender do you identify with?"
data[, 242] <- factor(
  data[, 242],
  levels = c("AO01", "AO02", "AO03"),
  labels = c("Man", "Woman", "Other")
)
names(data)[242] <- "CG3"
# LimeSurvey Field type: F
data[, 243] <- as.numeric(data[, 243])
attributes(data)$variable.labels[243] <- "What is your year of birth?"
names(data)[243] <- "CG4"
# LimeSurvey Field type: F
data[, 244] <- as.numeric(data[, 244])
attributes(data)$variable.labels[
  244
] <- "Last week, how much time did you spend helping the person with activities they would normally have done themselves if they were in good health? For example, personal care (such as dressing/undressing, going to the toilet), household tasks (such as preparing meals, cleaning), or practical support (such as accompanying them to medical or other appointments)."
names(data)[244] <- "CG5"
# LimeSurvey Field type: A
data[, 245] <- as.character(data[, 245])
attributes(data)$variable.labels[
  245
] <- "In your opinion, to what extent is your physical and/or mental health impacted because of your role as an informal caregiver?"
data[, 245] <- factor(
  data[, 245],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Not at all",
    "Slightly",
    "Moderately",
    "A lot",
    "Extremely",
    "I don't know"
  )
)
names(data)[245] <- "CG6"
# LimeSurvey Field type: A
data[, 246] <- as.character(data[, 246])
attributes(data)$variable.labels[
  246
] <- "In your opinion, to what extent is your social life impacted because of your role as an informal caregiver?"
data[, 246] <- factor(
  data[, 246],
  levels = c("AO01", "AO02", "AO03", "AO04", "AO05", "AO06"),
  labels = c(
    "Not at all",
    "Slightly",
    "Moderately",
    "A lot",
    "Extremely",
    "I don't know"
  )
)
names(data)[246] <- "CG7"
# LimeSurvey Field type: F
data[, 247] <- as.numeric(data[, 247])
attributes(data)$variable.labels[
  247
] <- "We would like to know more about the needs and difficulties you experience or have experienced in the context of your psychotic disorder. If you wish, you can take part in an individual interview (online or face-to-face with a researcher) to discuss your experiences and needs in more detail. This interview will be conducted confidentially and independently of the care you receive from healthcare providers. We plan to interview 24 patients. This individual interview will last about an hour and a half. Would you like to take part in an individual interview?"
data[, 247] <- factor(data[, 247], levels = c(1, 2), labels = c("Yes", "No"))
names(data)[247] <- "Follow"
# # LimeSurvey Field type: A
# data[, 248] <- as.character(data[, 248])
# attributes(data)$variable.labels[
#   248
# ] <- "[Email address] If you are interested in the individual interview, please provide your contact details (phone number and email address) so that we can contact you."
# names(data)[248] <- "NOM_Email"
# # LimeSurvey Field type: A
# data[, 249] <- as.character(data[, 249])
# attributes(data)$variable.labels[
#   249
# ] <- "[Confirm email address] If you are interested in the individual interview, please provide your contact details (phone number and email address) so that we can contact you."
# names(data)[249] <- "NOM_Cemail"
# # LimeSurvey Field type: A
# data[, 250] <- as.character(data[, 250])
# attributes(data)$variable.labels[
#   250
# ] <- "[Mobile phone number] If you are interested in the individual interview, please provide your contact details (phone number and email address) so that we can contact you."
# names(data)[250] <- "NOM_GSM1"
# # LimeSurvey Field type: A
# data[, 251] <- as.character(data[, 251])
# attributes(data)$variable.labels[
#   251
# ] <- "Thank you very much for your cooperation! A member of the research team will contact you within a few weeks to inform you about your possible participation in an interview."
# names(data)[251] <- "TXS"

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
  sheetName = "EN",
  somearg = TRUE
)

# Define included/excluded patients ----------------------------------------------

data <- data |>
  mutate(included = as.integer(lastpage == 16), .after = id)

# Load exclusion IDs
excl <- readxl::read_excel(
  "data/raw/20250918_Inclusion and exclusion.xlsx",
  sheet = "To be excluded",
  skip = 1
)
excl_id <- excl$ID

# Load inclusion IDS
incl <- readxl::read_excel(
  "data/raw/20250918_Inclusion and exclusion.xlsx",
  sheet = "Extra inclusions",
  skip = 1
)
incl_id <- incl$ID

# Modify data accordingly
data <- data |>
  mutate(
    included = case_when(
      id %in% excl_id ~ 0L,
      id %in% incl_id ~ 1L,
      TRUE ~ included
    )
  )

# Redefine wrong diagnoses -------------------------------------------------------

diag <- readxl::read_excel(
  "data/raw/20250918_Inclusion and exclusion.xlsx",
  sheet = "Changes to be made",
  skip = 1
)
for (i in seq_len(nrow(diag))) {
  col <- diag$`Associated variable`[i]
  id <- diag$ID[i]
  data[data$id == id, col] <- 1
}

# # UNCOMMENT to check changes
# data |>
#   filter(id %in% diag$ID) |>
#   select(id, starts_with("DSD1_A"))

# Save data ----------------------------------------------------------------------

saveRDS(data, here("data", "processed", "data_en.rds"))
