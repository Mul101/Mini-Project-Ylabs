import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/controller/karya_controller.dart';
import 'package:mini_project/model/karya.dart';
import 'package:mini_project/view/home_page.dart';
import 'package:mini_project/view/read_comic.dart';

class SummaryPage extends StatelessWidget {
  KaryaController karyaController = Get.put(KaryaController());
  late Karya karya;
  SummaryPage(this.karya);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Kreatoon",
          style: TextStyle(color: Colors.amber[800]),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              // Navigator.pushNamed(context, '/navigation');
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.amber[800],
            )),
      ),
      backgroundColor: Colors.black,
      body: ListView(shrinkWrap: true, children: <Widget>[
        Container(
            margin: EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: GestureDetector(
                              onTap: () {
                                print("tapped");
                              },
                              child: Container(
                                width: 45,
                                height: 45,
                                child: Card(
                                  color: Colors.grey[400]!.withOpacity(0.5),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.bookmark,
                                        color: Colors.amber[800],
                                        size: 20,
                                      )),
                                ),
                              ),
                            )),
                      ),
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                          karya.image.toString(), //image
                        ),
                      ))),
                  SecondLineKreatoon(),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(karya.title.toString(),
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.yellow[800],
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        karya.desc.toString(),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )),
                  Column(
                    children: [
                      //karena i++ jadinya i=1 bkan i=0 lagi
                      for (int i = 0; i < karya.data!.length; i++)
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReadComic(karya, i)),
                              );
                            },
                            child: Column(
                              children: [
                                Card(
                                  color: Colors.grey[900],
                                  child: Column(
                                    children: [
                                      ListTile(
                                          leading: Image.network(
                                            karya.image.toString(),
                                            fit: BoxFit.cover,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                          ),
                                          title: Text(karya.title.toString(),
                                              style: TextStyle(
                                                color: Colors.yellow[800],
                                                fontWeight: FontWeight.bold,
                                              )),
                                          subtitle: Text(
                                              karya.data![i].chapter.toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              )))
                                    ],
                                  ),
                                ),
                              ],
                            )),
                    ],
                  ),
                ])),
      ]),
    );
  }
}

class SecondLineKreatoon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.only(right: 3, bottom: 5, left: 5, top: 7),
            child: Icon(
              Icons.circle,
              color: Colors.yellow[800],
              size: 10,
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: Text("Favorit Saya",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.normal)),
          )
        ]),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(right: 3, bottom: 5, left: 140, top: 7),
              child: Icon(
                Icons.visibility,
                color: Colors.white,
                size: 15,
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 3, bottom: 5, top: 5, right: 5),
                child: Text(
                  "10K",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ))
          ],
        )
      ],
    );
  }
}
