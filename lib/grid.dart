import 'package:apnirasoi/billing.dart';
import 'package:apnirasoi/foodlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
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
              child: Row(
                children: [
                  Icon(
                    Icons.shopping_bag,
                    size: 50,
                  ),
                  Text(
                    "My Cart",
                    style: GoogleFonts.notoSerif(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // list view of cart
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cartitem.length,
                  padding: EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Container(
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
                                ' ₹ ${cartitem[index][1]} X ${cartitem[index][4]}',
                                style: const TextStyle(fontSize: 12),
                              ),
                              trailing: IconButton(
                                  icon: const Icon(Icons.cancel),
                                  onPressed: () => setState(() {
                                        cartitem.removeAt(index);
                                      })),
                            ),
                          ),
                        ],
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
                    IconButton(
                        onPressed: () {
                          print('object');
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  scrollable: true,
                                  elevation: 5,
                                  title: Text(
                                    "Order Details",
                                    textAlign: TextAlign.center,
                                  ),
                                  content: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    height:
                                        100.0, // Change as per your requirement
                                    width: MediaQuery.of(context).size.width,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: cartitem.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return ListTile(
                                          title: Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                        '${cartitem[index][0]} X ${cartitem[index][4]}'),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          trailing: Text(
                                              cartitem[index][1].toString()),
                                        );
                                      },
                                    ),
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(height: 10.0),
                                        Text('Delivery Charges: ₹50'),
                                        ElevatedButton(
                                          child: Text(
                                              'Total ${calci().toString()}'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                );
                              });
                        },
                        icon: Icon(Icons.arrow_upward)),
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

                    // pay now
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green.shade200),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
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
                        ],
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
