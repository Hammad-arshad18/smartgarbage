import 'package:flutter/material.dart';
import 'package:smartgarbage/screens/home.dart';
import 'package:http/http.dart' as http;
import 'package:status_alert/status_alert.dart';

class Comlaint extends StatefulWidget {
  const Comlaint({Key? key}) : super(key: key);

  @override
  State<Comlaint> createState() => _ComlaintState();
}

class _ComlaintState extends State<Comlaint> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _complainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Task'),
        backgroundColor: const Color.fromRGBO(143, 148, 251, 1.0),
        elevation: 2.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => MainPage()));
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
              const Image(
                image: AssetImage('assets/images/Logo.png'),
                height: 170,
              ),
              const Text(
                "Your Complain",
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
                    labelText: 'Name',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    border: OutlineInputBorder()),
                onChanged: (value) {
                  _nameController.text = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 3) {
                    return 'Name must contain at least 3 characters';
                  } else if (value.contains(RegExp(r'^[0-9_\-=@,\.;]+$'))) {
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
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 3) {
                    return 'Last Name must contain at least 3 characters';
                  }
                },
                onChanged: (value) {
                  _emailController.text = value;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Details',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                ),
                keyboardType: TextInputType.multiline,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Details Field Is Required!';
                  }
                },
                onChanged: (value) {
                  _complainController.text = value;
                },
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
                    await postComplaint(
                      name: _nameController.text,
                      email: _emailController.text,
                      complain: _complainController.text,
                    );
                    StatusAlert.show(
                      context,
                      duration: const Duration(seconds: 2),
                      title: 'DONE',
                      subtitle: 'Your Status has Been Marked As Completed !!',
                      configuration: const IconConfiguration(
                        icon: Icons.done,
                      ),
                    );
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => MainPage()));
                  }
                },
                child: const Text("Submit"),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Future postComplaint(
      {required name, required email, required complain}) async {
    var url =
        Uri.parse('https://smart-garbage-api.herokuapp.com/api/contactsapi/');
    var jsonData = {"name": name, "email": email, "comment": complain};
    var response = await http.post(url, body: jsonData);
    print(response.body);
    // if (response.statusCode == 200) {
    //   // _nameController = _emailController = _complainController = "";
    //   print(response.body);
    // }
  }
}
