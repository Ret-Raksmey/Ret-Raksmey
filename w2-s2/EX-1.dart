import 'package:projrct_flutter/w2-s2/Ex-1.dart';

enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String _street;
  final String _city;
  final String _zipCode;

  Address({required String street, required String city, required String zipCode})
      : _street = street,
        _city = city,
        _zipCode = zipCode;

  String get street => _street;
  String get city => _city;
  String get zipCode => _zipCode;

  @override
  String toString() {
    return '$_street, $_city, $_zipCode';
  }
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  Employee({
    required String name,
    required double baseSalary,
    required List<Skill> skills,
    required Address address,
    required int yearsOfExperience,
  })  : _name = name,
        _baseSalary = baseSalary,
        _skills = skills,
        _address = address,
        _yearsOfExperience = yearsOfExperience;

  Employee.mobileDeveloper({
    required String name,
    required double baseSalary,
    required Address address,
    required int yearsOfExperience,
  }) : this(
          name: name,
          baseSalary: baseSalary,
          skills: [Skill.FLUTTER, Skill.DART],
          address: address,
          yearsOfExperience: yearsOfExperience,
        );

  Employee.generic({
    required String name,
    required double baseSalary,
    required Address address,
    required int yearsOfExperience,
  }) : this(
          name: name,
          baseSalary: baseSalary,
          skills: [Skill.OTHER],
          address: address,
          yearsOfExperience: yearsOfExperience,
        );

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  void printDetails() {
    String skillNames = _skills.map((skill) => skill.name).join(', ');
    print('Employee: $name');
    print('Base Salary: \$${baseSalary.toStringAsFixed(2)}');
    print('Skills: $skillNames');
    print('Address: $address');
    print('Years of Experience: $yearsOfExperience');
  }
}

void main() {

  Address address1 = Address(
    street: '6A Street',
    city: 'Phnom Penh',
    zipCode: '94101',
  );

  Employee mobileDev = Employee.mobileDeveloper(
    name: 'Sokea',
    baseSalary: 50000,
    address: address1,
    yearsOfExperience: 5,
  );
  mobileDev.printDetails();

  print(''); 
  Employee genericEmp = Employee.generic(
    name: 'Ronan',
    baseSalary: 45000,
    address: address1,
    yearsOfExperience: 3,
  );
  genericEmp.printDetails();
}
