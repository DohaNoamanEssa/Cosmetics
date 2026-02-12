import 'package:flutter/material.dart';

class Streams extends StatefulWidget {
  const Streams({super.key});

  @override
  State<Streams> createState() => _StreamsState();
}

class _StreamsState extends State<Streams> {
  final stream =Stream.periodic(Duration(seconds: 90));
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

// appBar: AppBar(title: Text("Streams")),
// // body: Center(child: StreamBuilder(
// //     stream: stream, builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {  },
// // ),
// ),
