import 'package:flutter/material.dart';
import 'package:login_screensharja/radioclass.dart';
import 'package:login_screensharja/surveypage.dart';

class OlympicPool extends StatefulWidget {
  const OlympicPool({super.key});

  @override
  State<OlympicPool> createState() => _OlympicPoolState();
}

class _OlympicPoolState extends State<OlympicPool> {
  List<OverAllSatisfaction> sampleData = <OverAllSatisfaction>[];
  List<CustomerService> sampleDataone = <CustomerService>[];

  bool sampleDataa = false;
  bool sampleData1 = false;

  String _selectedField = 'Olympic Pool';

  @override
  void initState() {
    super.initState();
    sampleData.add(OverAllSatisfaction(
        false, Icons.sentiment_very_satisfied_outlined, 'Excellent'));
    sampleData.add(OverAllSatisfaction(
        false, Icons.sentiment_satisfied_alt_outlined, 'Good'));
    sampleData.add(OverAllSatisfaction(
        false, Icons.sentiment_dissatisfied_outlined, 'Bad'));
    sampleData.add(OverAllSatisfaction(
        false, Icons.sentiment_very_dissatisfied, 'Very Bad'));

    sampleDataone.add(CustomerService(
        false, Icons.sentiment_very_satisfied_outlined, 'Excellent'));
    sampleDataone.add(
        CustomerService(false, Icons.sentiment_satisfied_alt_outlined, 'Good'));
    sampleDataone.add(
        CustomerService(false, Icons.sentiment_dissatisfied_outlined, 'Bad'));
    sampleDataone.add(
        CustomerService(false, Icons.sentiment_very_dissatisfied, 'Very Bad'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
                width: double.infinity,
                height: 50,
                color: Colors.white,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    // value: _selectedGender,
                    items: _dropDownItem(),
                    onChanged: (value) {
                      // _selectedGender != value;
                      setState(() {
                        _selectedField = value.toString();
                      });
                      switch (value) {
                        case 'Fitness 180':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SurveyScreen()),
                          );
                          break;
                        case 'Dalouk Wellness Spa':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SurveyScreen()),
                          );
                          break;
                        case 'orchid Beauty Botique':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SurveyScreen()),
                          );
                          break;
                        case 'Skate Cafe':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SurveyScreen()),
                          );
                          break;
                        case 'College cafe':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SurveyScreen()),
                          );
                          break;
                        case 'Ice Skatting':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SurveyScreen()),
                          );
                          break;
                        case 'Olympic Pool':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OlympicPool()),
                          );
                          break;
                        case 'Beach':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SurveyScreen()),
                          );
                          break;
                      }
                    },
                    hint: Text(_selectedField.toString()),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Image.asset(
                  'assests/fitnessimg.png',
                  width: 80,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  'How was your experience ?',
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 12,
                  ),
                ),
              ),
              Card(
                elevation: sampleDataa ? 10.0 : 0,
                margin: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    const Text('Overall Satisfaction'),
                    Container(
                      height: 70,
                      width: double.infinity,
                      color: Colors.white,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: sampleData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: InkWell(
                              //highlightColor: Colors.red,
                              splashColor: Colors.blueAccent,
                              onTap: () {
                                setState(() {
                                  for (var element in sampleData) {
                                    element.isSelected = false;
                                  }
                                  sampleData[index].isSelected = true;
                                  sampleDataa = true;
                                });
                              },
                              child: RadioItem(sampleData[index]),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                  elevation: sampleData1 ? 10.0 : 0,
                  margin: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      const Text('Customer Service'),
                      Container(
                        height: 70,
                        width: double.infinity,
                        color: Colors.white,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: sampleDataone.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: InkWell(
                                //highlightColor: Colors.red,
                                splashColor: Colors.blueAccent,
                                onTap: () {
                                  setState(() {
                                    for (var element in sampleDataone) {
                                      element.isSelected = false;
                                    }
                                    sampleDataone[index].isSelected = true;
                                    sampleData1 = true;
                                  });
                                },
                                child: RadioItemone(sampleDataone[index]),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 150),
                child: Text(
                  'Do you have any Comments ?',
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  minLines: 3,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade700),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(
                              255,
                              86,
                              186,
                              233,
                            ),
                            width: 2)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 260),
                child: Text('0/3500',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 12,
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 58, 192, 250),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () {
                      setState(() {
                        if (sampleDataa == false) {
                          var snackBar = const SnackBar(
                              content: Text(
                                  'Please select how was your experience with our therapist?'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (sampleData1 == false) {
                          var snackBar = const SnackBar(
                              content: Text(
                                  'Please select how was your experience with our therapist?'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          var snackBar = const SnackBar(
                              content:
                                  Text('Success, Thanks For Your Feedback'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      });
                    },
                    child: const SizedBox(
                        width: double.infinity,
                        child: Center(child: Text('Submit')))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<DropdownMenuItem<String>> _dropDownItem() {
  List<String> ddl = [
    'Fitness 180',
    'Dalouk Wellness Spa',
    'orchid Beauty Botique',
    'Skate Cafe',
    'College cafe',
    'Ice Skatting',
    'Olympic Pool',
    'Beach',
  ];
  return ddl
      .map((value) => DropdownMenuItem(
            value: value,
            child: Text(value),
          ))
      .toList();
}
