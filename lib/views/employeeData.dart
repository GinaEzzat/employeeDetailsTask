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

    // loading cached data
    employee = await EmployeeService().loadCachedEmployees();
    setState(() {});

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
      appBar: AppBar(
        centerTitle: true,
        title: Text("Employees List"),
        backgroundColor: Colors.blueGrey,
      ),
      body: loading ?
      Center(
        child: CircularProgressIndicator(),
      )
        : employee.isEmpty
        ? Center(
          child: Text("no employees"),
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
