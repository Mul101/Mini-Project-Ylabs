import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/model/karya.dart';
import 'package:mini_project/view/summary_page.dart';

class ReadComic extends StatelessWidget {
  late Karya karya;
  int index;
  ReadComic(this.karya, this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Episode ${karya.data![index].chapter}',
          style: GoogleFonts.nunitoSans(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => SummaryPage(karya),
            //     ));
          },
          icon: const Icon(Icons.arrow_back_ios,
              size: 16, color: Color(0xffff0b748)),
        ),
      ),
      bottomNavigationBar: _ButtomAppBar(karya, index),
      body: ListView(shrinkWrap: true, children: <Widget>[
        for (int j = 0; j < karya.data![index].image!.length; j++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(15)),
              Image.network(
                karya.data![index].image![j].toString(),
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width / 1.2,
              ),
              Padding(padding: EdgeInsets.all(7))
            ],
          )
      ]),
    );
  }
}

// ignore: must_be_immutable
class _ButtomAppBar extends ReadComic {
  _ButtomAppBar(Karya karya, int index) : super(karya, index);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Colors.black,
      child: IconTheme(
        data: IconThemeData(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
                tooltip: 'back',
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 16,
                ),
                onPressed: () {
                  if (index > 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReadComic(karya, index - 1)));
                  } else {}
                }),
            Text(
              '${karya.data![index].chapter} / ${karya.data!.length}',
              style: GoogleFonts.nunitoSans(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            IconButton(
                tooltip: 'forward',
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
                onPressed: () {
                  if (index < karya.data!.length - 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReadComic(karya, index + 1)));
                  } else {}
                }),
          ],
        ),
      ),
    );
  }
}
