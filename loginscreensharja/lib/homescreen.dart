import 'package:flutter/material.dart';
import 'package:login_screensharja/radioclass.dart';

List<String> images = [
  'assests/bannerone.jpeg',
  'assests/bannertwo.png',
  'assests/bannerthree.jpg',
  'assests/bannerfour.jpeg',
  'assests/bannerfive.jpeg',
  'assests/bannersix.jpg',
  'assests/bannerseven.jpg'
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ServiceIcon> sampleData = <ServiceIcon>[];

  bool sampleIcon = false;

  void initState() {
    super.initState();
    sampleData.add(ServiceIcon(
      false,
      Icons.self_improvement_outlined,
    ));
    sampleData.add(ServiceIcon(
      false,
      Icons.local_hospital,
    ));
    sampleData.add(ServiceIcon(
      false,
      Icons.palette,
    ));
    sampleData.add(ServiceIcon(
      false,
      Icons.pool,
    ));
    sampleData.add(ServiceIcon(
      false,
      Icons.card_travel,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              height: 190,
              color: Colors.white,
              child: Stack(
                children: [
                  PageView.builder(
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: SizedBox(
                            height: 180,
                            width: double.infinity,
                            child: Image.asset(
                              images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }),
                  Positioned(
                    left: 20,
                    child: IconButton(
                      icon: Icon(Icons.visibility),
                      iconSize: 30,
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ],
              )),
          const Padding(
            padding: EdgeInsets.only(right: 320),
            child: Text(
              'Services',
              style: TextStyle(
                  color: Color.fromARGB(255, 58, 192, 250),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 70,
            width: double.infinity,
            // color: Colors.white,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sampleData.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: InkWell(
                    splashColor: Colors.blueAccent,
                    onTap: () {
                      setState(() {
                        for (var element in sampleData) {
                          element.isSelected = false;
                        }
                        sampleData[index].isSelected = true;
                        sampleIcon = true;
                      });
                    },
                    child: RadioIcon(sampleData[index]),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: Text(
                  'Health & Beauty',
                  style: TextStyle(
                      color: Color.fromARGB(255, 58, 192, 250),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'see all',
              )
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    height: 190,
                    width: 140,
                    color: Colors.purple,
                    child: Image.asset(
                      'assests/dalouk.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 190,
                    width: 140,
                    color: Colors.purple,
                    child: Image.asset(
                      'assests/orchid.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 190,
                    width: 140,
                    color: Colors.purple,
                    child: Image.asset(
                      'assests/fitness.jpg',
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RadioIcon extends StatelessWidget {
  final ServiceIcon _item;

  const RadioIcon(this._item, {super.key});
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 58, 192, 250),
                    radius: 25,
                    child: Icon(_item.iconData,
                        color: _item.isSelected ? Colors.orange : Colors.white,
                        size: 35.0),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ],
    );
  }
}
