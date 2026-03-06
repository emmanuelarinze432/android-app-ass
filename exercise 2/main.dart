String describeTemperature(int? temp) {
  if (temp == null) {
    return "No data";
  }

  if (temp <= 0) {
    return "Freezing";
  } else if (temp >= 1 && temp <= 15) {
    return "Cold";
  } else if (temp >= 16 && temp <= 25) {
    return "Mild";
  } else if (temp >= 26 && temp <= 35) {
    return "Warm";
  } else if (temp >= 36 && temp <= 45) {
    return "Hot";
  } else {
    return "Extreme";
  }
}

void main() {
  List<int?> temperatures = [null, -5, 5, 20, 30, 40, 50];

  for (var temp in temperatures) {
    print("Temperature: $temp -> ${describeTemperature(temp)}");
  }
}
