import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import 'IntroScreen.dart';
import 'LoginScreen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40.h,
              width: 120.w,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://img.freepik.com/premium-vector/female-doctor-conducts-online-consultation-via-smartphone-family-doctor-is-phone-remote-medical-consultation_499739-361.jpg'),
                  ),
                  color: Colors.transparent),
              // child: Image.network(
              //     'https://img.freepik.com/premium-vector/female-doctor-conducts-online-consultation-via-smartphone-family-doctor-is-phone-remote-medical-consultation_499739-361.jpg'),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
                padding: EdgeInsets.only(left: 2.w, right: 2.w, bottom: 2.h),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35)),
                  color: Colors.white60,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 4.h),
                      Text(
                        textAlign: TextAlign.center,
                        'Your personal medical\nassistant welcomes you!',
                        style: TextStyle(
                            fontSize: 23.sp, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height: 2.h),
                      Container(
                        padding: EdgeInsets.only(left: 5.w, right: 5.w),
                        child: Text(
                          textAlign: TextAlign.center,
                          'We have Collected everything in one place- Search for a doctor.Online consulations,data storage,decoding \nof tests-after trying you will not ne able to stop!',
                          style: TextStyle(
                              fontSize: 10.8.sp, fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      SizedBox(
                        height: 5.h,
                        width: 40.w,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const IntroScreen(),
                                  ));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(250, 77, 155, 220),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            child: Text(
                              'Try it now',
                              style: TextStyle(fontSize: 14.sp),
                            )),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp),
                                  children: [
                                const TextSpan(
                                  text: 'Already have an account?      ',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ), 
                                TextSpan(
                                    text: 'Log In',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginScreen(),
                                            ));
                                      },
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        decorationThickness: 1.5,
                                        color: const Color.fromARGB(
                                            250, 77, 155, 220),
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w700)),
                              ])),
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      )
                    ]))
          ],
        ),
      ]),
    );
  }
}
