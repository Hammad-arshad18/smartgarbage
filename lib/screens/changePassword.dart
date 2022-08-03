import 'package:flutter/material.dart';
import 'package:smartgarbage/screens/home.dart';
import 'package:http/http.dart' as http;
import 'package:status_alert/status_alert.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Change Password"),
          backgroundColor: const Color.fromRGBO(143, 148, 251, 1.0),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Image(
                      image: AssetImage('assets/images/Logo.png'),
                    ),
                    const Text(
                      "Change Password",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(102, 110, 243, 2.0),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'UserName',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        _passwordController.text = value;
                      },
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 3) {
                          return 'Name must contain at least 3 characters';
                        } else if (value
                            .contains(RegExp(r'^[0-9_\-=@,\.;]+$'))) {
                          return 'Name cannot contain special characters';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Email',
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 3) {
                          return 'Email Field Is Required';
                        } else if (!value.contains('@')) {
                          return 'Invalid Email';
                        }
                      },
                      onChanged: (value) {
                        _confirmPasswordController.text = value;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(60),
                        primary: const Color.fromRGBO(102, 110, 243, 2.0),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await changePassword(
                              password: _passwordController,
                              confirmPassword: _confirmPasswordController);
                          StatusAlert.show(
                            context,
                            duration: const Duration(seconds: 2),
                            title: 'DONE',
                            subtitle:
                                'Your Status has Been Marked As Completed !!',
                            configuration: const IconConfiguration(
                              icon: Icons.done,
                            ),
                          );
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => MainPage()));
                        }
                      },
                      child: const Text("Submit"),
                    ),
                  ]),
            ),
          ),
        ));
  }

  Future changePassword({required password, required confirmPassword}) async {
    var url =
        Uri.parse('https://smart-garbage-api.herokuapp.com/api/changePassword');
    final jsonData = {
      "username": password,
      "email": confirmPassword
    };
    final header = {"Content-Type": "application/json"};
    var response=await http.post(
      url,
      body: jsonData,
      headers: header,
    );
  }
}
