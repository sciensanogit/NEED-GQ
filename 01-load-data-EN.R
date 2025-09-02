data <- read.csv("data/survey_632819_R_data_file.csv", quote = "'\"", na.strings=c("", "\"\""), stringsAsFactors=FALSE, fileEncoding="UTF-8-BOM")

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
attributes(data)$variable.labels[8] <- "You are completing this questionnaire"
data[, 8] <- factor(data[, 8], levels=c(1,2),
                    labels=c("For yourself",
                             "For another adult (the person you represent is not able to answer the questionnaire at the moment)."))
names(data)[8] <- "D1"

# LimeSurvey Field type: A
data[, 9] <- as.character(data[, 9])
attributes(data)$variable.labels[9] <- "From now on, please answer all questions as if you were the person with the disease. Indicate \"I don't know\" if you do not know how the person would answer."
names(data)[9] <- "D1b"

# LimeSurvey Field type: A
data[, 10] <- as.character(data[, 10])
attributes(data)$variable.labels[10] <- "Which gender do you identify with?"
data[, 10] <- factor(data[, 10], levels=c("A1","A2","A3"),
                     labels=c("Man", "Woman", "Other"))
names(data)[10] <- "D2"

# LimeSurvey Field type: F
data[, 11] <- as.numeric(data[, 11])
attributes(data)$variable.labels[11] <- "What is your year of birth?"
names(data)[11] <- "D3"

# LimeSurvey Field type: F
data[, 12] <- as.numeric(data[, 12])
attributes(data)$variable.labels[12] <- "In which province do you live?"
data[, 12] <- factor(data[, 12], levels=c(001,002,003,004,005,006,007,008,009,010,011,012,013),
                     labels=c("Antwerp", "Walloon Brabant", "Brussels", "Hainaut", "Liège", "Limburg", "Luxembourg", "Namur",
                              "East Flanders", "Flemish Brabant", "West Flanders", "I do not live in Belgium", "I don't know"))
names(data)[12] <- "D4"

# LimeSurvey Field type: A
data[, 13] <- as.character(data[, 13])
attributes(data)$variable.labels[13] <- "Thank you very much for completing this questionnaire. Unfortunately, you do not meet the conditions to continue this study. If you are interested in the results, they will be published on the website [website] [when]."
names(data)[13] <- "END1"

# LimeSurvey Field type: A
data[, 14] <- as.character(data[, 14])
attributes(data)$variable.labels[14] <- "What is the highest diploma or level of education you have obtained so far?"
data[, 14] <- factor(data[, 14], levels=c("001","002","003","004","005","006","008"),
                     labels=c("No diploma or primary education", "Lower secondary education", "Upper secondary education",
                              "Short-cycle higher education (e.g., Bachelor)", "Long-cycle higher education (e.g., Master)", "Doctorate", "I don't know"))
names(data)[14] <- "D5"

# LimeSurvey Field type: A
data[, 15] <- as.character(data[, 15])
attributes(data)$variable.labels[15] <- "[Other] What is the highest diploma or level of education you have obtained so far?"
names(data)[15] <- "D5_other"

# LimeSurvey Field type: F
data[, 16] <- as.numeric(data[, 16])
attributes(data)$variable.labels[16] <- "[Alone] You live…"
data[, 16] <- factor(data[, 16], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[16] <- "D6_SQ001"

# LimeSurvey Field type: F
data[, 17] <- as.numeric(data[, 17])
attributes(data)$variable.labels[17] <- "[Alone with child(ren)] You live…"
data[, 17] <- factor(data[, 17], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[17] <- "D6_SQ002"

# LimeSurvey Field type: F
data[, 18] <- as.numeric(data[, 18])
attributes(data)$variable.labels[18] <- "[With a partner (no children)] You live…"
data[, 18] <- factor(data[, 18], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[18] <- "D6_SQ003"

# LimeSurvey Field type: F
data[, 19] <- as.numeric(data[, 19])
attributes(data)$variable.labels[19] <- "[With a partner (with children)] You live…"
data[, 19] <- factor(data[, 19], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[19] <- "D6_SQ004"

# LimeSurvey Field type: F
data[, 20] <- as.numeric(data[, 20])
attributes(data)$variable.labels[20] <- "[With one or two parents] You live…"
data[, 20] <- factor(data[, 20], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[20] <- "D6_SQ005"

# LimeSurvey Field type: F
data[, 21] <- as.numeric(data[, 21])
attributes(data)$variable.labels[21] <- "[In a shared household or co-housing] You live…"
data[, 21] <- factor(data[, 21], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[21] <- "D6_SQ006"

# LimeSurvey Field type: F
data[, 22] <- as.numeric(data[, 22])
attributes(data)$variable.labels[22] <- "[In a nursing home] You live…"
data[, 22] <- factor(data[, 22], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[22] <- "D6_SQ007"

# LimeSurvey Field type: F
data[, 23] <- as.numeric(data[, 23])
attributes(data)$variable.labels[23] <- "[I don't know] You live…"
data[, 23] <- factor(data[, 23], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[23] <- "D6_SQ008"

# LimeSurvey Field type: A
data[, 24] <- as.character(data[, 24])
attributes(data)$variable.labels[24] <- "[Other] You live…"
names(data)[24] <- "D6_other"

# LimeSurvey Field type: F
data[, 25] <- as.numeric(data[, 25])
attributes(data)$variable.labels[25] <- "What is your country of birth?"
data[, 25] <- factor(data[, 25], levels=c(001,002,003),labels=c("Belgium", "Another country", "I don't know"))
names(data)[25] <- "D7"

# --- Country selection (coded A1..A235) ---
# Convert to character first
data[, 26] <- as.character(data[, 26])

# Set variable label
attributes(data)$variable.labels[26] <- "Select the relevant country"

# Define the country codes (A1 to A235)
country_codes <- paste0("A", 1:235)

# Define country labels (English)
country_labels <- c(
  "Afghanistan", "South Africa", "Albania", "Algeria", "Germany", "Andorra", "Angola", "Anguilla", "Antarctica",
  "Antigua and Barbuda", "Saudi Arabia", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan",
  "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belize", "Benin", "Bermuda", "Bhutan", "Belarus", "Bolivia",
  "Bonaire", "Bosnia and Herzegovina", "Botswana", "Brazil", "Brunei", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia",
  "Cameroon", "Canada", "Cabo Verde", "Chile", "China", "Cyprus", "Colombia", "Comoros", "Congo (Brazzaville)",
  "Congo (Democratic Republic)", "North Korea", "South Korea (Republic of Korea)", "Costa Rica",
  "Côte d'Ivoire", "Croatia", "Cuba", "Curaçao", "Denmark and Faroe Islands", "Djibouti", "Dominica", "Egypt",
  "El Salvador", "United Arab Emirates", "Ecuador", "Eritrea", "Spain and Canary Islands", "Estonia",
  "Eswatini (Swaziland)", "United States of America", "Ethiopia", "Fiji", "Finland", "France", "Gabon", "Gambia",
  "Georgia", "Ghana", "Gibraltar", "Greece", "Grenada", "Greenland", "Guadeloupe", "Guam", "Guatemala", "Guinea-Bissau",
  "Guinea (Conakry)", "Equatorial Guinea", "Guyana", "French Guiana", "Haiti", "Honduras",
  "Hong Kong", "Hungary", "Christmas Island", "Cayman Islands", "Cook Islands", "Falkland Islands", "Marshall Islands",
  "Solomon Islands", "U.S. Virgin Islands", "British Virgin Islands", "India", "Indonesia", "Iraq", "Iran",
  "Ireland", "Iceland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kyrgyzstan",
  "Kiribati", "Kosovo", "Kuwait", "Laos", "Lesotho", "Latvia", "Lebanon", "Liberia", "Libya", "Liechtenstein",
  "Lithuania", "Luxembourg", "Macao (China)", "North Macedonia", "Madagascar", "Malaysia", "Malawi", "Maldives",
  "Mali", "Malta", "Northern Mariana Islands (U.S.)", "Morocco", "Martinique", "Mauritius", "Mauritania", "Mayotte",
  "Mexico", "Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro", "Montserrat (UK)", "Mozambique",
  "Myanmar", "Namibia", "Nauru", "Nepal", "Nicaragua", "Niger", "Nigeria", "Niue", "Norway", "New Caledonia",
  "New Zealand", "Oman", "Uganda", "Uzbekistan", "Pakistan", "Palau", "Palestine", "Panama",
  "Papua New Guinea", "Paraguay", "Netherlands", "Peru", "Philippines", "Pitcairn", "Poland",
  "French Polynesia", "Puerto Rico", "Portugal, Azores, Madeira", "Qatar", "Central African Republic",
  "Dominican Republic", "Czech Republic", "Réunion", "Romania", "United Kingdom", "Russia", "Rwanda",
  "Western Sahara", "Saint Barthélemy", "Saint Kitts and Nevis", "Sint Eustatius and Saba", "San Marino",
  "Saint Martin (France)", "Sint Maarten (Netherlands)", "Saint Pierre and Miquelon",
  "Saint Vincent and the Grenadines", "Saint Helena - Tristan da Cunha - Ascension", "Saint Lucia", "Samoa",
  "American Samoa", "Sao Tome and Principe", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore",
  "Slovakia", "Slovenia", "Somalia", "Sudan", "South Sudan", "Sri Lanka", "Sweden", "Switzerland", "Suriname", "Syria",
  "Tajikistan", "Taiwan", "Tanzania", "Chad", "Thailand", "Timor-Leste", "Togo", "Tokelau (New Zealand)",
  "Tonga", "Trinidad and Tobago", "Tunisia", "Turkmenistan", "Turks and Caicos Islands (UK)", "Turkey", "Tuvalu",
  "Ukraine", "Uruguay", "Vanuatu", "Venezuela", "Vietnam", "Wallis and Futuna", "Yemen", "Zambia", "Zimbabwe"
)

# Reassign as factor
data[, 26] <- factor(data[, 26], levels = country_codes, labels = country_labels)

# Rename the column
names(data)[26] <- "D8"

# LimeSurvey Field type: A
data[, 27] <- as.character(data[, 27])
attributes(data)$variable.labels[27] <- "[Other] Select the relevant country"
names(data)[27] <- "D8_other"

# LimeSurvey Field type: A
data[, 28] <- as.character(data[, 28])
attributes(data)$variable.labels[28] <- "What was your main employment status just before (the onset of) your [disease]?"
data[, 28] <- factor(data[, 28], levels=c("001","002","003","004","005","006","008"),
                     labels=c("Employee or self-employed (paid work)","Job seeker / unemployed / social welfare",
                              "Homemaker, without income","Student","Retired","Disability","I don't know"))
names(data)[28] <- "D9"

# LimeSurvey Field type: A
data[, 29] <- as.character(data[, 29])
attributes(data)$variable.labels[29] <- "[Other] What was your main employment status just before (the onset of) your [disease]?"
names(data)[29] <- "D9_other"

# LimeSurvey Field type: F
data[, 30] <- as.numeric(data[, 30])
attributes(data)$variable.labels[30] <- "Since the onset of your first symptoms, have you had paid employment?"
data[, 30] <- factor(data[, 30], levels=c(001,002,003),labels=c("Yes", "No", "I don't know"))
names(data)[30] <- "D10"

# LimeSurvey Field type: A
data[, 31] <- as.character(data[, 31])
attributes(data)$variable.labels[31] <- "What is your current main employment status?"
data[, 31] <- factor(data[, 31], levels=c("A1","A2","A3","A4","A5","A6","A8"),
                     labels=c("Paid work (employee or self-employed)","Job seeker / unemployed / social welfare",
                              "Homemaker, without income","Student","Retired","Disability","I don't know"))
names(data)[31] <- "D11"

# LimeSurvey Field type: A
data[, 32] <- as.character(data[, 32])
attributes(data)$variable.labels[32] <- "[Other] What is your current main employment status?"
names(data)[32] <- "D11_other"

# LimeSurvey Field type: F
data[, 33] <- as.numeric(data[, 33])
attributes(data)$variable.labels[33] <- "Considering all household income, how easy or difficult is it for you to make ends meet at the end of each month?"
data[, 33] <- factor(data[, 33], levels=c(001,002,003,004,005,006,007),
                     labels=c("Very easily","Easily","Fairly easily","With some difficulty","With difficulty","With great difficulty","I don't know"))
names(data)[33] <- "D12"

# LimeSurvey Field type: F
data[, 34] <- as.numeric(data[, 34])
attributes(data)$variable.labels[34] <- "Approximately how long ago did you receive the diagnosis of [the disease]?"
data[, 34] <- factor(data[, 34], levels=c(001,002,003,004,005,006,007,008,009),
                     labels=c("Less than 2 months","2 to 6 months","6 months to 2 years","2 to 5 years","5 to 10 years",
                              "More than 10 years","I don't know","I have not received a physician-made diagnosis","009"))
names(data)[34] <- "D13"

# LimeSurvey Field type: F
data[, 35] <- as.numeric(data[, 35])
attributes(data)$variable.labels[35] <- "Indicate approximately the number of years:"
names(data)[35] <- "D13b"

# LimeSurvey Field type: A
data[, 36] <- as.character(data[, 36])
attributes(data)$variable.labels[36] <- "Thank you very much for completing this questionnaire. Unfortunately, you do not meet the conditions to continue this study. If you are interested in the results, they will be published on the website [website] [when]."
names(data)[36] <- "END2"

# LimeSurvey Field type: F
data[, 37] <- as.numeric(data[, 37])
attributes(data)$variable.labels[37] <- "How much time passed between your first medical appointment for [the disease] and the diagnosis?"
data[, 37] <- factor(data[, 37], levels=c(001,002,003,004,005),
                     labels=c("Less than 2 weeks","Between 2 weeks and 2 months","Between 2 months and 1 year","More than 1 year","I don't know"))
names(data)[37] <- "HC1"

# LimeSurvey Field type: F
data[, 38] <- as.numeric(data[, 38])
attributes(data)$variable.labels[38] <- "Have you ever been hospitalized because of [the disease]? Consider only hospitalizations with overnight stay(s)."
data[, 38] <- factor(data[, 38], levels=c(001,002,003),labels=c("Yes", "No", "I don't know"))
names(data)[38] <- "DSD1"

# LimeSurvey Field type: A
data[, 39] <- as.character(data[, 39])
attributes(data)$variable.labels[39] <- "[[Condition / problem 1]] Do you suffer from one or more of the following health problems that may be associated with [the disease]?"
data[, 39] <- factor(data[, 39], levels=c("A1","A2","A3"),labels=c("Yes", "No", "I don't know"))
names(data)[39] <- "DSD2_001"

# LimeSurvey Field type: A
data[, 40] <- as.character(data[, 40])
attributes(data)$variable.labels[40] <- "[[Condition / problem 2]] Do you suffer from one or more of the following health problems that may be associated with [the disease]?"
data[, 40] <- factor(data[, 40], levels=c("A1","A2","A3"),labels=c("Yes", "No", "I don't know"))
names(data)[40] <- "DSD2_002"

# LimeSurvey Field type: A
data[, 41] <- as.character(data[, 41])
attributes(data)$variable.labels[41] <- "[[Condition / problem 3]] Do you suffer from one or more of the following health problems that may be associated with [the disease]?"
data[, 41] <- factor(data[, 41], levels=c("A1","A2","A3"),labels=c("Yes", "No", "I don't know"))
names(data)[41] <- "DSD2_003"

# LimeSurvey Field type: A
data[, 42] <- as.character(data[, 42])
attributes(data)$variable.labels[42] <- "[[Etc.]] Do you suffer from one or more of the following health problems that may be associated with [the disease]?"
data[, 42] <- factor(data[, 42], levels=c("A1","A2","A3"),labels=c("Yes", "No", "I don't know"))
names(data)[42] <- "DSD2_004"

# LimeSurvey Field type: A
data[, 43] <- as.character(data[, 43])
attributes(data)$variable.labels[43] <- "Do you also suffer from any other health problem(s)?"
data[, 43] <- factor(data[, 43], levels=c("A1","A2","A3"),labels=c("Yes", "No", "I don't know"))
names(data)[43] <- "D14"

# LimeSurvey Field type: F
data[, 44] <- as.numeric(data[, 44])
attributes(data)$variable.labels[44] <- "[Heart or blood vessel disease] Which other health problems do you suffer from? You may tick several boxes. Please also indicate the exact name of your health problem(s) if you know it/them. If you do not (yet) know the diagnosis of your other health problem, tick “other health problem without known diagnosis”."
data[, 44] <- factor(data[, 44], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[44] <- "D15_2"

# LimeSurvey Field type: A
data[, 45] <- as.character(data[, 45])
attributes(data)$variable.labels[45] <- "[Comment] [Heart or blood vessel disease] Which other health problems do you suffer from? ..."
names(data)[45] <- "D15_2comment"

# LimeSurvey Field type: F
data[, 46] <- as.numeric(data[, 46])
attributes(data)$variable.labels[46] <- "[Respiratory system disease] Which other health problems do you suffer from? ..."
data[, 46] <- factor(data[, 46], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[46] <- "D15_3"

# LimeSurvey Field type: A
data[, 47] <- as.character(data[, 47])
attributes(data)$variable.labels[47] <- "[Comment] [Respiratory system disease] Which other health problems do you suffer from? ..."
names(data)[47] <- "D15_3comment"

# LimeSurvey Field type: F
data[, 48] <- as.numeric(data[, 48])
attributes(data)$variable.labels[48] <- "[Digestive system disease] Which other health problems do you suffer from? ..."
data[, 48] <- factor(data[, 48], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[48] <- "D15_4"

# LimeSurvey Field type: A
data[, 49] <- as.character(data[, 49])
attributes(data)$variable.labels[49] <- "[Comment] [Digestive system disease] Which other health problems do you suffer from? ..."
names(data)[49] <- "D15_4comment"

# LimeSurvey Field type: F
data[, 50] <- as.numeric(data[, 50])
attributes(data)$variable.labels[50] <- "[Skin disease] Which other health problems do you suffer from? ..."
data[, 50] <- factor(data[, 50], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[50] <- "D15_5"

# LimeSurvey Field type: A
data[, 51] <- as.character(data[, 51])
attributes(data)$variable.labels[51] <- "[Comment] [Skin disease] Which other health problems do you suffer from? ..."
names(data)[51] <- "D15_5comment"

# LimeSurvey Field type: F
data[, 52] <- as.numeric(data[, 52])
attributes(data)$variable.labels[52] <- "[Disease of bones, joints, or muscles] Which other health problems do you suffer from? ..."
data[, 52] <- factor(data[, 52], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[52] <- "D15_6"

# LimeSurvey Field type: A
data[, 53] <- as.character(data[, 53])
attributes(data)$variable.labels[53] <- "[Comment] [Disease of bones, joints, or muscles] Which other health problems do you suffer from? ..."
names(data)[53] <- "D15_6comment"

# LimeSurvey Field type: F
data[, 54] <- as.numeric(data[, 54])
attributes(data)$variable.labels[54] <- "[Mental or psychological disorder] Which other health problems do you suffer from? ..."
data[, 54] <- factor(data[, 54], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[54] <- "D15_7"

# LimeSurvey Field type: A
data[, 55] <- as.character(data[, 55])
attributes(data)$variable.labels[55] <- "[Comment] [Mental or psychological disorder] Which other health problems do you suffer from? ..."
names(data)[55] <- "D15_7comment"

# LimeSurvey Field type: F
data[, 56] <- as.numeric(data[, 56])
attributes(data)$variable.labels[56] <- "[Blood disease (hematologic)] Which other health problems do you suffer from? ..."
data[, 56] <- factor(data[, 56], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[56] <- "D15_8"

# LimeSurvey Field type: A
data[, 57] <- as.character(data[, 57])
attributes(data)$variable.labels[57] <- "[Comment] [Blood disease (hematologic)] Which other health problems do you suffer from? ..."
names(data)[57] <- "D15_8comment"

# LimeSurvey Field type: F
data[, 58] <- as.numeric(data[, 58])
attributes(data)$variable.labels[58] <- "[Immune disease] Which other health problems do you suffer from? ..."
data[, 58] <- factor(data[, 58], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[58] <- "D15_9"

# LimeSurvey Field type: A
data[, 59] <- as.character(data[, 59])
attributes(data)$variable.labels[59] <- "[Comment] [Immune disease] Which other health problems do you suffer from? ..."
names(data)[59] <- "D15_9comment"

# LimeSurvey Field type: F
data[, 60] <- as.numeric(data[, 60])
attributes(data)$variable.labels[60] <- "[Endocrine, nutritional, or metabolic disease] Which other health problems do you suffer from? ..."
data[, 60] <- factor(data[, 60], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[60] <- "D15_10"

# LimeSurvey Field type: A
data[, 61] <- as.character(data[, 61])
attributes(data)$variable.labels[61] <- "[Comment] [Endocrine, nutritional, or metabolic disease] Which other health problems do you suffer from? ..."
names(data)[61] <- "D15_10comment"

# LimeSurvey Field type: F
data[, 62] <- as.numeric(data[, 62])
attributes(data)$variable.labels[62] <- "[Nervous system (neurological) disease] Which other health problems do you suffer from? ..."
data[, 62] <- factor(data[, 62], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[62] <- "D15_11"

# LimeSurvey Field type: A
data[, 63] <- as.character(data[, 63])
attributes(data)$variable.labels[63] <- "[Comment] [Nervous system (neurological) disease] Which other health problems do you suffer from? ..."
names(data)[63] <- "D15_11comment"

# LimeSurvey Field type: F
data[, 64] <- as.numeric(data[, 64])
attributes(data)$variable.labels[64] <- "[Eye disease] Which other health problems do you suffer from? ..."
data[, 64] <- factor(data[, 64], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[64] <- "D15_12"

# LimeSurvey Field type: A
data[, 65] <- as.character(data[, 65])
attributes(data)$variable.labels[65] <- "[Comment] [Eye disease] Which other health problems do you suffer from? ..."
names(data)[65] <- "D15_12comment"

# LimeSurvey Field type: F
data[, 66] <- as.numeric(data[, 66])
attributes(data)$variable.labels[66] <- "[Ear or vestibular system disease] Which other health problems do you suffer from? ..."
data[, 66] <- factor(data[, 66], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[66] <- "D15_13"

# LimeSurvey Field type: A
data[, 67] <- as.character(data[, 67])
attributes(data)$variable.labels[67] <- "[Comment] [Ear or vestibular system disease] Which other health problems do you suffer from? ..."
names(data)[67] <- "D15_13comment"

# LimeSurvey Field type: F
data[, 68] <- as.numeric(data[, 68])
attributes(data)$variable.labels[68] <- "[Disease of the reproductive organs or urinary system (e.g., bladder, kidneys)] Which other health problems do you suffer from? ..."
data[, 68] <- factor(data[, 68], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[68] <- "D15_14"

# LimeSurvey Field type: A
data[, 69] <- as.character(data[, 69])
attributes(data)$variable.labels[69] <- "[Comment] [Disease of the reproductive organs or urinary system (e.g., bladder, kidneys)] Which other health problems do you suffer from? ..."
names(data)[69] <- "D15_14comment"

# LimeSurvey Field type: F
data[, 70] <- as.numeric(data[, 70])
attributes(data)$variable.labels[70] <- "[Disease affecting multiple systems] Which other health problems do you suffer from? ..."
data[, 70] <- factor(data[, 70], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[70] <- "D15_15"

# LimeSurvey Field type: A
data[, 71] <- as.character(data[, 71])
attributes(data)$variable.labels[71] <- "[Comment] [Disease affecting multiple systems] Which other health problems do you suffer from? ..."
names(data)[71] <- "D15_15comment"

# LimeSurvey Field type: F
data[, 72] <- as.numeric(data[, 72])
attributes(data)$variable.labels[72] <- "[Other health problem without known diagnosis] Which other health problems do you suffer from? ..."
data[, 72] <- factor(data[, 72], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[72] <- "D15_1"

# LimeSurvey Field type: A
data[, 73] <- as.character(data[, 73])
attributes(data)$variable.labels[73] <- "[Comment] [Other health problem without known diagnosis] Which other health problems do you suffer from? ..."
names(data)[73] <- "D15_1comment"

# LimeSurvey Field type: F
data[, 74] <- as.numeric(data[, 74])
attributes(data)$variable.labels[74] <- "[I don't know] Which other health problems do you suffer from? ..."
data[, 74] <- factor(data[, 74], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[74] <- "D15_16"

# LimeSurvey Field type: A
data[, 75] <- as.character(data[, 75])
attributes(data)$variable.labels[75] <- "[Comment] [I don't know] Which other health problems do you suffer from? ..."
names(data)[75] <- "D15_16comment"

# LimeSurvey Field type: A
data[, 76] <- as.character(data[, 76])
attributes(data)$variable.labels[76] <- "[Other] Which other health problems do you suffer from? ..."
names(data)[76] <- "D15_other"

# LimeSurvey Field type: A
data[, 77] <- as.character(data[, 77])
attributes(data)$variable.labels[77] <- "[Comment for Other] Which other health problems do you suffer from? ..."
names(data)[77] <- "D15_othercomment"

# LimeSurvey Field type: F
data[, 78] <- as.numeric(data[, 78])
attributes(data)$variable.labels[78] <- "Your mobility before your first symptoms of [the disease]"
data[, 78] <- factor(data[, 78], levels=c(001,002,003,004,005,006),
                     labels=c("I had no problems walking","I had slight problems walking","I had moderate problems walking",
                              "I had severe problems walking","I was unable to walk","I don't know"))
names(data)[78] <- "H1"

# LimeSurvey Field type: F
data[, 79] <- as.numeric(data[, 79])
attributes(data)$variable.labels[79] <- "Your self-care before your first symptoms of [the disease]"
data[, 79] <- factor(data[, 79], levels=c(001,002,003,004,005,006),
                     labels=c("I had no problems washing or dressing myself","I had slight problems washing or dressing myself",
                              "I had moderate problems washing or dressing myself","I had severe problems washing or dressing myself",
                              "I was unable to wash or dress myself","I don't know"))
names(data)[79] <- "H2"

# LimeSurvey Field type: F
data[, 80] <- as.numeric(data[, 80])
attributes(data)$variable.labels[80] <- "Your usual activities before your first symptoms of [the disease] (e.g., work, study, housework, family or leisure activities)"
data[, 80] <- factor(data[, 80], levels=c(001,002,003,004,005,006),
                     labels=c("I had no problems doing my usual activities","I had slight problems doing my usual activities",
                              "I had moderate problems doing my usual activities","I had severe problems doing my usual activities",
                              "I was unable to do my usual activities","I don't know"))
names(data)[80] <- "H3"

# LimeSurvey Field type: F
data[, 81] <- as.numeric(data[, 81])
attributes(data)$variable.labels[81] <- "Your pain or discomfort before your first symptoms of [the disease]"
data[, 81] <- factor(data[, 81], levels=c(001,002,003,004,005,006),
                     labels=c("I had no pain or discomfort","I had slight pain or discomfort","I had moderate pain or discomfort",
                              "I had severe pain or discomfort","I had extreme pain or discomfort","I don't know"))
names(data)[81] <- "H4"

# LimeSurvey Field type: F
data[, 82] <- as.numeric(data[, 82])
attributes(data)$variable.labels[82] <- "Your anxiety or depression before your first symptoms of [the disease]"
data[, 82] <- factor(data[, 82], levels=c(001,002,003,004,005,006),
                     labels=c("I was neither anxious nor depressed","I was slightly anxious or depressed","I was moderately anxious or depressed",
                              "I was severely anxious or depressed","I was extremely anxious or depressed","I don't know"))
names(data)[82] <- "H5"

# LimeSurvey Field type: F
data[, 83] <- as.numeric(data[, 83])
attributes(data)$variable.labels[83] <- "We would like to know how good or bad your health was BEFORE your first symptoms of [the disease] on a scale from 0 to 100. 100 means the best health you can imagine; 0 means the worst health you can imagine. Please enter a number between 0 and 100 to indicate your health BEFORE your first symptoms of [the disease]."
names(data)[83] <- "H6"

# LimeSurvey Field type: A
data[, 84] <- as.character(data[, 84])
attributes(data)$variable.labels[84] <- "We would like to know your current health state as you experience it today. Please tick the statement that best describes your health TODAY."
names(data)[84] <- "TXT"

# LimeSurvey Field type: A
data[, 85] <- as.character(data[, 85])
attributes(data)$variable.labels[85] <- "Your mobility today"
data[, 85] <- factor(data[, 85], levels=c("Jena1","Jena2","Jena3","Jena4","Jena5","Jena6"),
                     labels=c("I have no problems walking","I have slight problems walking","I have moderate problems walking",
                              "I have severe problems walking","I am unable to walk","I don't know"))
names(data)[85] <- "H7"

# LimeSurvey Field type: F
data[, 86] <- as.numeric(data[, 86])
attributes(data)$variable.labels[86] <- "Your self-care today"
data[, 86] <- factor(data[, 86], levels=c(001,002,003,004,005,006),
                     labels=c("I have no problems washing or dressing myself","I have slight problems washing or dressing myself",
                              "I have moderate problems washing or dressing myself","I have severe problems washing or dressing myself",
                              "I am unable to wash or dress myself","I don't know"))
names(data)[86] <- "H8"

# LimeSurvey Field type: F
data[, 87] <- as.numeric(data[, 87])
attributes(data)$variable.labels[87] <- "Your usual activities today (e.g., work, study, housework, family or leisure activities)"
data[, 87] <- factor(data[, 87], levels=c(001,002,003,004,005,006),
                     labels=c("I have no problems doing my usual activities","I have slight problems doing my usual activities",
                              "I have moderate problems doing my usual activities","I have severe problems doing my usual activities",
                              "I am unable to do my usual activities","I don't know"))
names(data)[87] <- "H9"

# LimeSurvey Field type: F
data[, 88] <- as.numeric(data[, 88])
attributes(data)$variable.labels[88] <- "Your pain or discomfort today"
data[, 88] <- factor(data[, 88], levels=c(001,002,003,004,005,006),
                     labels=c("I have no pain or discomfort","I have slight pain or discomfort","I have moderate pain or discomfort",
                              "I have severe pain or discomfort","I have extreme pain or discomfort","I don't know"))
names(data)[88] <- "H10"

# LimeSurvey Field type: F
data[, 89] <- as.numeric(data[, 89])
attributes(data)$variable.labels[89] <- "Your anxiety or depression today"
data[, 89] <- factor(data[, 89], levels=c(001,002,003,004,005,006),
                     labels=c("I am neither anxious nor depressed","I am slightly anxious or depressed","I am moderately anxious or depressed",
                              "I am severely anxious or depressed","I am extremely anxious or depressed","I don't know"))
names(data)[89] <- "H11"

# LimeSurvey Field type: F
data[, 90] <- as.numeric(data[, 90])
attributes(data)$variable.labels[90] <- "We would like to know how good or bad your health is TODAY on a scale from 0 to 100. 100 means the best health you can imagine; 0 means the worst health you can imagine. Please enter a number between 0 and 100 to indicate your health TODAY."
names(data)[90] <- "H12"

# LimeSurvey Field type: A
data[, 91] <- as.character(data[, 91])
attributes(data)$variable.labels[91] <- "Have you received any treatment related to your [disease] in the last 5 years?"
data[, 91] <- factor(data[, 91], levels=c("A1","A2","A3"),labels=c("Yes", "No", "I don't know"))
names(data)[91] <- "HC2"

# Treatment types
data[, 92] <- as.numeric(data[, 92])
attributes(data)$variable.labels[92] <- "[[Medication type 1]] Which treatments have you received for your [disease] in the last 5 years?"
data[, 92] <- factor(data[, 92], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[92] <- "HC3_SQ005"

data[, 93] <- as.numeric(data[, 93])
attributes(data)$variable.labels[93] <- "[[Medication type 2]] Which treatments have you received for your [disease] in the last 5 years?"
data[, 93] <- factor(data[, 93], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[93] <- "HC3_SQ006"

data[, 94] <- as.numeric(data[, 94])
attributes(data)$variable.labels[94] <- "[[Medication type 3]] Which treatments have you received for your [disease] in the last 5 years?"
data[, 94] <- factor(data[, 94], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[94] <- "HC3_SQ007"

data[, 95] <- as.numeric(data[, 95])
attributes(data)$variable.labels[95] <- "[[etc.]] Which treatments have you received for your [disease] in the last 5 years?"
data[, 95] <- factor(data[, 95], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[95] <- "HC3_SQ008"

data[, 96] <- as.numeric(data[, 96])
attributes(data)$variable.labels[96] <- "[[Physiotherapy]] Which treatments have you received for your [disease] in the last 5 years?"
data[, 96] <- factor(data[, 96], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[96] <- "HC3_SQ001"

data[, 97] <- as.numeric(data[, 97])
attributes(data)$variable.labels[97] <- "[[Dietary adaptation]] Which treatments have you received for your [disease] in the last 5 years?"
data[, 97] <- factor(data[, 97], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[97] <- "HC3_SQ002"

data[, 98] <- as.numeric(data[, 98])
attributes(data)$variable.labels[98] <- "[[Surgical intervention]] Which treatments have you received for your [disease] in the last 5 years?"
data[, 98] <- factor(data[, 98], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[98] <- "HC3_SQ003"

data[, 99] <- as.numeric(data[, 99])
attributes(data)$variable.labels[99] <- "[I don't know] Which treatments have you received for your [disease] in the last 5 years?"
data[, 99] <- factor(data[, 99], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[99] <- "HC3_SQ004"

# LimeSurvey Field type: A
data[, 100] <- as.character(data[, 100])
attributes(data)$variable.labels[100] <- "[Other] Which treatments have you received for your [disease] in the last 5 years?"
names(data)[100] <- "HC3_other"

# Adverse effects (experienced)
data[, 101] <- as.numeric(data[, 101])
attributes(data)$variable.labels[101] <- "[[Adverse effect 1]] Which adverse effect(s) did you have during or after treatment of [the disease] in the last 5 years?"
data[, 101] <- factor(data[, 101], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[101] <- "HC4_SQ005"

data[, 102] <- as.numeric(data[, 102])
attributes(data)$variable.labels[102] <- "[[Adverse effect 2]] Which adverse effect(s) did you have during or after treatment of [the disease] in the last 5 years?"
data[, 102] <- factor(data[, 102], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[102] <- "HC4_SQ006"

data[, 103] <- as.numeric(data[, 103])
attributes(data)$variable.labels[103] <- "[[Adverse effect 3]] Which adverse effect(s) did you have during or after treatment of [the disease] in the last 5 years?"
data[, 103] <- factor(data[, 103], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[103] <- "HC4_SQ007"

data[, 104] <- as.numeric(data[, 104])
attributes(data)$variable.labels[104] <- "[[etc.]] Which adverse effect(s) did you have during or after treatment of [the disease] in the last 5 years?"
data[, 104] <- factor(data[, 104], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[104] <- "HC4_SQ008"

data[, 105] <- as.numeric(data[, 105])
attributes(data)$variable.labels[105] <- "[[Change in appearance]] Which adverse effect(s) did you have during or after treatment of [the disease] in the last 5 years?"
data[, 105] <- factor(data[, 105], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[105] <- "HC4_SQ001"

data[, 106] <- as.numeric(data[, 106])
attributes(data)$variable.labels[106] <- "[[Fatigue or exhaustion]] Which adverse effect(s) did you have during or after treatment of [the disease] in the last 5 years?"
data[, 106] <- factor(data[, 106], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[106] <- "HC4_SQ002"

data[, 107] <- as.numeric(data[, 107])
attributes(data)$variable.labels[107] <- "[[Surgical complications]] Which adverse effect(s) did you have during or after treatment of [the disease] in the last 5 years?"
data[, 107] <- factor(data[, 107], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[107] <- "HC4_SQ003"

data[, 108] <- as.numeric(data[, 108])
attributes(data)$variable.labels[108] <- "[Other adverse effect] Which adverse effect(s) did you have during or after treatment of [the disease] in the last 5 years?"
data[, 108] <- factor(data[, 108], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[108] <- "HC4_SQ010"

data[, 109] <- as.numeric(data[, 109])
attributes(data)$variable.labels[109] <- "[No adverse effect] Which adverse effect(s) did you have during or after treatment of [the disease] in the last 5 years?"
data[, 109] <- factor(data[, 109], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[109] <- "HC4_SQ004"

data[, 110] <- as.numeric(data[, 110])
attributes(data)$variable.labels[110] <- "[I don't know] Which adverse effect(s) did you have during or after treatment of [the disease] in the last 5 years?"
data[, 110] <- factor(data[, 110], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[110] <- "HC4_SQ009"

# Free-text: other adverse effects
data[, 111] <- as.character(data[, 111])
attributes(data)$variable.labels[111] <- "[Adverse effect 1] Which other adverse effect(s)?"
names(data)[111] <- "HC4b_SQ001"

data[, 112] <- as.character(data[, 112])
attributes(data)$variable.labels[112] <- "[Adverse effect 2] Which other adverse effect(s)?"
names(data)[112] <- "HC4b_SQ002"

data[, 113] <- as.character(data[, 113])
attributes(data)$variable.labels[113] <- "[Adverse effect 3] Which other adverse effect(s)?"
names(data)[113] <- "HC4b_SQ003"

data[, 114] <- as.character(data[, 114])
attributes(data)$variable.labels[114] <- "[Adverse effect 4] Which other adverse effect(s)?"
names(data)[114] <- "HC4b_SQ004"

data[, 115] <- as.character(data[, 115])
attributes(data)$variable.labels[115] <- "[Adverse effect 5] Which other adverse effect(s)?"
names(data)[115] <- "HC4b_SQ005"

# Burdensomeness of each adverse effect
data[, 116] <- as.character(data[, 116])
attributes(data)$variable.labels[116] <- "[[Adverse effect 1]] Indicate how burdensome each adverse effect was for you."
data[, 116] <- factor(data[, 116], levels=c("A1","A2","A3","A4","A5","A6"),
                      labels=c("Not at all burdensome","Slightly burdensome","Moderately burdensome","Very burdensome","Extremely burdensome","I don't know"))
names(data)[116] <- "HC5_SQ005"

data[, 117] <- as.character(data[, 117])
attributes(data)$variable.labels[117] <- "[[Adverse effect 2]] Indicate how burdensome each adverse effect was for you."
data[, 117] <- factor(data[, 117], levels=c("A1","A2","A3","A4","A5","A6"),
                      labels=c("Not at all burdensome","Slightly burdensome","Moderately burdensome","Very burdensome","Extremely burdensome","I don't know"))
names(data)[117] <- "HC5_SQ006"

data[, 118] <- as.character(data[, 118])
attributes(data)$variable.labels[118] <- "[[Adverse effect 3]] Indicate how burdensome each adverse effect was for you."
data[, 118] <- factor(data[, 118], levels=c("A1","A2","A3","A4","A5","A6"),
                      labels=c("Not at all burdensome","Slightly burdensome","Moderately burdensome","Very burdensome","Extremely burdensome","I don't know"))
names(data)[118] <- "HC5_SQ007"

data[, 119] <- as.character(data[, 119])
attributes(data)$variable.labels[119] <- "[[etc.]] Indicate how burdensome each adverse effect was for you."
data[, 119] <- factor(data[, 119], levels=c("A1","A2","A3","A4","A5","A6"),
                      labels=c("Not at all burdensome","Slightly burdensome","Moderately burdensome","Very burdensome","Extremely burdensome","I don't know"))
names(data)[119] <- "HC5_SQ008"

data[, 120] <- as.character(data[, 120])
attributes(data)$variable.labels[120] <- "[[Change in appearance]] Indicate how burdensome each adverse effect was for you."
data[, 120] <- factor(data[, 120], levels=c("A1","A2","A3","A4","A5","A6"),
                      labels=c("Not at all burdensome","Slightly burdensome","Moderately burdensome","Very burdensome","Extremely burdensome","I don't know"))
names(data)[120] <- "HC5_SQ001"

data[, 121] <- as.character(data[, 121])
attributes(data)$variable.labels[121] <- "[[Fatigue or exhaustion]] Indicate how burdensome each adverse effect was for you."
data[, 121] <- factor(data[, 121], levels=c("A1","A2","A3","A4","A5","A6"),
                      labels=c("Not at all burdensome","Slightly burdensome","Moderately burdensome","Very burdensome","Extremely burdensome","I don't know"))
names(data)[121] <- "HC5_SQ002"

data[, 122] <- as.character(data[, 122])
attributes(data)$variable.labels[122] <- "[[Surgical complications]] Indicate how burdensome each adverse effect was for you."
data[, 122] <- factor(data[, 122], levels=c("A1","A2","A3","A4","A5","A6"),
                      labels=c("Not at all burdensome","Slightly burdensome","Moderately burdensome","Very burdensome","Extremely burdensome","I don't know"))
names(data)[122] <- "HC5_SQ003"

data[, 123] <- as.character(data[, 123])
attributes(data)$variable.labels[123] <- "[{HC4b_SQ001.shown}] Indicate how burdensome each adverse effect was for you."
data[, 123] <- factor(data[, 123], levels=c("A1","A2","A3","A4","A5","A6"),
                      labels=c("Not at all burdensome","Slightly burdensome","Moderately burdensome","Very burdensome","Extremely burdensome","I don't know"))
names(data)[123] <- "HC5_SQ010"

data[, 124] <- as.character(data[, 124])
attributes(data)$variable.labels[124] <- "[{HC4b_SQ002.shown}] Indicate how burdensome each adverse effect was for you."
data[, 124] <- factor(data[, 124], levels=c("A1","A2","A3","A4","A5","A6"),
                      labels=c("Not at all burdensome","Slightly burdensome","Moderately burdensome","Very burdensome","Extremely burdensome","I don't know"))
names(data)[124] <- "HC5_SQ011"

data[, 125] <- as.character(data[, 125])
attributes(data)$variable.labels[125] <- "[{HC4b_SQ003.shown}] Indicate how burdensome each adverse effect was for you."
data[, 125] <- factor(data[, 125], levels=c("A1","A2","A3","A4","A5","A6"),
                      labels=c("Not at all burdensome","Slightly burdensome","Moderately burdensome","Very burdensome","Extremely burdensome","I don't know"))
names(data)[125] <- "HC5_SQ012"

data[, 126] <- as.character(data[, 126])
attributes(data)$variable.labels[126] <- "[{HC4b_SQ004.shown}] Indicate how burdensome each adverse effect was for you."
data[, 126] <- factor(data[, 126], levels=c("A1","A2","A3","A4","A5","A6"),
                      labels=c("Not at all burdensome","Slightly burdensome","Moderately burdensome","Very burdensome","Extremely burdensome","I don't know"))
names(data)[126] <- "HC5_SQ013"

data[, 127] <- as.character(data[, 127])
attributes(data)$variable.labels[127] <- "[{HC4b_SQ005.shown}] Indicate how burdensome each adverse effect was for you."
data[, 127] <- factor(data[, 127], levels=c("A1","A2","A3","A4","A5","A6"),
                      labels=c("Not at all burdensome","Slightly burdensome","Moderately burdensome","Very burdensome","Extremely burdensome","I don't know"))
names(data)[127] <- "HC5_SQ014"

# LimeSurvey Field type: F
data[, 128] <- as.numeric(data[, 128])
attributes(data)$variable.labels[128] <- "Apart from adverse effects, how burdensome was the treatment you received for [the disease] in the last 5 years? For example, because of injections, needing to go to the hospital, refrigeration requirements, a demanding dosing schedule, etc."
data[, 128] <- factor(data[, 128], levels=c(001,002,003,004,005,006),
                      labels=c("Not at all burdensome","Slightly burdensome","Moderately burdensome","Very burdensome","Extremely burdensome","I don't know"))
names(data)[128] <- "HC6"

# LimeSurvey Field type: A
data[, 129] <- as.character(data[, 129])
attributes(data)$variable.labels[129] <- "Since the onset of your disease, have you had surgery (e.g., [disease-relevant procedures]) due to your [disease]?"
data[, 129] <- factor(data[, 129], levels=c("A1","A2","A3"),labels=c("Yes", "No", "I don't know"))
names(data)[129] <- "DSHC1"

# Symptoms since under care/treated (burdensomeness)
data[, 130] <- as.character(data[, 130])
attributes(data)$variable.labels[130] <- "[[Specific symptom 1]] Since you have been monitored or treated for the disease, which of the following symptoms have you experienced and how burdensome were they for you? Do not consider treatment side effects."
data[, 130] <- factor(data[, 130], levels=c("A1","A2","A3","A4","A5","A6","A7"),
                      labels=c("I did not have this symptom","Not at all burdensome","Slightly burdensome","Moderately burdensome","Very burdensome","Extremely burdensome","I don't know"))
names(data)[130] <- "H13_SQ013"

data[, 131] <- as.character(data[, 131])
attributes(data)$variable.labels[131] <- "[[Specific symptom 2]] Since you have been monitored or treated for the disease, which of the following symptoms have you experienced and how burdensome were they for you? Do not consider treatment side effects."
data[, 131] <- factor(data[, 131], levels=c("A1","A2","A3","A4","A5","A6","A7"),
                      labels=c("I did not have this symptom","Not at all burdensome","Slightly burdensome","Moderately burdensome","Very burdensome","Extremely burdensome","I don't know"))
names(data)[131] <- "H13_SQ014"

data[, 132] <- as.character(data[, 132])
attributes(data)$variable.labels[132] <- "[Headache] Since you have been monitored or treated for the disease, which of the following symptoms have you experienced and how burdensome were they for you? Do not consider treatment side effects."
data[, 132] <- factor(data[, 132], levels=c("A1","A2","A3","A4","A5","A6","A7"),
                      labels=c("I did not have this symptom","Not at all burdensome","Slightly burdensome","Moderately burdensome","Very burdensome","Extremely burdensome","I don't know"))
names(data)[132] <- "H13_SQ001"

data[, 133] <- as.character(data[, 133])
attributes(data)$variable.labels[133] <- "[Concentration problems] Since you have been monitored or treated for the disease, which of the following symptoms have you experienced and how burdensome were they for you? Do not consider treatment side effects."
data[, 133] <- factor(data[, 133], levels=c("A1","A2","A3","A4","A5","A6","A7"),
                      labels=c("I did not have this symptom","Not at all burdensome","Slightly burdensome","Moderately burdensome","Very burdensome","Extremely burdensome","I don't know"))
names(data)[133] <- "H13_SQ002"

data[, 134] <- as.character(data[, 134])
attributes(data)$variable.labels[134] <- "[Lack of energy] Since you have been monitored or treated for the disease, which of the following symptoms have you experienced and how burdensome were they for you? Do not consider treatment side effects."
data[, 134] <- factor(data[, 134], levels=c("A1","A2","A3","A4","A5","A6","A7"),
                      labels=c("I did not have this symptom","Not at all burdensome","Slightly burdensome","Moderately burdensome","Very burdensome","Extremely burdensome","I don't know"))
names(data)[134] <- "H13_SQ003"

data[, 135] <- as.character(data[, 135])
attributes(data)$variable.labels[135] <- "[Fatigue or exhaustion] Since you have been monitored or treated for the disease, which of the following symptoms have you experienced and how burdensome were they for you? Do not consider treatment side effects."
data[, 135] <- factor(data[, 135], levels=c("A1","A2","A3","A4","A5","A6","A7"),
                      labels=c("I did not have this symptom","Not at all burdensome","Slightly burdensome","Moderately burdensome","Very burdensome","Extremely burdensome","I don't know"))
names(data)[135] <- "H13_SQ004"

data[, 136] <- as.character(data[, 136])
attributes(data)$variable.labels[136] <- "[Feelings of restlessness, nervousness, or irritability] Since you have been monitored or treated for the disease, which of the following symptoms have you experienced and how burdensome were they for you? Do not consider treatment side effects."
data[, 136] <- factor(data[, 136], levels=c("A1","A2","A3","A4","A5","A6","A7"),
                      labels=c("I did not have this symptom","Not at all burdensome","Slightly burdensome","Moderately burdensome","Very burdensome","Extremely burdensome","I don't know"))
names(data)[136] <- "H13_SQ005"

data[, 137] <- as.character(data[, 137])
attributes(data)$variable.labels[137] <- "[Anger or aggression] Since you have been monitored or treated for the disease, which of the following symptoms have you experienced and how burdensome were they for you? Do not consider treatment side effects."
data[, 137] <- factor(data[, 137], levels=c("A1","A2","A3","A4","A5","A6","A7"),
                      labels=c("I did not have this symptom","Not at all burdensome","Slightly burdensome","Moderately burdensome","Very burdensome","Extremely burdensome","I don't know"))
names(data)[137] <- "H13_SQ006"

data[, 138] <- as.character(data[, 138])
attributes(data)$variable.labels[138] <- "[Mood changes] Since you have been monitored or treated for the disease, which of the following symptoms have you experienced and how burdensome were they for you? Do not consider treatment side effects."
data[, 138] <- factor(data[, 138], levels=c("A1","A2","A3","A4","A5","A6","A7"),
                      labels=c("I did not have this symptom","Not at all burdensome","Slightly burdensome","Moderately burdensome","Very burdensome","Extremely burdensome","I don't know"))
names(data)[138] <- "H13_SQ007"

data[, 139] <- as.character(data[, 139])
attributes(data)$variable.labels[139] <- "[Fear or anxiety] Since you have been monitored or treated for the disease, which of the following symptoms have you experienced and how burdensome were they for you? Do not consider treatment side effects."
data[, 139] <- factor(data[, 139], levels=c("A1","A2","A3","A4","A5","A6","A7"),
                      labels=c("I did not have this symptom","Not at all burdensome","Slightly burdensome","Moderately burdensome","Very burdensome","Extremely burdensome","I don't know"))
names(data)[139] <- "H13_SQ008"

# LimeSurvey Field type: A
data[, 140] <- as.character(data[, 140])
attributes(data)$variable.labels[140] <- "[Feelings of low mood, depression, or sadness] Since you have been monitored or treated for the disease, which of the following symptoms have you experienced and how burdensome were they for you? Do not consider treatment side effects."
data[, 140] <- factor(data[, 140], levels=c("A1","A2","A3","A4","A5","A6","A7"),
                      labels=c("I did not have this symptom","Not at all burdensome","Slightly burdensome","Moderately burdensome","Very burdensome","Extremely burdensome","I don't know"))
names(data)[140] <- "H13_SQ009"

# LimeSurvey Field type: A
data[, 141] <- as.character(data[, 141])
attributes(data)$variable.labels[141] <- "[Stress] Since you have been monitored or treated for the disease, which of the following symptoms have you experienced and how burdensome were they for you? Do not consider treatment side effects."
data[, 141] <- factor(data[, 141], levels=c("A1","A2","A3","A4","A5","A6","A7"),
                      labels=c("I did not have this symptom","Not at all burdensome","Slightly burdensome","Moderately burdensome","Very burdensome","Extremely burdensome","I don't know"))
names(data)[141] <- "H13_SQ015"

# LimeSurvey Field type: A
data[, 142] <- as.character(data[, 142])
attributes(data)$variable.labels[142] <- "[Stigma or feeling discriminated against] Since you have been monitored or treated for the disease, which of the following symptoms have you experienced and how burdensome were they for you? Do not consider treatment side effects."
data[, 142] <- factor(data[, 142], levels=c("A1","A2","A3","A4","A5","A6","A7"),
                      labels=c("I did not have this symptom","Not at all burdensome","Slightly burdensome","Moderately burdensome","Very burdensome","Extremely burdensome","I don't know"))
names(data)[142] <- "H13_SQ010"

# LimeSurvey Field type: A
data[, 143] <- as.character(data[, 143])
attributes(data)$variable.labels[143] <- "[Loss of self-confidence] Since you have been monitored or treated for the disease, which of the following symptoms have you experienced and how burdensome were they for you? Do not consider treatment side effects."
data[, 143] <- factor(data[, 143], levels=c("A1","A2","A3","A4","A5","A6","A7"),
                      labels=c("I did not have this symptom","Not at all burdensome","Slightly burdensome","Moderately burdensome","Very burdensome","Extremely burdensome","I don't know"))
names(data)[143] <- "H13_SQ011"

# LimeSurvey Field type: A
data[, 144] <- as.character(data[, 144])
attributes(data)$variable.labels[144] <- "[Other symptom] Since you have been monitored or treated for the disease, which of the following symptoms have you experienced and how burdensome were they for you? Do not consider treatment side effects."
data[, 144] <- factor(data[, 144], levels=c("A1","A2","A3","A4","A5","A6","A7"),
                      labels=c("I did not have this symptom","Not at all burdensome","Slightly burdensome","Moderately burdensome","Very burdensome","Extremely burdensome","I don't know"))
names(data)[144] <- "H13_SQ012"

# LimeSurvey Field type: A
data[, 145] <- as.character(data[, 145])
attributes(data)$variable.labels[145] <- "Which other symptom?"
names(data)[145] <- "H13b"

# LimeSurvey Field type: F
data[, 146] <- as.numeric(data[, 146])
attributes(data)$variable.labels[146] <- "To what extent has [the disease] interfered with your sexual life?"
data[, 146] <- factor(data[, 146], levels=c(001,002,003,004,005,006,007,008),
                      labels=c("Not at all","Slightly","Moderately","A lot","Extremely","I don't know","Does not apply","I prefer not to answer"))
names(data)[146] <- "H14"

# LimeSurvey Field type: F
data[, 147] <- as.numeric(data[, 147])
attributes(data)$variable.labels[147] <- "To what extent has your [disease] interfered with your reproductive life, i.e., your ability or decision to conceive naturally or carry a pregnancy to term? For example: IVF, genetic testing, sperm/egg donation, need to postpone a pregnancy, or deciding not to have biological children because of the disease."
data[, 147] <- factor(data[, 147], levels=c(001,002,003,004,005,006,007,008),
                      labels=c("Not at all","Slightly","Moderately","A lot","Extremely","I don't know",
                               "Does not apply (e.g., you have not yet considered having children, or you were not concerned by the disease)",
                               "I prefer not to answer"))
names(data)[147] <- "H15"

# LimeSurvey Field type: A
data[, 148] <- as.character(data[, 148])
attributes(data)$variable.labels[148] <- "By 'care pathway' we mean all appointments, treatments, and support offered by healthcare professionals to manage and improve your health related to [the disease]."
names(data)[148] <- "INFO"

# LimeSurvey Field type: F
data[, 149] <- as.numeric(data[, 149])
attributes(data)$variable.labels[149] <- "Do you consider that your care has been well organized and planned over time?"
data[, 149] <- factor(data[, 149], levels=c(001,002,003,004,005,006),
                      labels=c("Always","Often","Sometimes","Rarely","Never","I don't know"))
names(data)[149] <- "HC7"

# LimeSurvey Field type: F
data[, 150] <- as.numeric(data[, 150])
attributes(data)$variable.labels[150] <- "Do you have one or more healthcare professionals who are responsible for coordinating the different medical services you need?"
data[, 150] <- factor(data[, 150], levels=c(001,002,003,004),
                      labels=c("Yes","No","I don't know","Does not apply: follow-up occurs in a single service, no coordination needed"))
names(data)[150] <- "HC8"

# LimeSurvey Field type: F
data[, 151] <- as.numeric(data[, 151])
attributes(data)$variable.labels[151] <- "To what extent do you see the same healthcare professional(s) during your regular appointments or exams?"
data[, 151] <- factor(data[, 151], levels=c(001,002,003,004,005,006,007),
                      labels=c("Always","Often","Sometimes","Rarely","Never","I don't know","007"))
names(data)[151] <- "HC9"

# LimeSurvey Field type: F
data[, 152] <- as.numeric(data[, 152])
attributes(data)$variable.labels[152] <- "To what extent do you receive enough useful and understandable information from your healthcare professionals?"
data[, 152] <- factor(data[, 152], levels=c(001,002,003,004,005,006),
                      labels=c("Always","Often","Sometimes","Rarely","Never","I don't know"))
names(data)[152] <- "HC10"

# LimeSurvey Field type: F
data[, 153] <- as.numeric(data[, 153])
attributes(data)$variable.labels[153] <- "Are you involved as much as you want (or wanted) in decisions about your care or treatment?"
data[, 153] <- factor(data[, 153], levels=c(001,002,003,004,005,006,007),
                      labels=c("Yes, definitely","Yes, to some extent","No, not really","No, definitely not",
                               "No, but I did not want to be involved anyway","Not applicable: no decisions about treatment taken","I don't know"))
names(data)[153] <- "HC11"

# LimeSurvey Field type: A
data[, 154] <- as.character(data[, 154])
attributes(data)$variable.labels[154] <- "In the past 12 months, were there any [disease]-related healthcare services you needed but did not obtain? This could be a consultation, treatment, tests, rehabilitation, or other."
data[, 154] <- factor(data[, 154], levels=c("A1","A2","A3"),labels=c("Yes", "No", "I don't know"))
names(data)[154] <- "HC12"

# Reasons for unmet needs
data[, 155] <- as.numeric(data[, 155])
attributes(data)$variable.labels[155] <- "[Distance between home and place of care] What were the main reason(s) you did not receive the care you needed?"
data[, 155] <- factor(data[, 155], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[155] <- "HC13_001"

data[, 156] <- as.numeric(data[, 156])
attributes(data)$variable.labels[156] <- "[Transport problems (e.g., no public transport nearby, no personal vehicle, unable to drive yourself, no one to take you to care)] What were the main reason(s) you did not receive the care you needed?"
data[, 156] <- factor(data[, 156], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[156] <- "HC13_002"

data[, 157] <- as.numeric(data[, 157])
attributes(data)$variable.labels[157] <- "[Lack of qualified staff to provide the care you need] What were the main reason(s) you did not receive the care you needed?"
data[, 157] <- factor(data[, 157], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[157] <- "HC13_003"

data[, 158] <- as.numeric(data[, 158])
attributes(data)$variable.labels[158] <- "[Very long waiting times] What were the main reason(s) you did not receive the care you needed?"
data[, 158] <- factor(data[, 158], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[158] <- "HC13_004"

data[, 159] <- as.numeric(data[, 159])
attributes(data)$variable.labels[159] <- "[Difficulties paying for care] What were the main reason(s) you did not receive the care you needed?"
data[, 159] <- factor(data[, 159], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[159] <- "HC13_005"

data[, 160] <- as.numeric(data[, 160])
attributes(data)$variable.labels[160] <- "[Fear of medical tests, hospital, or something else] What were the main reason(s) you did not receive the care you needed?"
data[, 160] <- factor(data[, 160], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[160] <- "HC13_006"

data[, 161] <- as.numeric(data[, 161])
attributes(data)$variable.labels[161] <- "[Lack of time due to work, children, or other] What were the main reason(s) you did not receive the care you needed?"
data[, 161] <- factor(data[, 161], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[161] <- "HC13_007"

data[, 162] <- as.numeric(data[, 162])
attributes(data)$variable.labels[162] <- "[Lack of information] What were the main reason(s) you did not receive the care you needed?"
data[, 162] <- factor(data[, 162], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[162] <- "HC13_008"

data[, 163] <- as.numeric(data[, 163])
attributes(data)$variable.labels[163] <- "[Language difficulties] What were the main reason(s) you did not receive the care you needed?"
data[, 163] <- factor(data[, 163], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[163] <- "HC13_009"

# LimeSurvey Field type: A
data[, 164] <- as.character(data[, 164])
attributes(data)$variable.labels[164] <- "[Other] What were the main reason(s) you did not receive the care you needed?"
names(data)[164] <- "HC13_other"

# LimeSurvey Field type: F
data[, 165] <- as.numeric(data[, 165])
attributes(data)$variable.labels[165] <- "To what extent were your schooling or studies affected by your disease, in terms of attendance, performance, success, or study choices?"
data[, 165] <- factor(data[, 165], levels=c(001,002,003,004,005,006,007),
                      labels=c("Not at all","Slightly","Moderately","A lot","Extremely","I don't know",
                               "Does not apply: the disease occurred after completing my schooling/studies"))
names(data)[165] <- "S1"

# LimeSurvey Field type: A
data[, 166] <- as.character(data[, 166])
attributes(data)$variable.labels[166] <- "Due to [the disease], have you reduced your working time?"
data[, 166] <- factor(data[, 166], levels=c("001","002","003","005"),
                      labels=c("Yes, I work fewer hours than before due to my disease",
                               "Yes, I stopped working due to my disease",
                               "No, the disease did not affect my working time",
                               "I don't know"))
names(data)[166] <- "S2"

# LimeSurvey Field type: A
data[, 167] <- as.character(data[, 167])
attributes(data)$variable.labels[167] <- "[Other] Due to [the disease], have you reduced your working time?"
names(data)[167] <- "S2_other"

# LimeSurvey Field type: A
data[, 168] <- as.character(data[, 168])
attributes(data)$variable.labels[168] <- "Approximately how long have you been unable to work due to your disease? Please estimate the TOTAL of all work stoppages or sick leaves, whether consecutive or not. For example: if you were off for 1 month, then later for 2 months, tick “3 to 6 months”."
data[, 168] <- factor(data[, 168], levels=c("AO01","AO02","AO03","AO04","AO05"),
                      labels=c("For less than 1 month","For 1 to 3 months","For 4 months to 1 year","For more than 1 year","I don't know"))
names(data)[168] <- "S3"

# LimeSurvey Field type: F
data[, 169] <- as.numeric(data[, 169])
attributes(data)$variable.labels[169] <- "Indicate approximately the number of years:"
names(data)[169] <- "S3b"

# LimeSurvey Field type: A
data[, 170] <- as.character(data[, 170])
attributes(data)$variable.labels[170] <- "The next question concerns the last seven days, not including today."
names(data)[170] <- "TEXTS4"

# LimeSurvey Field type: F
data[, 171] <- as.numeric(data[, 171])
attributes(data)$variable.labels[171] <- "[| [The disease] had no effect on my work | Because of [my disease], I could not work at all] In the past seven days, to what extent did [the disease] affect your productivity while working? Think of days when you were limited in the amount or type of work you could do, days when you accomplished less than you wanted, or days when you could not do your work as carefully as usual. Choose a low number if the disease had little effect on your work; choose a high number if it had a large effect."
names(data)[171] <- "S4_SQ001"

# LimeSurvey Field type: F
data[, 172] <- as.numeric(data[, 172])
attributes(data)$variable.labels[172] <- "To what extent has your [disease] or medical treatment caused you financial difficulties?"
data[, 172] <- factor(data[, 172], levels=c(001,002,003,004,005,006),
                      labels=c("Not at all","Slightly","Moderately","A lot","Extremely","I don't know"))
names(data)[172] <- "S5"

# LimeSurvey Field type: A
data[, 173] <- as.character(data[, 173])
attributes(data)$variable.labels[173] <- "To what extent does your disease interfere with your relationships with family, partner, friends, or neighbors?"
data[, 173] <- factor(data[, 173], levels=c("A001","A002","A003","A004","A005","A006"),
                      labels=c("Not at all","Slightly","Moderately","A lot","Extremely","I don't know"))
names(data)[173] <- "S6"

# LimeSurvey Field type: F
data[, 174] <- as.numeric(data[, 174])
attributes(data)$variable.labels[174] <- "[No additional support] Because of [the disease], what kinds of additional support have you needed but not yet obtained?"
data[, 174] <- factor(data[, 174], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[174] <- "S7_SQ001"

data[, 175] <- as.numeric(data[, 175])
attributes(data)$variable.labels[175] <- "[Practical help (e.g., cleaning, cooking, shopping, transport, childcare)] Because of [the disease], what kinds of additional support have you needed but not yet obtained?"
data[, 175] <- factor(data[, 175], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[175] <- "S7_SQ002"

data[, 176] <- as.numeric(data[, 176])
attributes(data)$variable.labels[176] <- "[Talking to other patients with [the disease]] Because of [the disease], what kinds of additional support have you needed but not yet obtained?"
data[, 176] <- factor(data[, 176], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[176] <- "S7_SQ003"

data[, 177] <- as.numeric(data[, 177])
attributes(data)$variable.labels[177] <- "[Psychological support] Because of [the disease], what kinds of additional support have you needed but not yet obtained?"
data[, 177] <- factor(data[, 177], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[177] <- "S7_SQ004"

data[, 178] <- as.numeric(data[, 178])
attributes(data)$variable.labels[178] <- "[Medical support] Because of [the disease], what kinds of additional support have you needed but not yet obtained?"
data[, 178] <- factor(data[, 178], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[178] <- "S7_SQ005"

data[, 179] <- as.numeric(data[, 179])
attributes(data)$variable.labels[179] <- "[Administrative or social support] Because of [the disease], what kinds of additional support have you needed but not yet obtained?"
data[, 179] <- factor(data[, 179], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[179] <- "S7_SQ006"

data[, 180] <- as.numeric(data[, 180])
attributes(data)$variable.labels[180] <- "[Support for environmental adaptation or assistive equipment] Because of [the disease], what kinds of additional support have you needed but not yet obtained?"
data[, 180] <- factor(data[, 180], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[180] <- "S7_SQ007"

data[, 181] <- as.numeric(data[, 181])
attributes(data)$variable.labels[181] <- "[Support for return to work] Because of [the disease], what kinds of additional support have you needed but not yet obtained?"
data[, 181] <- factor(data[, 181], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[181] <- "S7_SQ008"

# LimeSurvey Field type: F
data[, 182] <- as.numeric(data[, 182])
attributes(data)$variable.labels[182] <- "[School or study support] Because of [the disease], what kinds of additional support have you needed but not yet obtained?"
data[, 182] <- factor(data[, 182], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[182] <- "S7_SQ009"

# LimeSurvey Field type: F
data[, 183] <- as.numeric(data[, 183])
attributes(data)$variable.labels[183] <- "[Spiritual or religious accompaniment] Because of [the disease], what kinds of additional support have you needed but not yet obtained?"
data[, 183] <- factor(data[, 183], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[183] <- "S7_SQ010"

# LimeSurvey Field type: F
data[, 184] <- as.numeric(data[, 184])
attributes(data)$variable.labels[184] <- "[I don't know] Because of [the disease], what kinds of additional support have you needed but not yet obtained?"
data[, 184] <- factor(data[, 184], levels=c(1,0),labels=c("Yes", "Not selected"))
names(data)[184] <- "S7_SQ012"

# LimeSurvey Field type: A
data[, 185] <- as.character(data[, 185])
attributes(data)$variable.labels[185] <- "[Other] Because of [the disease], what kinds of additional support have you needed but not yet obtained?"
names(data)[185] <- "S7_other"

# Priorities
data[, 186] <- as.character(data[, 186])
attributes(data)$variable.labels[186] <- "[Impact on overall quality of life (mobility, self-care, ability to wash/dress yourself, discomfort or pain, anxiety or depression)] In your opinion, which aspects of your disease or its care should be improved as a priority? Please rate each aspect according to its importance to you."
data[, 186] <- factor(data[, 186], levels=c("AO01","AO02","AO03","AO04","AO05","AO06"),
                      labels=c("Not a priority at all","Slight priority","Moderate priority","High priority","Extremely high priority","I don't know"))
names(data)[186] <- "P1_001"

data[, 187] <- as.character(data[, 187])
attributes(data)$variable.labels[187] <- "[Impact on your physical health (physical symptoms, discomfort or pain related to the disease)] In your opinion, which aspects..."
data[, 187] <- factor(data[, 187], levels=c("AO01","AO02","AO03","AO04","AO05","AO06"),
                      labels=c("Not a priority at all","Slight priority","Moderate priority","High priority","Extremely high priority","I don't know"))
names(data)[187] <- "P1_002"

data[, 188] <- as.character(data[, 188])
attributes(data)$variable.labels[188] <- "[Impact on your psychological health (psychological symptoms, anxiety, or depression related to the disease)] In your opinion, which aspects..."
data[, 188] <- factor(data[, 188], levels=c("AO01","AO02","AO03","AO04","AO05","AO06"),
                      labels=c("Not a priority at all","Slight priority","Moderate priority","High priority","Extremely high priority","I don't know"))
names(data)[188] <- "P1_003"

data[, 189] <- as.character(data[, 189])
attributes(data)$variable.labels[189] <- "[Impact on your autonomy (impact on mobility, ability to wash and dress yourself)] In your opinion, which aspects..."
data[, 189] <- factor(data[, 189], levels=c("AO01","AO02","AO03","AO04","AO05","AO06"),
                      labels=c("Not a priority at all","Slight priority","Moderate priority","High priority","Extremely high priority","I don't know"))
names(data)[189] <- "P1_004"

data[, 190] <- as.character(data[, 190])
attributes(data)$variable.labels[190] <- "[Impact on your sexual and reproductive life] In your opinion, which aspects..."
data[, 190] <- factor(data[, 190], levels=c("AO01","AO02","AO03","AO04","AO05","AO06"),
                      labels=c("Not a priority at all","Slight priority","Moderate priority","High priority","Extremely high priority","I don't know"))
names(data)[190] <- "P1_005"

data[, 191] <- as.character(data[, 191])
attributes(data)$variable.labels[191] <- "[Impact on life expectancy] In your opinion, which aspects..."
data[, 191] <- factor(data[, 191], levels=c("AO01","AO02","AO03","AO04","AO05","AO06"),
                      labels=c("Not a priority at all","Slight priority","Moderate priority","High priority","Extremely high priority","I don't know"))
names(data)[191] <- "P1_006"

data[, 192] <- as.character(data[, 192])
attributes(data)$variable.labels[192] <- "[Impact on your schooling or studies] In your opinion, which aspects..."
data[, 192] <- factor(data[, 192], levels=c("AO01","AO02","AO03","AO04","AO05","AO06"),
                      labels=c("Not a priority at all","Slight priority","Moderate priority","High priority","Extremely high priority","I don't know"))
names(data)[192] <- "P1_007"

data[, 193] <- as.character(data[, 193])
attributes(data)$variable.labels[193] <- "[Impact on your work] In your opinion, which aspects..."
data[, 193] <- factor(data[, 193], levels=c("AO01","AO02","AO03","AO04","AO05","AO06"),
                      labels=c("Not a priority at all","Slight priority","Moderate priority","High priority","Extremely high priority","I don't know"))
names(data)[193] <- "P1_008"

data[, 194] <- as.character(data[, 194])
attributes(data)$variable.labels[194] <- "[Financial impact] In your opinion, which aspects..."
data[, 194] <- factor(data[, 194], levels=c("AO01","AO02","AO03","AO04","AO05","AO06"),
                      labels=c("Not a priority at all","Slight priority","Moderate priority","High priority","Extremely high priority","I don't know"))
names(data)[194] <- "P1_009"

data[, 195] <- as.character(data[, 195])
attributes(data)$variable.labels[195] <- "[Impact of the disease on your social life (relationships with family, partner, or friends)] In your opinion, which aspects..."
data[, 195] <- factor(data[, 195], levels=c("AO01","AO02","AO03","AO04","AO05","AO06"),
                      labels=c("Not a priority at all","Slight priority","Moderate priority","High priority","Extremely high priority","I don't know"))
names(data)[195] <- "P1_010"

data[, 196] <- as.character(data[, 196])
attributes(data)$variable.labels[196] <- "[Quality of your care (speed of diagnosis, screening programs, coordination and continuity of care, information received from healthcare professionals, involvement in decisions regarding your care or treatments)] In your opinion, which aspects..."
data[, 196] <- factor(data[, 196], levels=c("AO01","AO02","AO03","AO04","AO05","AO06"),
                      labels=c("Not a priority at all","Slight priority","Moderate priority","High priority","Extremely high priority","I don't know"))
names(data)[196] <- "P1_011"

data[, 197] <- as.character(data[, 197])
attributes(data)$variable.labels[197] <- "[Access to healthcare (obtaining care when needed, availability of treatment)] In your opinion, which aspects..."
data[, 197] <- factor(data[, 197], levels=c("AO01","AO02","AO03","AO04","AO05","AO06"),
                      labels=c("Not a priority at all","Slight priority","Moderate priority","High priority","Extremely high priority","I don't know"))
names(data)[197] <- "P1_012"

data[, 198] <- as.character(data[, 198])
attributes(data)$variable.labels[198] <- "[Scientific knowledge (e.g., in terms of diagnosis, treatment, or prognosis)] In your opinion, which aspects..."
data[, 198] <- factor(data[, 198], levels=c("AO01","AO02","AO03","AO04","AO05","AO06"),
                      labels=c("Not a priority at all","Slight priority","Moderate priority","High priority","Extremely high priority","I don't know"))
names(data)[198] <- "P1_013"

data[, 199] <- as.character(data[, 199])
attributes(data)$variable.labels[199] <- "[Effectiveness of treatment (ability to cure the disease, improve symptoms or quality of life)] In your opinion, which aspects..."
data[, 199] <- factor(data[, 199], levels=c("AO01","AO02","AO03","AO04","AO05","AO06"),
                      labels=c("Not a priority at all","Slight priority","Moderate priority","High priority","Extremely high priority","I don't know"))
names(data)[199] <- "P1_014"

data[, 200] <- as.character(data[, 200])
attributes(data)$variable.labels[200] <- "[Burden of treatment (in terms of side effects or logistics/administration of the treatment)] In your opinion, which aspects..."
data[, 200] <- factor(data[, 200], levels=c("AO01","AO02","AO03","AO04","AO05","AO06"),
                      labels=c("Not a priority at all","Slight priority","Moderate priority","High priority","Extremely high priority","I don't know"))
names(data)[200] <- "P1_015"

# LimeSurvey Field type: F
data[, 201] <- as.numeric(data[, 201])
attributes(data)$variable.labels[201] <- "Would you like to tell us about any other important needs related to [the disease] that you could not express in the questionnaire?"
data[, 201] <- factor(data[, 201], levels=c(1,2),labels=c("Yes", "No"))
names(data)[201] <- "G1"

# LimeSurvey Field type: A
data[, 202] <- as.character(data[, 202])
attributes(data)$variable.labels[202] <- "Which needs were not covered in the questionnaire?"
names(data)[202] <- "G2"

# LimeSurvey Field type: F
data[, 203] <- as.numeric(data[, 203])
attributes(data)$variable.labels[203] <- "As the person completing the questionnaire for someone with [the disease]: do you consider yourself a 'caregiver'? That is, you regularly assist this person due to their disease on a non-professional basis. For example, a parent helping their child, a family member or friend helping a loved one."
data[, 203] <- factor(data[, 203], levels=c(1,2),labels=c("Yes", "No"))
names(data)[203] <- "CG1"

# LimeSurvey Field type: F
data[, 204] <- as.numeric(data[, 204])
attributes(data)$variable.labels[204] <- "In relation to the person you help, you are: [tick the appropriate answer]"
data[, 204] <- factor(data[, 204], levels=c(001,002,003),
                      labels=c("A family member (e.g., parent, child, grandparent…)",
                               "A close relation (e.g., friend, neighbor…)",
                               "Other: please specify."))
names(data)[204] <- "CG2"

# LimeSurvey Field type: A
data[, 205] <- as.character(data[, 205])
attributes(data)$variable.labels[205] <- "[Comment] In relation to the person you help, you are: [tick the appropriate answer]"
names(data)[205] <- "CG2_comment"

# LimeSurvey Field type: F
data[, 206] <- as.numeric(data[, 206])
attributes(data)$variable.labels[206] <- "Which gender do you identify with?"
data[, 206] <- factor(data[, 206], levels=c(001,002,003),labels=c("Man", "Woman", "Other"))
names(data)[206] <- "CG3"

# LimeSurvey Field type: F
data[, 207] <- as.numeric(data[, 207])
attributes(data)$variable.labels[207] <- "What is your year of birth?"
names(data)[207] <- "CG4"

# LimeSurvey Field type: F
data[, 208] <- as.numeric(data[, 208])
attributes(data)$variable.labels[208] <- "Last week, how much time did you spend helping the person with activities they would normally have done themselves if they were in good health? For example, personal care (such as dressing/undressing, going to the toilet…), household tasks (such as preparing meals, cleaning…) or practical support (such as accompanying them to appointments inside or outside, medical or other…)."
names(data)[208] <- "CG5"

# LimeSurvey Field type: A
data[, 209] <- as.character(data[, 209])
attributes(data)$variable.labels[209] <- "In your opinion, to what extent is your physical and/or psychological health affected due to your role as a caregiver?"
data[, 209] <- factor(data[, 209], levels=c("AO01","AO02","AO03","AO04","AO05","AO06"),
                      labels=c("Not at all","Slightly","Moderately","A lot","Extremely","I don't know"))
names(data)[209] <- "CG6"

# LimeSurvey Field type: A
data[, 210] <- as.character(data[, 210])
attributes(data)$variable.labels[210] <- "In your opinion, to what extent is your social life affected due to your role as a caregiver?"
data[, 210] <- factor(data[, 210], levels=c("AO01","AO02","AO03","AO04","AO05","AO06"),
                      labels=c("Not at all","Slightly","Moderately","A lot","Extremely","I don't know"))
names(data)[210] <- "CG7"

# LimeSurvey Field type: F
data[, 211] <- as.numeric(data[, 211])
attributes(data)$variable.labels[211] <- "We would like to learn more about the needs and difficulties you experience or have experienced in the context of your [disease]. If you wish, you can participate in a one-to-one interview (online or face-to-face with a researcher) to discuss your experiences and needs in more detail. This interview will be confidential and will not affect the care you receive from professionals. It is planned that [X] patients will be interviewed. The interview will last about one and a half hours. Would you like to participate in a one-to-one interview?"
data[, 211] <- factor(data[, 211], levels=c(1,2),labels=c("Yes", "No"))
names(data)[211] <- "Follow"

# LimeSurvey Field type: A
data[, 212] <- as.character(data[, 212])
attributes(data)$variable.labels[212] <- "[Last name] Please provide your contact details so we can contact you."
names(data)[212] <- "NOM_NAME"

# LimeSurvey Field type: A
data[, 213] <- as.character(data[, 213])
attributes(data)$variable.labels[213] <- "[First name] Please provide your contact details so we can contact you."
names(data)[213] <- "NOM_FNAME"

# LimeSurvey Field type: A
data[, 214] <- as.character(data[, 214])
attributes(data)$variable.labels[214] <- "[Email address] Please provide your contact details so we can contact you."
names(data)[214] <- "NOM_Email"

# LimeSurvey Field type: A
data[, 215] <- as.character(data[, 215])
attributes(data)$variable.labels[215] <- "[Confirm email address] Please provide your contact details so we can contact you."
names(data)[215] <- "NOM_Cemail"

# LimeSurvey Field type: A
data[, 216] <- as.character(data[, 216])
attributes(data)$variable.labels[216] <- "[Mobile phone number] Please provide your contact details so we can contact you."
names(data)[216] <- "NOM_GSM"

# LimeSurvey Field type: A
data[, 217] <- as.character(data[, 217])
attributes(data)$variable.labels[217] <- "[Other phone number] Please provide your contact details so we can contact you."
names(data)[217] <- "NOM_NAME1"

# LimeSurvey Field type: A
data[, 218] <- as.character(data[, 218])
attributes(data)$variable.labels[218] <- "Thank you very much for your cooperation! A member of the research team will contact you within a few weeks to inform you about your possible participation in an interview."
names(data)[218] <- "TXS"
