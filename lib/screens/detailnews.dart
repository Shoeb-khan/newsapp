import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/screens/homeController.dart';
import 'package:newsapp/screens/models/newsModel.dart';

class DetailNews extends StatefulWidget {
  const DetailNews({Key? key}) : super(key: key);

  @override
  _DetailNewsState createState() => _DetailNewsState();
}

class _DetailNewsState extends State<DetailNews> {
  Articles articles = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView(
          children: [
            ClipRRect(
              child: Image(
                  image: NetworkImage(articles.urlToImage!),
              )
            ),

            SizedBox(height: 12.0),
            Text("news.title, style: kTitleCard.copyWith(fontSize: 28.0)"),
            SizedBox(height: 15.0),
            Row(
              children: [
                Text(""),
                SizedBox(width: 5.0),
                SizedBox(
                  width: 10.0,
                  child: Divider(
                    height: 1.0,
                  ),
                ),
                SizedBox(width: 5.0),
                Text(
               ""
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Text(
              "",
            ),
            SizedBox(height: 25.0)
          ],
        ),
      ),
    );
  }
}
