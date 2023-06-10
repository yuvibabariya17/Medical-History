import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: 3.w, right: 3.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 15.h, bottom: 3.h),
              child: Text(
                'Log In',
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              'For Log in please,enter your phone number and \n                                password',
              style: TextStyle(fontSize: 12.5.sp),
            ),
            SizedBox(
              height: 4.h,
            ),
            Form(
                child: Container(
              padding: EdgeInsets.only(left: 3.w, right: 3.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        top: 1.5.h,
                        left: 5.w,
                        bottom: 1.5.h,
                      ),
                      hintText: 'Your Phone Number',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    keyboardType: TextInputType.phone,
                    controller: _phone,
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          top: 1.5.h,
                          left: 5.w,
                          bottom: 1.5.h,
                        ),
                        hintText: 'Password',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        suffixIcon: const Icon(Icons.visibility_off_sharp)),
                    keyboardType: TextInputType.name,
                    controller: _pass,
                  ),
                ],
              ),
            )),
            SizedBox(
              height: 2.5.h,
            ),
            SizedBox(
              height: 5.h,
              width: 40.w,
              child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const IntroScreen(),
                    //     ));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(250, 77, 155, 220),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: Text('Log In', style: TextStyle(fontSize: 14.sp))),
            ),
            SizedBox(
              height: 2.5.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              // ignore: prefer_const_literals_to_create_immutables
              children: [
                getDivider(),
                Text(
                  'Or',
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
                ),
                getDivider(),
              ],
            ),
            SizedBox(
              height: 2.5.h,
            ),
            Container(
              height: 5.h,
              width: 90.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      // child: SvgPicture.asset(Asset.apple),
                      ),
                  const Text('Login With Apple Id'),
                ],
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Container(
              height: 5.h,
              width: 90.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black12),
              child: const Center(child: Text('Log In with Google')),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Container(
              height: 5.h,
              width: 90.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black12),
              child: const Center(child: Text('Log In with Facebook')),
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                    text: TextSpan(
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                        children: [
                      const TextSpan(
                        text: 'Don’t have an account?    ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                          text: 'Sign Up',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ));
                            },
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationThickness: 1.5,
                              color: const Color.fromARGB(250, 77, 155, 220),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700)),
                    ])),
              ],
            )
          ],
        ),
      ),
    ));
  }
}

getDivider() {
  return Container(
    height: 0.2.h,
    width: 36.w,
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: Colors.grey),
  );
}
