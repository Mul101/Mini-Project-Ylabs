import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/controller/karya_controller.dart';
import 'package:mini_project/view/summary_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // https://youtu.be/FPcl1tu0gDs
    // final ScrollController _controllerOne = ScrollController();

    // Icon searchIcon = Icon(Icons.search);
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Kreatoon"),
          backgroundColor: Colors.black,
          // leading: IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.search),
          // ),
          actions: [
            IconButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => SearchPage())),
                icon: Icon(Icons.search))
          ],
        ),
        // https://youtu.be/FDNitOxpUks
        //https://youtu.be/0oluasuzt6U

        body: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kreatoon Populer",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 24,
                    color: Color(0xffff0b748),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Color(0xffff0b748),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(5)),
            Container(height: 159, child: Populer()),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rekomendasi",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 24,
                    color: Color(0xffff0b748),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Color(0xffff0b748),
                ),
              ],
            ),
            Container(height: 159, child: Rekomendasi()),
            Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Jadwal Baru",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 24,
                    color: Color(0xffff0b748),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Color(0xffff0b748),
                ),
              ],
            ),
            Container(height: 159, child: Jadwal()),
            Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Favorit Saya",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 24,
                    color: Color(0xffff0b748),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Color(0xffff0b748),
                ),
              ],
            ),
            Container(height: 159, child: Favorit()),
          ]),
        ));
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // The search area here
          title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.black54, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Colors.white70,
                  ),
                  onPressed: () {
                    /* Clear the search field */
                  },
                ),
                hintText: 'Search Comic',
                border: InputBorder.none),
          ),
        ),
      )),
    );
  }
}

class Populer extends StatefulWidget {
  @override
  _PopulerState createState() => _PopulerState();
}

class _PopulerState extends State<Populer> {
  KaryaController karyaController = Get.put(KaryaController());

  @override
  Widget build(BuildContext context) {
    return Scrollbar(child: Obx(() {
      if (karyaController.isLoading.value)
        return Center(child: CircularProgressIndicator());
      else
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: karyaController.karyaList.length,
            itemBuilder: (BuildContext context, int index) {
              var karya = karyaController.karyaList[index];
              return InkWell(
                  onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SummaryPage(karya)))
                      },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          //color: Colors.blue,
                          elevation: 5.0,
                          child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Image.network(
                                  karya.image.toString(),
                                  height: 159,
                                  width: 139,
                                  fit: BoxFit.fill,
                                ),
                                Positioned(
                                    bottom: 21,
                                    child: Card(
                                        color: Colors.black,
                                        child: Text(
                                          karya.title.toString(),
                                          style: GoogleFonts.nunitoSans(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )))
                                // Image.network(karya.image.toString())
                              ])),
                    ],
                  )
                  // ])
                  );
            });
    }));
  }
}

class Rekomendasi extends StatefulWidget {
  @override
  _RekomendasiState createState() => _RekomendasiState();
}

class _RekomendasiState extends State<Rekomendasi> {
  KaryaController karyaController = Get.put(KaryaController());

  @override
  Widget build(BuildContext context) {
    return Scrollbar(child: Obx(() {
      if (karyaController.isLoading.value)
        return Center(child: CircularProgressIndicator());
      else
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: karyaController.karyaList.length,
            itemBuilder: (BuildContext context, int index) {
              var karya = karyaController.karyaList[index];
              return InkWell(
                  onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SummaryPage(karya)))
                      },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          //color: Colors.blue,
                          elevation: 5.0,
                          child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Image.network(
                                  karya.image.toString(),
                                  height: 159,
                                  width: 139,
                                  fit: BoxFit.fill,
                                ),
                                Positioned(
                                    bottom: 21,
                                    child: Card(
                                        color: Colors.black,
                                        child: Text(
                                          karya.title.toString(),
                                          style: GoogleFonts.nunitoSans(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )))
                              ])),
                    ],
                  ));
            });
    }));
  }
}

class Jadwal extends StatefulWidget {
  @override
  _JadwalState createState() => _JadwalState();
}

class _JadwalState extends State<Jadwal> {
  KaryaController karyaController = Get.put(KaryaController());

  @override
  Widget build(BuildContext context) {
    return Scrollbar(child: Obx(() {
      if (karyaController.isLoading.value)
        return Center(child: CircularProgressIndicator());
      else
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: karyaController.karyaList.length,
            itemBuilder: (BuildContext context, int index) {
              var karya = karyaController.karyaList[index];
              return InkWell(
                  onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SummaryPage(karya)))
                      },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          //color: Colors.blue,
                          elevation: 5.0,
                          child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Image.network(
                                  karya.image.toString(),
                                  height: 159,
                                  width: 139,
                                  fit: BoxFit.fill,
                                ),
                                Positioned(
                                    bottom: 21,
                                    child: Card(
                                        color: Colors.black,
                                        child: Text(
                                          karya.title.toString(),
                                          style: GoogleFonts.nunitoSans(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )))
                                // Image.network(karya.image.toString())
                              ])),
                    ],
                  )
                  // ])
                  );
            });
    }));
  }
}

class Favorit extends StatefulWidget {
  @override
  _FavoritState createState() => _FavoritState();
}

class _FavoritState extends State<Favorit> {
  KaryaController karyaController = Get.put(KaryaController());

  @override
  Widget build(BuildContext context) {
    return Scrollbar(child: Obx(() {
      if (karyaController.isLoading.value)
        return Center(child: CircularProgressIndicator());
      else
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: karyaController.karyaList.length,
            itemBuilder: (BuildContext context, int index) {
              var karya = karyaController.karyaList[index];
              return InkWell(
                  onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SummaryPage(karya)))
                      },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          //color: Colors.blue,
                          elevation: 5.0,
                          child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Image.network(
                                  karya.image.toString(),
                                  height: 159,
                                  width: 139,
                                  fit: BoxFit.fill,
                                ),
                                Positioned(
                                    bottom: 21,
                                    child: Card(
                                        color: Colors.black,
                                        child: Text(
                                          karya.title.toString(),
                                          style: GoogleFonts.nunitoSans(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )))
                              ])),
                    ],
                  ));
            });
    }));
  }
}
