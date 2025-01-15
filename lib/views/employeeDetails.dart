// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:employee_data/models/employee_model.dart';

class EmployeeDetails extends StatefulWidget {
  Employee employeedetail;
  EmployeeDetails({
    Key? key,
    required this.employeedetail,
  }) : super(key: key);

  @override
  State<EmployeeDetails> createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  bool loading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Page",textAlign: TextAlign.center,),
      ),
      body: Container(
        child: Column(
          children: [
            Icon(Icons.person_rounded,
            size: 150,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Full Name",style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
                        )
                      ],
                    ),
                  ),
                  Text(widget.employeedetail.name)
                ],
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Icon(Icons.person,color: Colors.grey,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Username",style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
                        )
                      ],
                    ),
                  ),
                  Text(widget.employeedetail.username)
                ],
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Icon(Icons.email_rounded),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Email",style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
                        )
                      ],
                    ),
                  ),
                  Text(widget.employeedetail.email)
                ],
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Icon(Icons.phone),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Phone Number",style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
                        )
                      ],
                    ),
                  ),
                  Text(widget.employeedetail.phone)
                ],
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Icon(Icons.web),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Website",style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
                        )
                      ],
                    ),
                  ),
                  Text(widget.employeedetail.website)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}