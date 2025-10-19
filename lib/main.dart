import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trading_app/helper_files/global_variables.dart';
import 'package:trading_app/presentation/dashboard/dashboard.dart';
import 'package:trading_app/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MediaQuery(
        data: MediaQuery.of(
          context,
        ).copyWith(textScaler: TextScaler.linear(Platform.isIOS ? 1 : 1.03)),
        child: MaterialApp(
          navigatorKey: navigatorKey,
          scaffoldMessengerKey: scaffoldMessengerKey,
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          initialRoute: "/Dashboard",
          routes: {"/Dashboard": (context) => Dashboard()},
        ),
      ),
    );
  }
}

// class GlassContainer extends StatelessWidget {
//   const GlassContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           width: double.infinity,
//           height: 200,
//           color: Colors.blueAccent,
//           child: Center(
//             child: Text(
//               'This is the background content',
//               style: TextStyle(fontSize: 24, color: Colors.yellow),
//             ),
//           ),
//         ),

//         Positioned(
//           child: BackdropFilter(
//             // The core blurring mechanism
//             filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: .0),
//             child: Container(
//               // Optional: Add a semi-transparent color overlay (the dark barrier)
//               color: Colors.black.withOpacity(0.4),
//             ),
//           ),
//         ),

//         // 3. THE CHILD CONTENT (What appears on top of the blur)
//         Center(
//           child: Container(
//             width: 200,
//             height: 150,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: const Center(
//               child: Text(
//                 'Child on Top of Blur',
//                 style: TextStyle(color: Colors.black, fontSize: 16),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
