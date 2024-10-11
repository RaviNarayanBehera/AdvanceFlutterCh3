import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
        centerTitle: true,
      ),
      body: StreamBuilder(stream: Connectivity().onConnectivityChanged, builder:
      (context, snapshot) {
        if(snapshot.data!.contains(ConnectivityResult.mobile))
          {
              return const Center(child: CircularProgressIndicator());
          }
        else
          {
            return const Center(child: CircularProgressIndicator(backgroundColor: Colors.black,));
          }
      },),
    );
  }
}
