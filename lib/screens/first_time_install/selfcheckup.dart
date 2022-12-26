import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/navigator.dart';
import '../../util/res/typography.dart';

class SelfCheckup extends StatefulWidget {
  const SelfCheckup({Key? key}) : super(key: key);

  @override
  State<SelfCheckup> createState() => _SelfCheckupState();
}

class _SelfCheckupState extends State<SelfCheckup> {
  TextEditingController textEditingController = TextEditingController();

  bool _isLoading = true;

  bool _isSecond = false;
  bool _row = false;

  List<String> _texts = [
    "Make sure inline water is there.",
    "Make sure device is on.",
    "The water pressure is above 20psi.",
    "Make sure the valve is connected.",
    "Make sure the motor noise is coming.",
    "Undersink tank connected"
  ];

  List<String> _texts2 = [
    "The output from RO has a low turbidity.",
    "Input TDS of first flow is 678.",
    "Alkaline output is 78 currently."
  ];

  startTime() async {
    var duration = new Duration(seconds: 6);
    return new Timer(duration, route);
  }

  route() {
    AppNavigator.pushNamedReplacement(autoCheck);
  }

  @override
  void initState() {
    super.initState();
    startTime();
    Timer(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
        _isSecond = true;
        _row = true;
      });
    });

    Timer(Duration(seconds: 4), () {
      setState(() {
        _isSecond = false;
      });
    });
  }

  initScreen(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 100),
      child: Column(children: [
        Text(
          'Device is Running Self Tests',
          style:
          TextStyles.headline4.copyWith(fontWeight: FontWeight.w500),

        ),
        SizedBox(height: 50.h,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Water pressure is (55-60) psi"),
            if (_isLoading) ...[
              SizedBox(
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                ),
                height: 20.0,
                width: 20.0,
              ),
            ] else ...[
              const Icon(
                Icons.done,
                size: 30,
                color: Colors.blue,
              ),
            ],
            SizedBox(
              width: 40.w,
            )
          ],
        ),
        if (!_isLoading) ...[
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              constraints:
                  BoxConstraints(maxHeight: 180, minWidth: double.infinity),
              child: Card(
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: _texts
                      .map((text) => Row(
                            children: [
                              Icon(
                                Icons.check,
                                color: Colors.blue,
                                size: 20.0,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(text)
                            ],
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
        ],
        SizedBox(
          height: 80.h,
        ),
        if (_row) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Water pressure is (55-60) psi"),
              if (_isSecond) ...[
                SizedBox(
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                  ),
                  height: 20.0,
                  width: 20.0,
                ),
              ] else ...[
                const Icon(
                  Icons.done,
                  size: 30,
                  color: Colors.blue,
                ),
              ],
              SizedBox(
                width: 40.w,
              )
            ],
          ),
          if (!_isSecond) ...[
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                constraints:
                    BoxConstraints(maxHeight: 100, minWidth: double.infinity),
                child: Card(
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: _texts2
                        .map((text) => Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Colors.blue,
                                  size: 20.0,
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text(text)
                              ],
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
          ]
        ],
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }
}
