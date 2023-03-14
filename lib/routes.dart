import 'package:flutter/material.dart';
import 'package:navi/car/car_details_screen.dart';
import 'package:navi/car/car_screen.dart';
import 'package:navi/home/character_screen.dart';
import 'package:navi/home/home_screen.dart';

// HOME routes

const homePage = MaterialPage(
  key: ValueKey("/home"),
  child: HomeScreen(),
);
const characterPage =
    MaterialPage( child: CharacterScreen());

// CAR routes
const carPage = MaterialPage(
  key: ValueKey("/car"),
  child: CarScreen(),
);

MaterialPage carDetailsPage(String model) => MaterialPage(
      child: CarDetailsScreen(model),
    );
