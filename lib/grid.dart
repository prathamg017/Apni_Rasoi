import 'package:apnirasoi/billing.dart';
import 'package:apnirasoi/foodlist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:provider/provider.dart';

// import '../model/cart_model.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _number = TextEditingController();
  final TextEditingController _address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.grey[800],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Let's order fresh items for you
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "My Cart",
                style: GoogleFonts.notoSerif(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // list view of cart
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView.builder(
                  itemCount: cartitem.length,
                  padding: EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8)),
                        child: ListTile(
                          leading: Image.network(
                            cartitem[index][3],
                            height: 36,
                          ),
                          title: Text(
                            cartitem[index][0],
                            style: const TextStyle(fontSize: 18),
                          ),
                          subtitle: Text(
                            '\₹' + cartitem[index][1],
                            style: const TextStyle(fontSize: 12),
                          ),
                          trailing: IconButton(
                              icon: const Icon(Icons.cancel),
                              onPressed: () => setState(() {
                                    cartitem.removeAt(index);
                                  })),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // total amount + pay now

            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.green,
                ),
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          '\₹${calci()}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    // pay now
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green.shade200),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: GestureDetector(
                        onTap: () {
                          // FocusManager.instance.primaryFocus?.unfocus();

                          // var whatsappUrl =
                          //     "whatsapp://send?phone=${'+91' + '8109224176'}" +
                          //         "&text=${Uri.encodeComponent('hello ! this is my order')}";
                          // try {
                          //   launch(whatsappUrl);
                          // } catch (e) {
                          //   //To handle error and display error message
                          //   print(' error');
                          // }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => billinpage(
                                    name: _name,
                                    number: _number,
                                    address: _address),
                              ));
                        },
                        child: Wrap(
                          children: const [
                            Text(
                              'Address',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
