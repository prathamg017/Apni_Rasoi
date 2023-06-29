import 'package:apnirasoi/foodlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class addD extends StatefulWidget {
  final addn;
  final addnu;
  final adda;
  const addD(
      {super.key, required this.adda, required this.addn, required this.addnu});

  @override
  State<addD> createState() => _addDState();
}

class _addDState extends State<addD> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Details !'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Name..', border: OutlineInputBorder()),
              controller: widget.addn,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Number..', border: OutlineInputBorder()),
              controller: widget.addnu,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Address', border: OutlineInputBorder()),
              controller: widget.adda,
            ),
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       UserDetails.add(widget.addn.toString());
          //       UserDetails.add(widget.addnu.toString());
          //       UserDetails.add(widget.adda.toString());
          //       Navigator.pop(context);
          //     },
          //     child: Text('Save'))
        ],
      ),
    );
  }
}
