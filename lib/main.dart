import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idc/Screens/Feed/feed.dart';
import 'package:idc/Screens/OnboardingScreen/onboardingScreen.dart';
import 'package:idc/Screens/AuthScreens.dart/OtpScreen/otp.dart';
import 'package:idc/Screens/AuthScreens.dart/PhoneNumberScreen/phoneNoScreen.dart';
import 'package:provider/provider.dart';
import 'notifiers/auth.dart';

void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(433, 921),
        builder: () => MultiProvider(
         providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: MaterialApp(
          locale: DevicePreview.locale(context), // Add the locale here
          builder: DevicePreview.appBuilder, //
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => OnBoardingScreen(),
            '/phoneNo': (context) => PhoneNoSceen(),
            '/otp': (context) => Otp(),
            '/feed': (context) => Feed(),
          },
      ),
        ),
    );
  }
}
