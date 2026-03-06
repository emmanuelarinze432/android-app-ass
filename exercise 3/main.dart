void main() {
  
  List<int?> numbers = [1, null, 3, null, 5, 6, null, 8];

  var nonNullNumbers = numbers.whereType<int>();

  var doubledNumbers = nonNullNumbers.map((n) => n * 2);

  var sum = doubledNumbers.reduce((a, b) => a + b);

  print("Sum of doubled values: $sum");
}
