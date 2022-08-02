import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smartgarbage/screens/home.dart';

class Blog extends StatefulWidget {
  const Blog({Key? key}) : super(key: key);

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  Future getBlogs() async {
    var url =
        Uri.parse('https://smart-garbage-api.herokuapp.com/api/blogsapi/');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    }
  }

  // Widget singleBlog() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Blogs',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => MainPage()));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: getBlogs(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Card(
                        elevation: 5,
                        margin: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(children: [
                                  CircleAvatar(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(80.0),
                                      child: const Image(
                                        image: AssetImage(
                                            'assets/images/hammad.jpg'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text("Hammad Arshad"),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.bottomRight,
                                      child: const Text(
                                        "Admin",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            Container(
                              color: Colors.grey[200],
                              padding: const EdgeInsets.all(8),
                              width: double.infinity,
                              child: Text(
                                "${snapshot.data[index]['title']}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Roboto",
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 250,
                              child: Image.asset(
                                "assets/images/Logo.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              color: Colors.grey[200],
                              padding: EdgeInsets.all(8),
                              width: double.infinity,
                              child: Text(
                                  "${snapshot.data[index]['postDetails']}"),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
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
