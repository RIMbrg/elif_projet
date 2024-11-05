import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projet_testt/constants2.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          iconSize: 20,
          color: Colors.black,
        ),
        title:
            Text(tProfile, style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode))
        ],
      ),
      //   body: SingleChildScrollView(
      //     child: Container(
      //       padding: EdgeInsets.all(tDefaultSize),
      //       child: Column(
      //         children: [
      //           SizedBox(
      //             width: 120,
      //             height: 120,
      //             child: ClipRRect(
      //               borderRadius: BorderRadius.circular(100),
      //               child: Image(
      //                 image: AssetImage.tProfileImage,
      //               ),
      //             ),
      //           ),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           Text(tProfileHeading,
      //               style: Theme.of(context).textTheme.headline4),
      //           Text(
      //               tProfielSubHeading,
      //               style: Theme.of(context).textTheme,
      //               bodyText2)
      //         ],
      //       ),
      //     ),
      //   ),
    );
  }
}
