import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../components/navigator.dart';
import '../../util/res/res.dart';

import '../../util/widgets/widgets.dart';
import 'package:otpless_flutter/otpless_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
          SizedBox(height: 50.h),
          Image.asset("assets/images/phone.png", width: 163.w),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(children: [
              Text(
                'Verify Number',
                style:
                    TextStyles.headline4.copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10.h),
              Text(
                'Click the button below to verify your number',
                style: TextStyles.body.copyWith(
                    color: SmartyColors.grey80, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ]),
          ),
          SizedBox(height: 10.h),
          AppButtonPrimary(
              label: 'Verify with Whatsapp',
              onPressed: () => {
                    initiateWhatsappLogin(
                        "whatsapp://send?phone=911141169439&text=‎‎‍‎‎​‌‌‍‎‎‌‎​‎‎Hi%20WhatsApp%21%0APlease%20verify%20my%20number%20with%20Test.")
                    // AppNavigator.pushNamedReplacement(loginRoute),
                    ,
                  }),
          SizedBox(height: 30.h),
          AppButtonPrimary(
              label: 'Complete Checklist',
              onPressed: () => {
                    AppNavigator.pushNamedReplacement(checkListRoute)
                    // AppNavigator.pushNamedReplacement(loginRoute),
                    ,
                  }),
          // SizedBox(height: 10.h),
          // GestureDetector(
          //   onTap: () {},
          //   child: Text(
          //     'Didn\'t receive code? Resend code',
          //     style: TextStyles.body,
          //   ),
          // ),
          // SizedBox(height: MediaQuery.of(context).padding.bottom),
        ]),
      ),
    );
  }
}
