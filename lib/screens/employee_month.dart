import 'package:flutter/material.dart';

class EmployeeMonth extends StatefulWidget {
  EmployeeMonth({Key? key}) : super(key: key);

  @override
  State<EmployeeMonth> createState() => _EmployeeMonthState();
}

class _EmployeeMonthState extends State<EmployeeMonth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Color.fromRGBO(143, 148, 251, 1.0),
        centerTitle: true,
        title: const Text("Employee Of The Month"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150.0,
                width: 150.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/awards.png"),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Employee Of The Month Award Goes To\nHammad Arshad"
                    .toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  // color: Colors.indigoAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
