import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../components/navigator.dart';
import '../../util/res/res.dart';

import '../../util/widgets/widgets.dart';
import 'package:otpless_flutter/otpless_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FinishSetup extends StatefulWidget {
  const FinishSetup({Key? key}) : super(key: key);

  @override
  State<FinishSetup> createState() => _FinishSetupState();
}

class _FinishSetupState extends State<FinishSetup> {
  String _userToken = 'Unknown';
  final _otplessFlutterPlugin = Otpless();

  TextEditingController textEditingController = TextEditingController();

  late StreamController<ErrorAnimationType> errorController;

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
    initPlatformState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  // ** Function that is called when page is loaded
  // ** We can check the auth state in this function
  Future<void> initPlatformState() async {
    _otplessFlutterPlugin.authStream.listen((token) {
      // TODO: Handle user token like making api calls
      setState(() {
        _userToken = token ?? "Unknown";
      });
    });
  }

  // ** Function to initiate the login process
  void initiateWhatsappLogin(String intentUrl) async {
    var result =
    await _otplessFlutterPlugin.loginUsingWhatsapp(intentUrl: intentUrl);
    switch (result['code']) {
      case "581":
        Fluttertoast.showToast(
            msg: result['message']!,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        //TODO: handle whatsapp not found
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(children: [
          SizedBox(height: 100.h),
          Image.asset("assets/images/logo.png", width: 163.w,color: Colors.blue,),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(children: [
              Text(
                'Congratulation',
                style:
                TextStyles.headline4.copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10.h),
              Text(
                'Congratulations! Your Device is 100% fit and running optimally',
                style: TextStyles.body.copyWith(
                    color: SmartyColors.grey80, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ]),
          ),
          SizedBox(height: 200.h),
          AppButtonPrimary(
              label: 'Finish Setup',
              onPressed: () => {

                // AppNavigator.pushNamedReplacement(loginRoute),

              }),

        ]),
      ),
    );
  }
}
