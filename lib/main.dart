

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import 'controllers/authentication_controller.dart';
import 'view/authentication/login_page.dart';


import 'view/home_tab_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // PowerFileViewManager.initEngine();
  // await Firebase.initializeApp(
  //     // options: DefaultFirebaseOptions.currentPlatform
  //     );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _MyAppState() {}
  @override
  Widget build(BuildContext context) {
    // authController.getUserData();
    return ScreenUtilInit(
        designSize: Size(375, 812),
        builder: (context, child) => GetMaterialApp(
              localizationsDelegates: <LocalizationsDelegate<dynamic>>[
                // GlobalMaterialLocalizations.delegate,
                // GlobalWidgetsLocalizations.delegate,
                // GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [Locale('en', 'US'), Locale('zh', 'CN')],
              debugShowCheckedModeBanner: false,
              home: landingPage(),
            ));
  }

  Widget landingPage() {
    AuthController authController = Get.put(AuthController());
    authController.getUserData();

    return GetBuilder<AuthController>(builder: (authController) {
      return authController.user != null ? HomeTabPage() : LoginPage();
    });

    // NotesPageScreen();

    // HtmlEditorExample(title: 'asd',);
  }
}
