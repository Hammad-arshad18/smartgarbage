import 'package:flutter/material.dart';

class EmployeeYear extends StatefulWidget {
  EmployeeYear({Key? key}) : super(key: key);

  @override
  State<EmployeeYear> createState() => _EmployeeYearState();
}

class _EmployeeYearState extends State<EmployeeYear> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Color.fromRGBO(143, 148, 251, 1.0),
        title: const Text("Employee Of The Year"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150.0,
                width: 150.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/trophy.png"),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Employee Of The Year Award Goes To\nHammad Arshad"
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
