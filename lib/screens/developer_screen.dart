import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class DeveloperaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text('Developer'),
       ),
      backgroundColor: Colors.teal.shade50,
      drawer: MainDrawer(),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 150.0,
            backgroundImage: AssetImage('assets/images/adi.png'),
          ),
          Text(
            'Aditya Patkar',
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 40.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'FLUTTER DEVELOPER',
            style: TextStyle(
              fontFamily: 'Source Sans Pro',
              color: Colors.teal.shade700,
              fontSize: 20.0,
              letterSpacing: 2.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
            width: 150.0,
            child: Divider(
              color: Colors.teal.shade100,
            ),
          ),
          Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                title: Text(
                  '+91 887 9902 420',
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                  ),
                ),
              )),
          Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.teal,
                ),
                title: Text(
                  'adityapatkar22@email.com',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.teal.shade900,
                      fontFamily: 'Source Sans Pro'),
                ),
              ))
        ],
      )),
    );
  }
}

// Scaffold(
//       appBar: AppBar(
//         title: Text('Developer'),
//       ),
//       drawer: MainDrawer(),
//       body: Container(
//         padding: EdgeInsets.only(top: 150),
//         height: 1000,
//         child: Text(
//           'Made by Aditya Patkar!',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 25,
//           ),
//         ),
//         width: double.infinity,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(
//               'assets/images/adi.png',
//             ),
//           ),
//         ),
//       ),
//     );
