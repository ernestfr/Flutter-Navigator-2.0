import 'package:flutter/material.dart';
import 'package:navi/car/car_details_screen.dart';
import 'package:navi/car/car_screen.dart';
import 'package:navi/home/character_screen.dart';
import 'package:navi/home/home_screen.dart';
import 'package:navi/navigation.dart';

// HOME routes

const homePage = NaviPage(
  key: ValueKey("/home"),
  child: HomeScreen(),
);
const characterPage =
    NaviPage(child: CharacterScreen());

// CAR routes
const carPage = NaviPage(
  key: ValueKey("/car"),
  child: CarScreen(),
);

NaviPage carDetailsPage(String model) => NaviPage(
      child: CarDetailsScreen(model),
    );



