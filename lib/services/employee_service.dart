import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:employee_data/models/employee_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployeeService {
  String endpoint = "https://jsonplaceholder.typicode.com/users";

  Future<List<Employee>>
      getEmployees() async //the request is not getting in time
  {
    List<Employee> employees = [];
    try {
      final response =
          await Dio().get(endpoint); //parsing the String endpoint to a url
      var data = response
          .data; //decoding the json data coming from the response variable
      var cachedData = jsonEncode(data);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("userData", cachedData);
      data.forEach((json) {
        Employee employee = Employee.fromJson(json);
        employees.add(employee);
      });
    } catch (e) {
      print(e.toString());
    }
    return employees;
  }
}
