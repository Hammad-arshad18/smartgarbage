import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  static const String id = "Register";

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var isobsecure = true;
  var passfieldicon = Icon(Icons.visibility);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            Flexible(
              child: Container(
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background.png'),
                      fit: BoxFit.fill),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      width: 80.0,
                      height: 180,
                      left: 15.0,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/images/light-1.png'),
                        )),
                      ),
                    ),
                    Positioned(
                      width: 80.0,
                      height: 100,
                      left: 80.0,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/images/light-1.png'),
                        )),
                      ),
                    ),
                    Positioned(
                      width: 80.0,
                      height: 100.0,
                      right: 50.0,
                      top: 20.0,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/clock.png'))),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(143, 148, 251, .2),
                          blurRadius: 10.0,
                          offset: Offset(0, 10),
                        ),
                      ],
                      border: Border.all(
                        color: Color.fromRGBO(143, 148, 251, .2),
                        width: 2.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "UserName",
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(5.0),
                              label: const Text("UserName"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                          child: Divider(
                            thickness: 1.4,
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(5.0),
                              label: const Text("Email Address"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                          child: Divider(
                            thickness: 1.4,
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: isobsecure,
                            decoration: InputDecoration(
                              hintText: "Password",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (isobsecure) {
                                      isobsecure = false;
                                      passfieldicon =
                                          Icon(Icons.visibility_off);
                                    } else {
                                      isobsecure = true;
                                      passfieldicon = Icon(Icons.visibility);
                                    }
                                  });
                                },
                                icon: passfieldicon,
                                tooltip: "Visibility Button",
                              ),
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(5.0),
                              label: Text("Password"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 50.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(143, 148, 251, 1.0),
                          Color.fromRGBO(143, 148, 251, 0.6),
                        ],
                      ),
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: const Center(
                        child: Text(
                          "Register",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Already Have An Account ? Login",
                          style: TextStyle(
                              color: Color.fromRGBO(102, 110, 243, 2.0),
                              fontWeight: FontWeight.w500),
                        ),
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
