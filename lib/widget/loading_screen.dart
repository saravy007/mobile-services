// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'loading_provider.dart';

// class LoadingCycle extends StatelessWidget {
//   final Widget child;

//   LoadingCycle({required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<LoadingProvider>(
//       builder: (context, loadingProvider, _) {
//         return Stack(
//           children: [
//             child,
//             if (loadingProvider.isLoading)
//               Container(
//                 color: Colors.black54,
//                 child: Center(
//                   child: CircularProgressIndicator(),
//                 ),
//               ),
//           ],
//         );
//       },
//     );
//   }
// }
