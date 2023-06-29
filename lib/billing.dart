import 'package:apnirasoi/foodlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class billinpage extends StatefulWidget {
  final name;
  final number;
  final address;
  const billinpage(
      {super.key,
      required this.name,
      required this.number,
      required this.address});

  @override
  State<billinpage> createState() => _billinpageState();
}

class _billinpageState extends State<billinpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Address Page',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   height: 200,
            //   color: Colors.white,
            // ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.0),
                    Text('Name'),
                    TextField(
                      controller: widget.name,
                      decoration: InputDecoration(
                        hintText: 'Enter your name',
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text('Number'),
                    TextField(
                      controller: widget.number,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Enter your phone number',
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text('Address'),
                    TextField(
                      controller: widget.address,
                      decoration: InputDecoration(
                        hintText: 'Enter your address',
                      ),
                    ),
                    SizedBox(height: 32.0),
                    Padding(
                      padding: const EdgeInsets.all(36.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.green,
                        ),
                        padding: const EdgeInsets.all(24),
                        child: Wrap(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Price',
                                    style: TextStyle(color: Colors.green[200]),
                                  ),

                                  const SizedBox(height: 8),
                                  // total price
                                  Text(
                                    '₹${calci().toString()}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),

                              // pay now
                              MouseRegion(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.green.shade200),
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  child: GestureDetector(
                                      onTap: () {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();

                                        var whatsappUrl = "whatsapp://send?phone=${'+91' + '8109224176'}" +
                                            "&text=${Uri.encodeComponent('Name :' + widget.name.text + '\n'
                                                'Number: ' + widget.number.text + '\n'
                                                'Address: ' + widget.address.text + '\n'
                                                'Order: ' + content().toString() + '\n' 'Total: ' + calci().toString() + '\n')}";
                                        try {
                                          launch(whatsappUrl);
                                        } catch (e) {
                                          //To handle error and display error message
                                          print('error');
                                        }
                                      },
                                      child: Row(children: const [
                                        Text(
                                          'Order Now',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                      ])),
                                ),
                              ),
                            ]),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// dynamic content() {
//   List<dynamic> l = [];
//   for (int i = 0; i < cartitem.length; i++) {
//     l.add(cartitem[i][0]);
//     l.add(cartitem[i][1]);
//     l.add(cartitem[i][4]);
//   }
//   return l;
// }
dynamic content() {
  String result = '';

  for (int i = 0; i < cartitem.length; i++) {
    String item = '${cartitem[i][0]} X ${cartitem[i][1]} X ${cartitem[i][4]}';
    result += (result.isEmpty ? '' : ', ') + item;
  }

  return result;
}
