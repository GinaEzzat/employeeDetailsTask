import 'package:employee_data/models/employee_model.dart';
import 'package:employee_data/services/employee_service.dart';
import 'package:employee_data/views/employeeDetails.dart';
import 'package:flutter/material.dart';

class EmployeeData extends StatefulWidget {
  const EmployeeData({super.key});

  @override
  State<EmployeeData> createState() => _EmployeeDataState();
}

class _EmployeeDataState extends State<EmployeeData> {
  List<Employee> employee = [];
  bool loading = true;

// function to get employee data
  getEmployee() async {
    employee = await EmployeeService().getEmployees();
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getEmployee();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading ?
      Center(
        child: CircularProgressIndicator(),
      )
        : ListView.builder(
            itemCount: employee.length,
            itemBuilder: (context, index) {
              return 
              InkWell(
          onTap: () {
            Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EmployeeDetails(employeedetail: employee[index],)));
          },
          child:ListTile(
                title: Text(employee[index].name),
                subtitle: Text(employee[index].username),
               ) );
            },
          ),
    );
  }
}
