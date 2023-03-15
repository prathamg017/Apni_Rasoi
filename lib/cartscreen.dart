import 'package:apnirasoi/foodlist.dart';
import 'package:apnirasoi/grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
// import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:shoppie/cards.dart';

class cartScreen extends StatefulWidget {
  const cartScreen({super.key});

  @override
  State<cartScreen> createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage(),
              ));
        },
        child: Icon(Icons.shopping_bag),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Good Morning',
                  // style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Let's order delicious food",
                    style: GoogleFonts.notoSerif(
                        fontSize: 30, fontWeight: FontWeight.bold)),
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height * .75,
                  // height: 600,
                  child: ListView.builder(
                    itemCount: l.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        height: 180,
                        width: double.maxFinite,
                        child: SingleChildScrollView(
                          child: Card(
                            elevation: 5,
                            child: GFListTile(
                                // margin: EdgeInsets.all(12),
                                avatar: Image.network(l[index][3],
                                    width: 100, height: 100),
                                // padding: EdgeInsets.all(30),
                                title: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    l[index][0],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                description: Text(l[index][2]),

                                // description: l[index][2].toString(),
                                icon: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green),
                                    // hoverColor: Colors.amber,
                                    onPressed: () {
                                      add(index);
                                    },
                                    child: Text(
                                      '₹ ' + l[index][1],
                                      style: TextStyle(color: Colors.black),
                                    ))),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
