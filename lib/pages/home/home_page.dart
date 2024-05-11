import 'package:flutter/material.dart';
import 'package:json_testing/pages/home/components/model/user_model.dart';
import 'package:json_testing/pages/home/components/api/api_fatch.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/FetchData");
              },
              child: Text(
                "FetchData",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: FutureBuilder(
          future: getUserData(),
          builder: (context, model) {
            List<UserModelList>? data = model.data;
            if (data == null || data.isEmpty) {
              return Center(child: Text("Wait Data is fatching"));
            } else {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final mode = data[index];
                  return ListTile(
                    title: Text(mode.email),
                  );
                },
              );
            }
          }),
    );
  }
}
