import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EmployeeYear extends StatefulWidget {
  EmployeeYear({Key? key}) : super(key: key);

  @override
  State<EmployeeYear> createState() => _EmployeeYearState();
}

class _EmployeeYearState extends State<EmployeeYear> {
  Future getAwardEmployee() async {
    var url = Uri.parse('https://smart-garbage-api.herokuapp.com/api/awards/');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data['username']);
      return data;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAwardEmployee();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Color.fromRGBO(143, 148, 251, 1.0),
        centerTitle: true,
        title: const Text("Employee Of The Year"),
      ),
      body: Center(
        child: FutureBuilder(
          future: getAwardEmployee(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return Container(
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
                      "Employee Of The Month Award Goes To\n${snapshot.data['username']}"
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
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
