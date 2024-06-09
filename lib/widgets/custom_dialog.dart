import 'package:flutter/material.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, message, no, yes;
  final Function noCallback;
  final Function yesCallback;

  CustomDialogBox(
      {required this.title, required this.message, required this.no, required this.yes, required this.noCallback, required this.yesCallback});

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
      decoration: BoxDecoration(shape: BoxShape.rectangle, color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [
        const BoxShadow(color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
      ]),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.message,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  child: Text(
                    widget.no,
                    style: const TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    widget.noCallback();
                  },
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  child: Text(
                    widget.yes,
                    style: const TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    widget.yesCallback();
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
