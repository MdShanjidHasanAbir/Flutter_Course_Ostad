import 'dart:io';

abstract class Role {
  void displayRole();
}

class Person implements Role {
  String name;
  int age;
  String address;
  Role role;

  Person(this.name, this.age, this.address, this.role);

  @override
  void displayRole() {
    role.displayRole();
  }

  String getName() => name;
  int getAge() => age;
  String getAddress() => address;
}

class Student extends Person implements Role {
  String studentID;
  String grade;
  List<int> courseScores;

  Student(
      String name,
      int age,
      String address,
      this.studentID,
      this.grade,
      this.courseScores,
      ) : super(name, age, address, _StudentRole());

  @override
  void displayRole() {
    print("Role: Student");
  }

  double calculateAverageScore() {
    if (courseScores.isEmpty) return 0;
    int total = courseScores.reduce((a, b) => a + b);
    return total / courseScores.length;
  }

  void displayStudentInfo() {
    print("\nStudent Information:\n");
    displayRole();
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
    print("Average Score: ${calculateAverageScore().toStringAsFixed(1)}\n");
  }

  void call() {
    displayStudentInfo();
  }
}

class _StudentRole implements Role {
  @override
  void displayRole() {
    print("Role: Student");
  }
}

class Teacher extends Person implements Role {
  String teacherID;
  List<String> coursesTaught;

  Teacher(
      String name,
      int age,
      String address,
      this.teacherID,
      this.coursesTaught,
      ) : super(name, age, address, _TeacherRole());

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  void displayTeacherInfo() {
    print("\nTeacher Information:\n");
    displayRole();
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
    print("Courses Taught:");
    for (var course in coursesTaught) {
      print("- $course");
    }
    print('');
  }

  void call() {
    displayTeacherInfo();
  }
}

class _TeacherRole implements Role {
  @override
  void displayRole() {
    print("Role: Teacher");
  }
}

void main() {

  Student student = Student(
    "John Doe",
    20,
    "123 Main St",
    "S123",
    "A",
    [90, 85, 82],
  );

  Teacher teacher = Teacher(
    "Mrs. Smith",
    35,
    "456 Oak St",
    "T456",
    ["Math", "English", "Bangla"],
  );


  stdout.write("Information of (student/teacher): ");
  String? input = stdin.readLineSync();

  if (input != null) {
    input = input.toLowerCase().trim();

    if (input == "student") {
      student();
    } else if (input == "teacher") {
      teacher();
    } else {
      print("\nInvalid input. Please type 'student' or 'teacher'.");
    }
  }
}

