import 'package:flutter/material.dart';

class Project {
  final String name, image,track;
  final DateTime date;
  final String description;

  Project({
    @required this.description,
    @required this.name,
    @required this.image,
    @required this.date,
    @required this.track,
  });

} 

List<Project> projects = [
  Project(
    name: 'Notify',
    description: 'It is a todo application with local notification',
    image: 'assets/images/Notify_logo.jpeg',
    date: DateTime(2020, 10, 15),
    track: 'Mobile',
  ),
  Project(
    description: "Hello There",
    name: "Red Mountains",
    image: "assets/images/Red_Mountains.png",
    date: DateTime(2020, 10, 15),
    track: "Design",
  ),
  Project(
    description: "Iam new here",
    name: "Megical World",
    image: "assets/images/Magical_World.png",
    date: DateTime(2020, 3, 10),
    track: 'Frontend',
  ),
  Project(
    description: "welcome to my profile",
    name: "Red Mountains",
    image: "assets/images/Red_Mountains.png",
    date: DateTime(2020, 10, 15),
    track: 'Backend',
  ),
];
