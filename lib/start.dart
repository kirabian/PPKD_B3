import 'package:flutter/material.dart';

class StartWidget extends StatelessWidget {
  const StartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PROFILE SAYA',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Bunge',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
        // centerTitle: true,
        actions: [Icon(Icons.settings)],
        actionsPadding: const EdgeInsets.all(8.0),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Action to perform when the button is pressed
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(content: Text('Floating Action Button Pressed')),
      //     );
      //   },
      //   child: Icon(Icons.add),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 300,
          width: double.infinity,
          color: const Color.fromARGB(255, 183, 214, 112),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama : Fabian Syah Al Ghiffari',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Bitcount',
                ),
              ),
              Row(
                children: [
                  Icon(Icons.location_on),
                  SizedBox(width: 8.0),
                  Text(
                    'Alamat : Jakarta',
                    style: TextStyle(
                      fontSize: 22,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'serif',
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Passionate web developer with a focus on creating dynamic and responsive web applications. Skilled in HTML, CSS, JavaScript, and various frameworks. Committed to delivering high-quality code and enhancing user experiences.",
                    style: TextStyle(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 136, 136, 136),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
