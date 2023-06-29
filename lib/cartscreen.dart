import 'package:animated_text_kit/animated_text_kit.dart';
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

class _cartScreenState extends State<cartScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  static int c = 0;
  List<bool> addToCartList = List.generate(l.length, (index) => false);

  void addToCart(int index) {
    setState(() {
      addToCartList[index] = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
    animation =
        ColorTween(begin: Colors.black, end: Color.fromARGB(255, 235, 183, 167))
            .animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
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
          child: Icon(Icons.shopping_bag)),
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
                child: TypewriterAnimatedTextKit(
                    text: ["Let's Order "],
                    textStyle: GoogleFonts.notoSerif(
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
                                margin: EdgeInsets.all(12),
                                avatar: Image.network(l[index][3],
                                    width: 100, height: 100),
                                // padding: EdgeInsets.all(30),
                                title: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    l[index][0],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                                subTitle: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, bottom: 5),
                                  child: Text('₹' + '${l[index][1]}'),
                                ),
                                // description: Padding(
                                //   padding: const EdgeInsets.only(left: 15),
                                //   child: Text(l[index][2]),
                                // ),

                                // description: l[index][2].toString(),
                                icon: Column(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green),
                                      // hoverColor: Colors.amber,
                                      onPressed: () {
                                        addToCart(index);
                                        add(index);
                                        final scack = SnackBar(
                                          content: const Text('Added to Cart'),
                                          duration: Duration(seconds: 1),
                                          backgroundColor: Color.fromARGB(
                                              255, 218, 160, 109),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(scack);
                                        setState(() {
                                          l[index][4] = 1;
                                        });
                                      },
                                      child: addToCartList[index]
                                          ? Icon(Icons.check)
                                          : Text('Add'),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                if (l[index][4] > 0) {
                                                  Counter.counter = l[index][4];
                                                  Counter.counter++;
                                                  l[index][4] = Counter.counter;
                                                }
                                              });
                                            },
                                            icon: Icon(Icons.add)),
                                        Text(l[index][4].toString()),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                if (l[index][4] > 0) {
                                                  Counter.counter = l[index][4];
                                                  Counter.counter--;
                                                  l[index][4] = Counter.counter;
                                                }
                                              });
                                            },
                                            icon: Icon(Icons.remove)),
                                      ],
                                    ),
                                  ],
                                )),
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
