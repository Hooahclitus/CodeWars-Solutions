def bmi(weight: Int, height: Double): String =
  val bmi = weight / (height * height)

  bmi match
    case a  if bmi <= 18.5 => "Underweight"
    case b  if bmi <= 25.0 => "Normal"
    case c  if bmi <= 30.0 => "Overweight"
    case d  if bmi > 30.0 => "Obese"
