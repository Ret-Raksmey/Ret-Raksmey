
enum Skill {
  FLUTTER,
  DART,
  OTHER,
}

class Address {
  final String street;
  final String city;
  final String zipCode;
  Address({required this.street, required this.city, required this.zipCode});
}

class Employee {
  final String _name;
  final int _age;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  Employee({
    required String name,
    required int age,
    required List<Skill> skills,
    required Address address,
    required int yearsOfExperience,
  })  : _name = name,
        _age = age,
        _skills = skills,
        _address = address,
        _yearsOfExperience = yearsOfExperience;

  Employee.mobileDeveloper({
    required String name,
    required int age,
    required Address address,
    required int yearsOfExperience,
  })  : _name = name,
        _age = age,
        _skills = [Skill.FLUTTER, Skill.DART],
        _address = address,
        _yearsOfExperience = yearsOfExperience;

  String get name => _name;
  int get age => _age;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  double computeSalary() {
    const baseSalary = 40000.0; // Changed to double
    const experienceBonus = 2000.0; // Changed to double
    int skillBonus = 0;

    for (Skill skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          skillBonus += 5000;
          break;
        case Skill.DART:
          skillBonus += 3000;
          break;
        case Skill.OTHER:
          skillBonus += 1000;
          break;
      }
    }
    // No need for casting
    double totalSalary = baseSalary + (_yearsOfExperience * experienceBonus) + skillBonus;
    return totalSalary;
  }
}

void main() {
  Address address = Address(street: "123 Main St", city: "Metropolis", zipCode: "12345");
  Employee e1 = Employee(
    name: "Avyna Sen",
    age: 20,
    skills: [Skill.FLUTTER, Skill.OTHER],
    address: address,
    yearsOfExperience: 5,
  );
  Employee e2 = Employee.mobileDeveloper(
    name: "Jastin Jen",
    age: 25,
    address: address,
    yearsOfExperience: 3,
  );

  print("Employee 1 Salary: \$${e1.computeSalary()}");
  print("Employee 2 Salary: \$${e2.computeSalary()}");
}
