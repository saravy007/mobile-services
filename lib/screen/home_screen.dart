import 'package:caf/provider/auth_provider.dart';
import 'package:caf/screen/application/applicant_screen.dart';
import 'package:caf/screen/application/edit_application_screen.dart';
import 'package:caf/screen/authentication/change_password_screen.dart';
import 'package:caf/screen/authentication/login_screen.dart';
import 'package:caf/screen/authentication/user_update_screen.dart';
import 'package:caf/screen/main_home_screen.dart';
import 'package:caf/screen/qr/qr_scan_screen.dart';
import 'package:caf/settings/app_color.dart';
import 'package:caf/language/language_constant.dart';
import 'package:caf/provider/event_provider.dart';
import 'package:caf/provider/language_provider.dart';
import 'package:caf/screen/reissue/reissue_screen.dart';
import 'package:caf/screen/services/service_type_screen.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _screens = [
    const MainHomeScreen(),
    const ServiceTypeScreen(),
    const VerifyApplicationScreen(),
    const QrScanScreen(),
  ];
  Language _lang = Khmer();
  @override
  Widget build(BuildContext context) {
    _lang = context.watch<LanguageProvider>().lang;
    final bottomProvider = context.watch<EventProvider>();
    final langProvider = context.watch<LanguageProvider>();
    final authProvider = context.watch<AuthProvider>().loadProfile();
    final user = context.watch<AuthProvider>().user;
    return Scaffold(
      appBar: AppBar(
        title: Text("${user?.username}"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Color(0xFFC4BB65)),
            onPressed: () {
              // print("Notification button pressed");
            },
          ),
          IconButton(
            icon: langProvider.langIndex == 0
                ? CountryFlag.fromCountryCode("KH", height: 24, width: 32)
                : CountryFlag.fromCountryCode("GB", height: 24, width: 32),
            onPressed: langProvider.changeLanguage,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTapDown: (TapDownDetails details) {
            _showPopupMenu(context, details.globalPosition);
          },
              child: _buildUserProfile(user),
            ),
          ),
        ],
      ),
      body: SafeArea(
        // Added SafeArea
        child: _screens[bottomProvider.selectedIndex],
      ),
      bottomNavigationBar: _buildNavigationBar(bottomProvider),
    );
  }

  void _showPopupMenu(BuildContext context, Offset offset){
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(offset.dx, offset.dy, offset.dx, 0),
      items: [
        PopupMenuItem<String>(
          value: 'editProfile',
          child: Text(_lang.editProfile),
        ),
         PopupMenuItem<String>(
          value: 'changePassword',
          child: Text(_lang.changePassword),
        ),
        PopupMenuItem<String>(
          value: 'Logout',
          child: Text(_lang.logout),
        )
      ],
    ).then((value) {
      if (value != null) {
        if (value == 'editProfile') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UserUpdateScreen()),
          );
        }
        if (value == 'changePassword') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChangePasswordScreen()),
          );
        } else if (value == 'Logout') {
          AuthProvider().logOut();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (Route<dynamic> route) => false, // This clears the stack
          );
        }
      }
    });
  }
  Widget _buildUserProfile(dynamic user) {
    return CircleAvatar(
        radius: 20.0, // Adjust size for AppBar
        backgroundColor: Colors.blueAccent,
        child: Text(
          user?.username?.substring(0, 1).toUpperCase() ??
              'U', // First letter of the name
          style: const TextStyle(fontSize: 18.0, color: Colors.white),
        ));
  }

  Widget _buildPopupMenu(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String value) {
        if (value == 'Edit Profile') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Text("")),
          );
        } else if (value == 'Logout') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Logged out'),
          ));
        }
        else if (value == 'changePssword') {
         Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Text("")),
          );
        }
      },
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'Edit Profile',
            child: Text('Edit Profile'),
          ),
          const PopupMenuItem<String>(
            value: 'Logout',
            child: Text('Logout'),
          ),
        ];
      },
    );
  }
  Widget _buildNavigationBar(EventProvider bottomNavProvider) {
    return NavigationBar(
      backgroundColor: AppColors.appBarColor,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      animationDuration: const Duration(milliseconds: 1000),
      indicatorColor: Colors.transparent,
      elevation: 10.0,
      height: 70, // You can adjust this value
      destinations: <NavigationDestination>[
        _buildHome(),
        _buildMenu(),
        _buildApplyForm(),
        _buildQrCode(),
      ],
      selectedIndex: bottomNavProvider.selectedIndex,
      onDestinationSelected: bottomNavProvider.setSelectedIndex,
    );
  }
  Widget _buildItemSelected(IconData icon, String title, Color color) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(color: color, fontWeight: FontWeight.w700),
          ),
          Container(
            padding: const EdgeInsets.all(2.5),
            decoration: const BoxDecoration(color: Color(0xFFe0142f)),
          ),
        ],
      ),
    );
  }

  NavigationDestination _buildHome() {
    return NavigationDestination(
      selectedIcon: _buildItemSelected(
          Icons.home, _lang.home, AppColors.appBarSelectColor),
      icon: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            const Icon(Icons.home, color: AppColors.appBarTextColor),
            const SizedBox(height: 5),
            Text(_lang.home,
                style: const TextStyle(color: AppColors.appBarTextColor)),
          ],
        ),
      ),
      label: '',
    );
  }

  NavigationDestination _buildMenu() {
    return NavigationDestination(
      selectedIcon: _buildItemSelected(
          Icons.menu, _lang.serviceType, AppColors.appBarSelectColor),
      icon: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            const Icon(Icons.menu),
            const SizedBox(height: 5),
            Text(
              _lang.serviceType,
              style: const TextStyle(color: AppColors.appBarTextColor),
            ),
          ],
        ),
      ),
      label: _lang.serviceType,
    );
  }

  NavigationDestination _buildApplyForm() {
    return NavigationDestination(
      selectedIcon: _buildItemSelected(Icons.app_registration_rounded,
          _lang.application, AppColors.appBarSelectColor),
      icon: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            const Icon(Icons.app_registration_rounded),
            const SizedBox(height: 5),
            Text(
              _lang.application,
              style: const TextStyle(color: AppColors.appBarTextColor),
            ),
          ],
        ),
      ),
      label: _lang.application,
    );
  }

  NavigationDestination _buildQrCode() {
    return NavigationDestination(
      selectedIcon: _buildItemSelected(
          Icons.qr_code, _lang.qrCode, AppColors.appBarSelectColor),
      icon: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            const Icon(Icons.qr_code),
            const SizedBox(height: 5),
            Text(
              _lang.qrCode,
              style: const TextStyle(color: AppColors.appBarTextColor),
            ),
          ],
        ),
      ),
      label: _lang.qrCode,
    );
  }
}
