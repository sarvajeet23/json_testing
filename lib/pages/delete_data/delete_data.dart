import 'dart:async';

import 'package:flutter/material.dart';
import 'package:json_testing/pages/delete_data/components/api/api_fatch.dart';
import 'package:json_testing/pages/delete_data/components/model/model.dart';

class DeleteData extends StatefulWidget {
  const DeleteData({super.key});

  @override
  State<DeleteData> createState() {
    return _DeleteDataState();
  }
}

class _DeleteDataState extends State<DeleteData> {
  late Future<AlbumDeleteModel> _futureAlbum;

  @override
  void initState() {
    super.initState();
    _futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Delete Data Example',
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
                Navigator.pushNamed(context, "/WebSocket");
              },
              child: Text(
                "WebSocket",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: Center(
        child: FutureBuilder<AlbumDeleteModel>(
          future: _futureAlbum,
          builder: (context, snapshot) {
            // If the connection is done,
            // check for response data or an error.
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(snapshot.data?.title ?? 'Deleted'),
                    ElevatedButton(
                      child: const Text(
                        'Delete Data',
                      ),
                      onPressed: () {
                        setState(() {
                          _futureAlbum = deleteAlbum(snapshot.data!.id.toString());
                        });
                      },
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
