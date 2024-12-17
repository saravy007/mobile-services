// import 'package:flutter/material.dart';
// import 'package:network_info_plus/network_info_plus.dart';
// import 'package:permission_handler/permission_handler.dart';

// class CheckInOutPage extends StatefulWidget {
//   const CheckInOutPage({super.key});

//   @override
//   _CheckInOutPageState createState() => _CheckInOutPageState();
// }
// class _CheckInOutPageState extends State<CheckInOutPage> {
//   final NetworkInfo _networkInfo = NetworkInfo();
//   String _wifiName = 'Unknown';
//   String _wifiBSSID = 'Unknown';
//   bool _isCheckedIn = false;

//   // Replace with your actual target MAC address
//   final String _targetMacAddress =
//       "10-F6-0A-D9-42-A2"; // Example target MAC address

//   @override
//   void initState() {
//     super.initState();
//     _getWifiDetails();
//   }

//   Future<void> _getWifiDetails() async {
//     // Check for location permission
//     if (await Permission.locationWhenInUse.request().isGranted) {
//       try {
//         String? wifiName = await _networkInfo.getWifiName();
//         String? wifiBSSID = await _networkInfo.getWifiBSSID();
//         setState(() {
//           _wifiName = wifiName ?? 'Failed to get Wi-Fi Name';
//           _wifiBSSID = wifiBSSID ?? 'Failed to get Wi-Fi BSSID';
//         });
//       } catch (e) {
//         setState(() {
//           _wifiName = 'Failed to get Wi-Fi Name';
//           _wifiBSSID = 'Failed to get Wi-Fi BSSID';
//         });
//       }
//     } else {
//       setState(() {
//         _wifiName = 'Location permission denied';
//         _wifiBSSID = 'Location permission denied';
//       });
//     }
//   }

//   void _checkIn() {
//     if (_wifiBSSID == _targetMacAddress) {
//       setState(() {
//         _isCheckedIn = true;
//       });
//       // Save the check-in data, e.g., to a database
//       print('Checked in at $_wifiName ($_wifiBSSID)');
//     } else {
//       _showAlert('Check-in failed',
//           'You must be connected to the correct Wi-Fi network to check in.');
//     }
//   }

//   void _checkOut() {
//     setState(() {
//       _isCheckedIn = false;
//     });
//     // Save the check-out data
//     print('Checked out from $_wifiName ($_wifiBSSID)');
//   }

//   void _showAlert(String title, String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(title),
//           content: Text(message),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Check-in/Check-out'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Wi-Fi Name: $_wifiName'),
//             Text('Wi-Fi BSSID: $_wifiBSSID'),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _isCheckedIn ? null : _checkIn,
//               child: const Text('Check In'),
//             ),
//             ElevatedButton(
//               onPressed: !_isCheckedIn ? null : _checkOut,
//               child: const Text('Check Out'),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               _isCheckedIn ? 'You are checked in' : 'You are not checked in',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
