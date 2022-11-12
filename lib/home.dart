import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meme/memeCard.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> memedata = [];
  getMeme() async {
    try {
      Response response = await http.get(
          Uri.parse('https://meme-api.herokuapp.com/gimme/ProgrammerHumor/50'));
      Map<dynamic, dynamic> data = jsonDecode(response.body);
      setState(() {
        memedata = data['memes'];
      });
    } catch (e) {
      Expanded(
        child: Text(e.toString()),
      );
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getMeme();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey.shade200,
                ),
                child: Text(
                  "ProgrammerHumor",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: memedata.length,
                  itemBuilder: (context, index) => MemeCard(
                    user: memedata[index]['author'],
                    title: memedata[index]['title'],
                    ImageUrl: memedata[index]['url'],
                    postUrl: memedata[index]['postLink'],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
