import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuantityButton extends StatelessWidget {
  final quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  QuantityButton({
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: onDecrease,
        ),
        Text(
          quantity.toString(),
          style: TextStyle(fontSize: 18),
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: onIncrease,
        ),
      ],
    );
  }
}
