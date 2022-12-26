import 'package:guage/screens/login/login.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../components/navigator.dart';
import '../../util/res/res.dart';

class AutoCheckList extends StatefulWidget {
  const AutoCheckList({Key? key}) : super(key: key);

  @override
  State<AutoCheckList> createState() => _AutoCheckListState();
}

class _AutoCheckListState extends State<AutoCheckList> {
  TextEditingController textEditingController = TextEditingController();

  late StreamController<ErrorAnimationType> errorController;

  @override
  void initState() {
    super.initState();
    errorController = StreamController<ErrorAnimationType>();

    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 2);
    return new Timer(duration, route);
  }

  route() {
    AppNavigator.pushNamedReplacement(finishSetup);
  }

  bool _isChecked = true;



  List<String> _texts = [
    "Device is running self tests!",
    "Filter check!",
    "Flow rate check!",
    "Turbidity check!",
    "Water is safe to drink!",
    "You're all set!"
  ];

  initScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 70.h),
            child: Column(children: [
              LoadingAnimationWidget.inkDrop(
                color: Colors.blue,
                size: 80,
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'Finishing Setup...',
                style:
                    TextStyles.headline4.copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 30.h),
              Text(
                'Hold on it will take 15 minutes',
                style: TextStyles.body
                    .copyWith(color: Colors.blue, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ]),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
          ),]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }
}
