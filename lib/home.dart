import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: Image(
                  image: NetworkImage(
                      'https://preview.redd.it/t27nptny6lz91.jpg?width=320&crop=smart&auto=webp&s=006818ff78916d945bbd2df82567556966cc133a'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
