import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../components/navigator.dart';
import '../../util/res/res.dart';
import '../../util/widgets/widgets.dart';

class CheckList extends StatefulWidget {
  const CheckList({Key? key}) : super(key: key);

  @override
  State<CheckList> createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {


  TextEditingController textEditingController = TextEditingController();

  late StreamController<ErrorAnimationType> errorController;

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  bool _isChecked = true;

  List<String> _texts = [
    "Make sure inline water is there.",
    "Make sure device is on.",
    "The water pressure is above 20psi.",
    "Make sure the valve is connected.",
    "Make sure the motor noise is coming.",
    "Undersink tank connected"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 40, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Icon(
                  Icons.list,
                  color: Colors.blue,
                  size: 30.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                Text("Check List"),
                SizedBox(width: 150,)
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: ListView(
                children: _texts
                    .map((text) => CheckboxListTile(
                          title: Text(text),
                          value: _isChecked,
                          onChanged: (val) {
                            setState(() {
                              _isChecked = val!;
                            });
                          },
                        ))
                    .toList(),
              ),
            ),
          ),
          SizedBox(
            height: 200,
          ),
          AppButtonPrimary(label: 'Begin your setup', onPressed: () => {
            AppNavigator.pushNamedReplacement(firstInstallation)
          }),
        ],
      ),
    ));
  }
}
