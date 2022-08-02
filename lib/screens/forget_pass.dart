import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  static const String id = "Forgot_Password";
  ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/images/Logo.png'),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Recover Password'.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  color: Color.fromRGBO(102, 110, 243, 2.0),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.0,
                      color: const Color.fromRGBO(102, 110, 243, 2.0),
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    controller: _emailcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email Is Required";
                      }
                    },
                    // onSaved: (value) {
                    //   _emailcontroller.text = value!;
                    // },
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(5.0),
                      label: const Text("Email Address"),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(143, 148, 251, 1.0),
                        Color.fromRGBO(143, 148, 251, 0.6),
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Recover",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
