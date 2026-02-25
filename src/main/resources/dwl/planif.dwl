%dw 2.0

fun typeOccupation(TEXTE01: String): String = TEXTE01 match {
	case "ACCT" -> "M"
	case "CLD" -> "M"
	case "LM" -> "M"
	case "MO" -> "M"
	case "MP" -> "M"
	case "CLM" -> "M"
	else -> ""
}

fun natureOccupation(TEXTE01: String): String = TEXTE01 match {
	case "ACCT" -> "Accident de service"
	case "CLD" -> "Congé longue durée"
	case "LM" -> "Congé longue maladie"
	case "MO" -> "Congé maladie ordinaire"
	case "MP" -> "Maladie professionnelle"
	case "CLM" -> "Congé longue maladie"
	else -> ""
}

fun operation(LIG: String): String = LIG match {
	case "SUP" -> "S"
	case "CRE" -> "X"
	else -> ""
}

fun formatDate(date: String, time: String): String =
	date as Date {format: "dd/MM/yyyy"} as String {format: "yyyyMMdd"} ++ time ++ "J"