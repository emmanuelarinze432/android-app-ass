import 'dart:io';
import 'package:excel/excel.dart';
import 'package:pdf/widgets.dart' as pw;

class Student {
  String name;
  String matricule;
  double score;

  Student(this.name, this.matricule, this.score);

  String getGrade() {
    if (score >= 70) return "A";
    if (score >= 60) return "B";
    if (score >= 50) return "C";
    if (score >= 45) return "D";
    if (score >= 40) return "E";
    return "F";
  }

  String format() {
    return "$name | $matricule | $score | ${getGrade()}";
  }
}

void main() async {
  print("Grading Calculator Started");

  File file = File("students.xlsx");

  var bytes = file.readAsBytesSync();
  var excel = Excel.decodeBytes(bytes);

  List<Student> students = [];

  for (var table in excel.tables.keys) {
    var sheet = excel.tables[table];

    for (int i = 1; i < sheet!.rows.length; i++) {
      var row = sheet.rows[i];

      String name = row[0]!.value.toString();
      String matricule = row[1]!.value.toString();
      double score = double.parse(row[2]!.value.toString());

      students.add(Student(name, matricule, score));
    }
  }

  students.forEach((s) {
    print(s.format());
  });

  generatePdf(students);

  print("PDF Generated");
}

void generatePdf(List<Student> students) async {
  final pdf = pw.Document();

  List<List<String>> tableData = students.map((s) {
    return [s.name, s.matricule, s.score.toString(), s.getGrade()];
  }).toList();

  pdf.addPage(
    pw.Page(
      build: (context) {
        return pw.Table.fromTextArray(
            headers: ["Name", "Matricule", "Score", "Grade"], data: tableData);
      },
    ),
  );

  final file = File("grade_report.pdf");

  await file.writeAsBytes(await pdf.save());
}
