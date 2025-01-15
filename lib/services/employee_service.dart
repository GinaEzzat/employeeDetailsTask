import 'dart:convert';
import 'package:employee_data/models/employee_model.dart';
import 'package:http/http.dart' as http;

class EmployeeService {
  String endpoint = "https://jsonplaceholder.typicode.com/users";

  Future<List<Employee>>
      getEmployees() async //the request is not getting in time
  {
    List<Employee> employees = [];
      final response = await http
          .get(Uri.parse(endpoint)); //parsing the String endpoint to a url
      var data = jsonDecode(response
          .body); //decoding the json data coming from the response variable
      data.forEach((json) {
        Employee employee = Employee.fromJson(json);
        employees.add(employee);
      });
    return employees;
  }
}
