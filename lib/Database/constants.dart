
import 'package:flutter/material.dart';

int unresponsiveServer = 5;

List<String?> pfps = [
  null,
  "lib/Database/assets/pfps/art-pfp-1687.png",
  "lib/Database/assets/pfps/art-pfp-1688.png",
  "lib/Database/assets/pfps/art-pfp-5249.png",
  "lib/Database/assets/pfps/cyberpunk-pfp-1836.png",
  "lib/Database/assets/pfps/cyberpunk-pfp-3053.png",
  "lib/Database/assets/pfps/demon-slayer-pfp-1275.png",
  "lib/Database/assets/pfps/demon-slayer-pfp-1279.png",
  "lib/Database/assets/pfps/demon-slayer-pfp-2202.png",
  "lib/Database/assets/pfps/monster-pfp-2807.png",
  "lib/Database/assets/pfps/thumb350375139.png",
  "lib/Database/assets/pfps/zero-two-pfp-3975.png",
  "lib/Database/assets/pfps/zero-two-pfp-3981.png",
];

Map<String,int> appColors = {
  "Amazon Orange (Default)" : 0xFFFF9900,
  "Chinese Orange" : 0xFFF37042,
  "Antique Green" : 0xFF3E8F78,
  //"Financial Wellness Green" : 0xFF24E23D,
  "Neon Green" : 0xFF39FF14,
  "Electric Red" : 0xFFE60000,
  "Fuchsia Red" : 0xFFAB3475,
  "Neon Pink" : 0xFFF433FF,
  "Deep Pink" : 0xFFFF1493,
  "Agility Blue" : 0xFF0077D7,
  "Ultramarine Blue" : 0xFF357EC7,
};

String privacyPolicy = "Your Data is yours.\n\nI don't care about your data and how YOU use it.\n\nHow so you may ask? Because the app only make calls to two APIS (Anilist for Anime Info and my self deployed instance of Aniwatch_API for episodes and videos, nothing more than that) and on top of that everything else is on device \n \n Plus it's open source So you can confirm it yourself";

List<String> termsOfService = [
  "Distribution of Uanimurs is ! Prohibited",
  "Use of Uanimurs is ! Prohibited",
  "Uanimurs is ! Restricted",
  "Uanimurs is ! Controlled",
  "Uanimurs is for everyone",
  "Someone PLEASE HIRE ME",
];

List<Map<String,dynamic>> aspectRatios(BuildContext context)=>[
  { "label": "Original", "value": 0 },
  { "label": "16:9", "value": 16 / 9 },
  { "label": "Fill", "value": MediaQuery.of(context).size.width / MediaQuery.of(context).size.height},
  { "label": "4:3", "value": 4 / 3 },
  { "label": "1:1", "value": 1 / 1 },
  { "label": "21:9", "value": 21 / 9 },
  { "label": "3:2", "value": 3 / 2 },
  { "label": "2:1", "value": 2 / 1 },
];

List<String> myListGroupNames = [
  "Online list",
  "Local list",
  "Favourites",
];
