import 'dart:async';

import 'package:flutter/material.dart';
import 'package:json_testing/pages/create_sending/components/api/api_code.dart';
import 'package:json_testing/pages/create_sending/components/model/model.dart';
import 'package:json_testing/utility/size_box.dart';

class CreateData extends StatefulWidget {
  const CreateData({super.key});

  @override
  State<CreateData> createState() {
    return _CreateDataState();
  }
}

class _CreateDataState extends State<CreateData> {
  final TextEditingController _controller = TextEditingController();
  Future<CreateAlbumModel>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Data Example',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/UpdateData");
              },
              child: Text(
                "UpdateData",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Enter Title'),
        ),
        hsize10,
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = createAlbum(_controller.text);
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<CreateAlbumModel> buildFutureBuilder() {
    return FutureBuilder<CreateAlbumModel>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.title);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
