import 'package:apnirasoi/foodlist.dart';
import 'package:flutter/material.dart';

class OrderDetailsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Order Details'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          OrderItemWidget('${l[0][0]}', 10.0),
          OrderItemWidget('Item 2', 15.0),
          OrderItemWidget('Item 3', 12.0),
          SizedBox(height: 10.0),
          Text('Delivery Charges: ₹50'),
        ],
      ),
      actions: [
        Text('Total: ₹87'),
        ElevatedButton(
          child: Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class OrderItemWidget extends StatelessWidget {
  final String itemName;
  final double price;

  OrderItemWidget(this.itemName, this.price);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(itemName),
        Text('₹$price'),
      ],
    );
  }
}
