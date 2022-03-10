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
    Color? backgroundColor = data['isDayTime'] ? Colors.teal : Colors.blueGrey;

    return Scaffold(
      backgroundColor: backgroundColor,
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
                  icon: Icon(Icons.edit_location_rounded, color: Colors.grey[300]),
                  label: Text('Edit location', style: TextStyle(color: Colors.grey[300])),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 65,
                    letterSpacing: 2,
                    color: Colors.grey[300],
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
