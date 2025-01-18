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
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final response =
          await Dio().get(endpoint); //parsing the String endpoint to a url
      var data = response
          .data; //decoding the json data coming from the response variable
          print("data is fetched from network");
      var cachedData = jsonEncode(data);
      prefs.setString("employeeData", cachedData);
      print("data cached locally");
      data.forEach((json) {
        Employee employee = Employee.fromJson(json);
        employees.add(employee);
      });
    } catch (e) {
      print(e.toString());
      String? employeeData = prefs.getString("employeeData");
      if (employeeData != null) {
        List<dynamic> jsondata = jsonDecode(employeeData);
        employees = jsondata.map((json) => Employee.fromJson(json)).toList();
        
      }
    }
    return employees;
  }

  Future<List<Employee>> loadCachedEmployees() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? employeeData = prefs.getString("employeeData");
    if (employeeData != null) {
      List<dynamic> jsonData = jsonDecode(employeeData);
      return jsonData.map((json) => Employee.fromJson(json)).toList();
      
    }
    print("cached data is loaded");
    return [];
  }
}
