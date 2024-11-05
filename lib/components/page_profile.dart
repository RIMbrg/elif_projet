import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projet_testt/constants2.dart';
import 'package:projet_testt/profile_menu_widget.dart';

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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: const Image(
                    image: AssetImage(tProfileImage),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(tProfileHeading,
                  style: Theme.of(context).textTheme.headlineMedium),
              Text(tProfielSubHeading,
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: tPrimaryColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text(
                    tEditProfile,
                    style: TextStyle(color: tDarkColor),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              //Menu
              ProfileMenuWidget(
                  title: "Personal Data", icon: Icons.person, onPress: () {}),
              ProfileMenuWidget(
                  title: "Setting", icon: Icons.settings, onPress: () {}),
              ProfileMenuWidget(
                  title: "E-Statement",
                  icon: Icons.insert_drive_file_rounded,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Refferal Code", icon: Icons.favorite, onPress: () {}),
              const Divider(color: Colors.grey),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: "FAQs", icon: Icons.pending, onPress: () {}),
              ProfileMenuWidget(
                  title: "Our Handbook", icon: Icons.mode, onPress: () {}),
              ProfileMenuWidget(
                  title: "Community", icon: Icons.people_alt, onPress: () {}),
              ProfileMenuWidget(
                  title: "logout",
                  icon: Icons.logout,
                  onPress: () {},
                  textColor: Colors.red,
                  endIcon: false),
            ],
          ),
        ),
      ),
    );
  }
}
