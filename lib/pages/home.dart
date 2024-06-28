import 'package:flutter/material.dart';
import 'package:pulse_tech/backend/functions.dart';
import 'package:pulse_tech/components/appbar.dart';
import 'package:pulse_tech/components/newsbox.dart';
import 'package:pulse_tech/utils/colors.dart';
import 'package:pulse_tech/utils/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;

  @override
  void initState() {
    super.initState();
    news = fetchnews();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: appbar(),
      body: Column(
        children: [
          const SearchBar(),
          Expanded(
            child: Container(
              width: w,
              child: FutureBuilder<List>(
                future: fetchnews(),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context,index){
                        return Newsbox(
                          imageurl: snapshot.data![index]["urlToImage"] != null ? snapshot.data![index]["urlToImage"] : Constants.imageurl,
                          title: snapshot.data![index]["title"],
                          description: snapshot.data![index]["description"].toString(),
                          time: snapshot.data![index]["publishedAt"],
                          url: snapshot.data![index]["url"],
                        );
                      });
                  }
                  else if(snapshot.hasError){
                    return Text("${snapshot.error}");
                  }

                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
