import 'package:caf/model/user_model.dart';
import 'package:caf/provider/auth_provider.dart';
import 'package:caf/screen/home_screen.dart';
import 'package:caf/settings/app_color.dart';
import 'package:caf/screen/authentication/login_screen.dart';
// import 'package:caf/barcode/qrscann_screen.dart';
import 'package:caf/settings/app_font.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasicaApp extends StatefulWidget {
  const BasicaApp({super.key});
  @override
  State<BasicaApp> createState() => _BasicaAppState();
}
class _BasicaAppState extends State<BasicaApp> {
  late Future<UserModel?> _authProvider;
  @override
  void initState() {
    super.initState();
    _authProvider = context.read<AuthProvider>().loadProfile();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      theme: ThemeData(
        // primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: const Color(0xFFFDFDFD),
        // scaffoldBackgroundColor: Color(0xFFF7F7F7),
        fontFamily: AppFont.bodyFont,
        navigationBarTheme: const NavigationBarThemeData(
            // indicatorColor: Colors.blue.withOpacity(0.3), // Background color of the selected indicator
            //labelTextStyle: MaterialStateProperty.all(TextStyle(color: Colors.blue)), // Highlighted label color
            ),

        appBarTheme: AppBarTheme(
            backgroundColor: AppColors.appBarColor,
            titleTextStyle: TextStyle(
                fontFamily: AppFont.appBarFont,
                fontSize: AppFont.appBarSize,
                fontWeight: FontWeight.w500)),

        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.appBarColor,
          selectedLabelStyle: TextStyle(
              color: AppColors.textColor,
              fontFamily: AppFont.selectedFont,
              fontSize: AppFont.selectedFontSize),
          unselectedLabelStyle: TextStyle(
            color: AppColors.appBarTextColor,
            fontFamily: AppFont.unSelectedFont,
            fontSize: AppFont.unSelectedFontSize,
            // backgroundColor: AppColors.error
          ),
        ),
        textTheme: TextTheme(
          bodySmall:TextStyle(
            fontFamily: AppFont.bodyFont
          )
        ),
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ), // Rounded corners on focus
            // borderSide: BorderSide(
            //   color: Color(0xFF3074FD), // Customize border color on focus
            //   width: 1.5
            // ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
              
            ), // Rounded corners when not focused
            // borderSide: BorderSide(
            //   color:
            //       Color(0xFF3074FD), // Customize border color when not focused
            //       width: 1

            // ),
          ),
        ),
      ),

      home: FutureBuilder<UserModel?>(
          future: _authProvider,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.data == null) {
              // Data is null, redirect to the login screen
              return const LoginScreen();
            } else {
              // Data is available, proceed to the home screen
              return const HomeScreen();
            }
          }),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }
  
  void _checkAuth() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      await authProvider.loadProfile();
      if (authProvider.isLogIn == true) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
