import 'dart:async';
import 'dart:math';
import 'package:Saheli/views/addUserDetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:Saheli/common/widgets/customBtn.dart';
import 'package:Saheli/views/login.dart';
import 'package:Saheli/widgets/Chatbot/chatbot.dart';
import 'package:Saheli/widgets/SafeRoutes/SafeHome.dart';
import 'package:Saheli/widgets/custom_widgets/CustomCarousel.dart';
import 'package:Saheli/widgets/custom_widgets/custom_appBar.dart';
import 'package:Saheli/widgets/emergencies/AmbulanceEmergency.dart';
import 'package:Saheli/widgets/emergencies/PoliceEmergency.dart';
import 'package:Saheli/widgets/emergencies/WomenHelpline.dart';
import 'package:shake/shake.dart';
import 'package:telephony/telephony.dart';

import '../db/databases.dart';
import '../model/PhoneContact.dart';
import '../widgets/NearbyLocations/nearby_places.dart';
import '../widgets/emergency.dart';
import 'community.dart';
import 'connectScreen.dart';

class HomePage extends StatefulWidget {
  int qIndex = 0;

  HomePage({super.key});
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  getRandomQuote() {
    Random random = Random();
    setState(() {
      qIndex = random.nextInt(6);
    });
  }

  int qIndex = 0;
  @override
  void initState() {
    super.initState();
    getRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: GoogleFonts.outfit(fontWeight: FontWeight.w600, fontSize: 32),
        ),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
      ),
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: CustomAppBar(
                  quoteIndex: qIndex,
                  onTap: getRandomQuote(),
                ),
              ),
              const SizedBox(height: 10),
              //SafeHome(),

              const SizedBox(height: 10),
              Text(
                "Quick Emergency Services",
                style: GoogleFonts.outfit(
                    fontSize: 24, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              //const Emergency(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    PoliceEmergency(),
                    AmbulanceEmergency(),
                    ArmyEmergency(),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(height: 30),
              Text(
                "Find on Map",
                style: GoogleFonts.outfit(
                    fontSize: 24, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Container(alignment: Alignment.center, child: const LiveSafe()),
              const SizedBox(height: 10),
              Text(
                "Join Community",
                style: GoogleFonts.outfit(
                    fontSize: 24, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CommunitySection()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Theme.of(context).colorScheme.primary, width: 2)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.group,
                        size: 50,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Community',
                        style: GoogleFonts.outfit(
                          fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Join the women community and share your thoughts!',
                        style: GoogleFonts.outfit(
                            fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Explore Inspiring Stories",
                style: GoogleFonts.outfit(
                    fontSize: 24, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              const CustomCarouel(),
            ],
          ),

        ),
      ),
    );
  }
}

class ConnectScreen {
  const ConnectScreen();
}
