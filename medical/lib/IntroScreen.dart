import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import 'LoginScreen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List onBoardingData = [
    {
      "image":
          'https://img.freepik.com/premium-vector/female-doctor-conducts-online-consultation-via-smartphone-family-doctor-is-phone-remote-medical-consultation_499739-361.jpg',
      "discription":
          '   We have Collected everything in one place - Search for a doctor.Online consulations,data   \n  storage,decoding of tests-after trying.you\n will not ne able to stop!'
    },
    {
      "image":
          'https://img.freepik.com/premium-vector/female-doctor-conducts-online-consultation-via-smartphone-family-doctor-is-phone-remote-medical-consultation_499739-361.jpg',
      "discription":
          'With Our app you will forget about long lines at the clinic and waiting for an appointment \n with a doctor.'
    },
    {
      "image":
          'https://img.freepik.com/premium-vector/female-doctor-conducts-online-consultation-via-smartphone-family-doctor-is-phone-remote-medical-consultation_499739-361.jpg',
      "discription":
          'Just go to the app and make an appointment \n with a doctor in a couple of clicks , got a \n prescription or consult with a doctor online.'
    },
  ];
  PageController pageController = PageController();
  int currentPage = 0;
  var isLastIndex = false;
  continueMethod(int index) {}

  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: Color(0xFF000000),
      ),
      margin: const EdgeInsets.only(
        right: 4,
      ),
      height: 10,
      curve: Curves.easeIn,
      width: currentPage == index ? 15 : 10,
    );
  }

  onchanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            InkWell(
              child: Container(
                margin: EdgeInsets.only(left: 3.w, right: 3.w),
                padding: const EdgeInsets.all(10),
                width: 15.w,
                height: 0.5.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black),
                child: const Center(child: Text('Skip')),

                // child: ElevatedButton(
                //     onPressed: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => const LoginScreen(),
                //           ));
                //     },
                //     style: ElevatedButton.styleFrom(
                //         backgroundColor: const Color.fromARGB(250, 77, 155, 220),
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(25))),
                //     child: const Text('Skip')),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
              },
            ),
          ],
        ),
        body: Stack(children: [
          SizedBox(
            height: 3.h,
          ),
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            itemCount: onBoardingData.length,
            onPageChanged: onchanged,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 42.h,
                    width: 120.w,
                    child: Image.network(onBoardingData[index]['image']),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onBoardingData.length,
                      (int index) => _buildDots(
                        index: index,
                      ),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Container(
                      padding: EdgeInsets.only(left: 6.w, right: 6.w),
                      child: Text(
                        onBoardingData[index]['discription'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 13.2.sp, fontWeight: FontWeight.w400),
                      ))
                ],
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (currentPage == (onBoardingData.length - 1))
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 5.h,
                          width: 40.w,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(250, 77, 155, 220),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              child: Text('Sign Up',
                                  style: TextStyle(fontSize: 14.sp))),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 5.h,
                          width: 40.w,
                          child: ElevatedButton(
                              onPressed: () {
                                pageController.nextPage(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeIn,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(250, 77, 155, 220),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              child: Text('Next',
                                  style: TextStyle(fontSize: 14.sp))),
                        ),
                      ],
                    ),
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14.sp),
                          children: [
                        const TextSpan(
                          text: 'Already have an account?    ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                            text: 'Log In',
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
              ),
              SizedBox(
                height: 7.h,
              ),
            ],
          ),
        ]));
  }
}
