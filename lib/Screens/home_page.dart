import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('My App',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          if (snapshot.data!.contains(ConnectivityResult.mobile)) {
            return  Center(child: Column(
              children: [
                Container(
                  height: 500,
                  width: double.infinity,
                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/online.gif')),),
                ),
                const Text('Connected to Internet',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
              ],
            ));
          } else {
            return Center(
              child: Container(
                height: 780,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/offline.gif'),
                      fit: BoxFit.fitHeight),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
