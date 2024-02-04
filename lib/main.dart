import 'package:flutter/material.dart';
import 'package:timeline/music.player.dart';
import './home.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Disable the debug banner in the top-right corner
      debugShowCheckedModeBanner: false,
      // Set the title of the app
      title: 'Flutter Demo',
      // Define the overall theme for the app
      theme: ThemeData(
        // Define the color scheme for the app using a seed color
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // Enable the use of Material 3 design principles
        useMaterial3: true,
      ),
      // Specify the initial route (home page) and additional named routes
      home: const MyHomePage(),
      routes: {
        // Named route for the MusicPlayer page
        MusicPlayer.routeName: (context) => const MusicPlayer(),
      },
    );
  }
}
