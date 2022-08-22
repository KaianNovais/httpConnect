import 'package:fiapuniversity/class.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fiap Project"),
      ),
      body: FutureBuilder<List<UserModel>>(
        future: ApiService().getUser(),
        builder: (context, snapshot) {
          return ListView(
            children: [
              ...snapshot.data!.map(
                (e) => ListTile(
                  title: Text(e.firstname),
                  subtitle: Text(e.lastname),
                  trailing: CircleAvatar(
                    backgroundImage: NetworkImage(e.avatar),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
