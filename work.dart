import 'dart:io';

// Define an interface
abstract class Hr {
  void hire();
}

// Implementing class
class Employee implements Hr {
  final String department;
  final String name;
  final double salary;

  Employee(this.department, this.name, this.salary);

  @override
  void hire() {
    print('$name from $department got hired');
  }

  void depature() {
    print('at 4:00 pm finishing work ');
  }
}

// Extending class
class Leader extends Employee {
  Leader(String department, String name, double salary)
      : super(department, name, salary);

  @override
  void hire() {
    print('$name from $department need to work early as possible');
  }
}

// Class initialized with data from a file
class EmployeeQualification {
  List<Employee> employees = [];

  EmployeeQualification(String fileName) {
    var file = File(fileName);
    var readAsLinesSync = file.readAsLinesSync();
    var lines = readAsLinesSync;

    for (var line in lines) {
      var data = line.split(',');
      var department = data[0];
      var name = data[1];
      var salary = double.parse(data[2]);
      employees.add(Employee(department, name, salary));
    }
  }
}

void main() {
  // Create an instance of EmployeeQualification
  var employeeQualification = EmployeeQualification('data.txt');

  // Print information of employees created by EmployeeQualification
  for (var employeee in employeeQualification.employees) {
    employeee.hire();
  }
}
