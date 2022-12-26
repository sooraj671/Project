import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/navigator.dart';
import '../../util/res/res.dart';
import '../../util/widgets/widgets.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 90.h),
            Image.asset("assets/images/logo.png",
                color: SmartyColors.primary, width: 174.w),
            SizedBox(height: 35.h),
            Text(
              'Create an account',
              style: TextStyles.headline4.copyWith(
                  color: SmartyColors.primary, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 30.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Phone number'),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your phone number',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
            SizedBox(height: 30.h),
            AppButtonPrimary(
              label: 'Register',
              onPressed: () => AppNavigator.pushNamed(otpRoute),
            ),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () => AppNavigator.pushNamed(loginRoute),
              child: Text(
                'Already have an account? Log in',
                style: TextStyles.body,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
    );
  }
}
