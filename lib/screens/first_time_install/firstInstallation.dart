import 'package:guage/screens/login/login.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../components/navigator.dart';
import '../../util/res/res.dart';




class FirstInstallation extends StatefulWidget {
  const FirstInstallation({Key? key}) : super(key: key);

  @override
  State<FirstInstallation> createState() => _FirstInstallationState();
}

class _FirstInstallationState extends State<FirstInstallation> {

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
    AppNavigator.pushNamedReplacement(selfCheckup);

    // Navigator.pushReplacement(context, MaterialPageRoute(
    //     builder: (context) => LoginScreen()
    // )
  }

  initScreen(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(children: [
          SizedBox(height: 50.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 100.h),
            child: Column(children: [
              LoadingAnimationWidget.inkDrop(
                color: Colors.blue,
                size: 100,
              ),
              SizedBox(height: 30.h,),
              Text(
                'Loading...',
                style:
                TextStyles.headline4.copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 200.h),
              Text(
                'First time installation',
                style:
                TextStyles.headline4.copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10.h),
              Text(
                'Performing the first time self test',
                style: TextStyles.body.copyWith(
                    color: SmartyColors.grey80, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ]),
          ),
        ]),
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
