import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    //data sent from loading with pushReplacementNamed method
    data = ModalRoute.of(context)?.settings.arguments as Map;

    //set background
    String backgroundImage = data['isDayTime'] ? 'day.png' : 'night.png';

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/$backgroundImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/chooseLocationPage'),
                  icon: const Icon(Icons.edit_location_rounded),
                  label: const Text('Edit location'),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: const TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  data['time'],
                  style: const TextStyle(
                    fontSize: 65,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
