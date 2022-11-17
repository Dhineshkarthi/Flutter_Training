import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: FirstScreen(),
  ));
}

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String _selectedGender = "Select Gender";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Column(
        children: <Widget>[
          DropdownButton(
            // value: _selectedGender,
            items: _dropDownItem(),
            onChanged: (value) {
              // _selectedGender != value;
              setState(() {
                _selectedGender = value.toString();
              });
              switch (value) {
                case 'Fitness 180':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondScreen()),
                  );
                  break;
                case 'Dalouk Wellness Spa':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondScreen()),
                  );
                  break;
                // case 'orchid Beauty Botique':
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => third()),
                //   );
                //   break;
                // case 'College cafe':
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => third()),
                //   );
                //   break;
                // case 'College Center':
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => third()),
                //   );
                //   break;
                // case 'Ice Skatting':
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => third()),
                //   );
                //   break;
                // case 'Olympic Pool':
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => third()),
                //   );
                //   break;
                // case 'Beach':
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => third()),
                //   );
                //   break;
                // case 'Me mbership':
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => third()),
                //   );
                //   break;
              }
            },
            hint: Text(_selectedGender.toString()),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> _dropDownItem() {
    List<String> ddl = [
      'Fitness 180',
      'Dalouk Wellness Spa',
      'orchid Beauty Botique',
      'Skate Cafe',
      'College cafe',
      'College Center',
      'Ice Skatting',
      'Olympic Pool',
      'Beach',
      'Membership'
    ];
    return ddl
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value),
            ))
        .toList();
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class third extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("third Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
