import 'dart:convert';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smartgarbage/screens/home.dart';
import 'package:status_alert/status_alert.dart';

class TaskEmployee extends StatefulWidget {
  const TaskEmployee({Key? key}) : super(key: key);

  @override
  State<TaskEmployee> createState() => _TaskEmployeeState();
}

class _TaskEmployeeState extends State<TaskEmployee> {
  Future getTask() async {
    var cacheManager = await APICacheManager().getCacheData("username");
    var url = Uri.parse(
        'https://smart-garbage-api.herokuapp.com/api/tasks/${cacheManager.syncData}');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // print(data);
      return data;
    }
  }

  Future getTasks() async {
    var cacheManager = await APICacheManager().getCacheData("username");
    var url = Uri.parse(
        'https://smart-garbage-api.herokuapp.com/api/employee/${cacheManager.syncData}');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // var data = jsonDecode(response.body);
      // var tasknum = data[0]['tasks'];
      // tasknum += 1;
      var data = await http.patch(url);
      print(data.body);
    }
  }

  Future markComplete() async {
    var cacheManager = await APICacheManager().getCacheData("username");
    await getTasks();

    // print(tasknum);
    var url = Uri.parse(
        'https://smart-garbage-api.herokuapp.com/api/tasks/${cacheManager.syncData}');

    var response = await http.patch(url, body: {
      "status": "Completed",
    });
    if (response.statusCode == 200) {
      print(response.body);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTask();
  }

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
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: getTask(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 200,
                    child: Card(
                      elevation: 3.0,
                      color: Colors.grey[100],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Task Id",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0,
                                      color: Colors.green,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${snapshot.data[index]['taskid']}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${snapshot.data[index]['task_data']}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${snapshot.data[index]['status']}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                ],
                              ),
                            ),
                            snapshot.data[index]['status'] == "Pending"
                                ? Expanded(
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        await markComplete();
                                        StatusAlert.show(
                                          context,
                                          duration: const Duration(seconds: 2),
                                          title: 'DONE',
                                          subtitle:
                                              'Your Status has Been Marked As Completed !!',
                                          configuration:
                                              const IconConfiguration(
                                            icon: Icons.done,
                                          ),
                                        );
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) => MainPage(),
                                          ),
                                        );
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.deepPurpleAccent),
                                        padding: MaterialStateProperty.all(
                                            const EdgeInsets.all(12)),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        "Mark Complete",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ),
                                  )
                                : const Text("Task Already Completed")
                          ],
                        ),
                      ),
                    ),
                  );
                },
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





// Container(
//                 height: 200,
//                 child: Card(
//                   elevation: 3.0,
//                   color: Colors.grey[100],
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 10.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Expanded(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const Text(
//                                 "Task Id",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 30.0,
//                                   color: Colors.green,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Text(
//                                 "${snapshot.data[0]['taskid']}",
//                                 style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 30.0,
//                                   color: Colors.green,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "${snapshot.data[0]['task_data']}",
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20.0),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "${snapshot.data[0]['status']}",
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20.0),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );