import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/navigator.dart';
import '../../util/res/res.dart';
import '../../util/widgets/widgets.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 109.h),
            Image.asset("assets/images/logo.png",
                color: SmartyColors.primary, width: 174.w),
            SizedBox(height: 35.h),
            Text(
              'Login to your account',
              style: TextStyles.headline4.copyWith(
                  color: SmartyColors.primary, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 48.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Enter your registered phone number'),
                SizedBox(height: 10.h),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your phone number',
                  ),keyboardType: TextInputType.number,
                ),
              ],
            ),
            SizedBox(height: 50.h),
            AppButtonPrimary(
              label: 'Login',
              onPressed: () => AppNavigator.pushNamedAndClear(checkListRoute),
            ),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () => AppNavigator.pushNamed(registerRoute),
              child: Text(
                'Don\'t have an account? Create account',
                style: TextStyles.body,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom * 2),
          ],
        ),
      ),
    );
  }
}
