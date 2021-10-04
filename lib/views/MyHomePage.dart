import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:technews/components/NewsBox.dart';
import 'package:technews/components/Searchbar.dart';
import 'package:technews/components/appbar.dart';
import 'package:technews/function/fetching.dart';
import 'package:technews/utils/Constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List> news;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    news = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: appbar(),
      body: Column(
        children: [
          SearchBar(),
          Expanded(
              child: FutureBuilder<List>(
            future: fetchNews(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return NewsBox(
                      description:
                          snapshot.data![index]['description'].toString(),
                      imageurl: snapshot.data![index]['urlToImage'] != null
                          ? snapshot.data![index]['urlToImage']
                          : Constants.imageurl,
                      title: snapshot.data![index]['title'],
                      time: snapshot.data![index]['publishedAt'],
                      url: snapshot.data![index]['url'],
                    );
                  },
                );
              }
              return Center();
            },
          )),
        ],
      ),
    );
  }
}
