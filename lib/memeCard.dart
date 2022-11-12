import 'package:flutter/material.dart';
import 'package:share/share.dart';

class MemeCard extends StatelessWidget {
  final String user;
  final String title;
  final String ImageUrl;
  final String postUrl;
  const MemeCard(
      {super.key,
      required this.user,
      required this.title,
      required this.ImageUrl,
      required this.postUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Posted by u/$user',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Image(
            image: NetworkImage(
              ImageUrl,
            ),
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              backgroundColor: Colors.grey.shade700,
            ),
            onPressed: () async {
              String PostUrl = postUrl;
              await Share.share(PostUrl);
            },
            child: Text(
              "Share",
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
