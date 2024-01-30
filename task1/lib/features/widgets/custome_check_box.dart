import 'package:flutter/material.dart';

class CustomeCheckBox extends StatefulWidget {
  final titleText;
  final List tasks;
  final Function callback;

  CustomeCheckBox({
    super.key,
    required this.titleText,
    required this.tasks,
    required this.callback,
  });

  @override
  State<CustomeCheckBox> createState() => _CustomeCheckBoxState();
}

class _CustomeCheckBoxState extends State<CustomeCheckBox> {
  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Checkbox(
                activeColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                value: checkedValue,
                onChanged: (newValue) {
                  setState(() {
                    checkedValue = newValue!;
                  });
                },
              ),
              Expanded(
                child: Text(
                  widget.titleText,
                  style: TextStyle(
                    decoration:
                        checkedValue ? TextDecoration.lineThrough : null,
                    color: checkedValue ? Colors.grey : Colors.black,
                  ),
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            widget.callback(widget.titleText);
          },
          child: Container(
            padding: EdgeInsets.all(0),
            width: 50,
            height: 50,
            child: Image.asset("assets/images/Delete.png"),
          ),
        ),
      ],
    );
  }
}
