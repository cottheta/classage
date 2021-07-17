import 'package:classage/library/tests.dart';
import 'package:classage/library/tests/pages/testPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Assignments.dart';


class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> with TickerProviderStateMixin {
  bool _visible = false;
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 8),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 160,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TestPage()),
                  );

                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  )
                ),
                child: Text(
                  "Tests",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 160,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ElevatedButton(
                onPressed: () {/*
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Assignments()),
                  );
                  */
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    )
                ),
                child: Text(
                  "Assignments",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/2-10 ,
                  height: 140,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue[50],
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        )
                    ),
                    child: Text(
                      "Notes",
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2-10,
                  height: 140,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.amber[50],
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        )
                    ),
                    child: Text(
                      "Papers",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            )
          ],
        ),
      ),


      /*
      floatingActionButton: SpeedDial(
        child: Icon(
          Icons.post_add_rounded,
          size: 28,
        ),
        closedForegroundColor: Colors.white,
        openForegroundColor: Colors.lightBlue,
        closedBackgroundColor: Colors.lightBlue,
        openBackgroundColor: Colors.white,

        controller: AnimationController(
            vsync: this,
            duration: Duration(milliseconds: 80)),

        speedDialChildren: <SpeedDialChild>[
          SpeedDialChild(
            child: Icon(Icons.camera_alt),
            foregroundColor: Colors.cyan,
            backgroundColor: Colors.cyan[50],
            label: 'Let\'s start a run!',
            onPressed: () {
              setState(() {});
            },
            closeSpeedDialOnPressed: false,
          ),
          SpeedDialChild(
            child: Icon(Icons.image),
            foregroundColor: Colors.orange,
            backgroundColor: Colors.,
            label: 'Let\'s go for a walk!',
            onPressed: () {
              setState(() {});
            },
          ),
        ],
      ),


      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 350,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                          child: Container(height: 3, width: 70,color: Colors.blueGrey,)),
                      OutlinedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.purple[300],
                              child: Icon(
                                Icons.image,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Image to Pdf",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.lightBlue[300],
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Scan to Pdf",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(context, createPdf(context));
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.green[300],
                              child: Icon(
                                Icons.text_fields,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Text to Pdf",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      OutlinedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.pink[300],
                              child: Icon(
                                Icons.upload_sharp,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Import from device",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
        icon: Icon(Icons.add, size: 32),
        label: Text(
          "Pdf",
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: Colors.lightBlueAccent,
        tooltip: 'more',)

       */
    );
  }
}
