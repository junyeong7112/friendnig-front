import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:prototype_0/address_book/friend_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List cardList = [
    const Item1(),
    const Item2(),
    const Item3(),
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 238, 235, 235),
          elevation: 5.0,
          title: Row(
            children: const [
              Image(image: AssetImage('images/Friending_Logo/Team_Name.png')),
              Expanded(
                child: SizedBox(),
              ),
              Icon(Icons.edit_rounded, color: Color.fromARGB(255, 47, 85, 151)),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.notifications_on_outlined,
                  color: Color.fromARGB(255, 47, 85, 151)),
              SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 450.0,
                  //autoPlay: true,
                  //autoPlayInterval: Duration(seconds: 3),
                  //autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  //aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.15,
                  enableInfiniteScroll: false,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: cardList.map((card) {
                  return Builder(builder: (BuildContext context) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        //color: Colors.blueAccent,
                        child: card,
                      ),
                    );
                  });
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(cardList, (index, url) {
                  return Container(
                    width: 10.0,
                    height: 10.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? Colors.blueAccent
                          : Colors.grey,
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 50.0,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10.0, spreadRadius: 10)
          ]),
          child: BottomAppBar(
              color: const Color.fromARGB(255, 238, 235, 235),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        },
                        icon: const Icon(
                          Icons.home_rounded,
                          size: 40,
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const JsonParse()));
                        },
                        icon: const Icon(
                          Icons.person_rounded,
                          size: 40,
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        },
                        icon: const Icon(
                          Icons.shopping_bag_rounded,
                          size: 40,
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        },
                        icon: const Icon(
                          Icons.more_horiz_rounded,
                          size: 40,
                        )),
                  ],
                ),
              )),
        ));
  }
}

class Item1 extends StatelessWidget {
  const Item1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      height: 400.0,
      width: 300.0,
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      height: 400.0,
      width: 300.0,
    );
  }
}

class Item3 extends StatelessWidget {
  const Item3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      height: 400.0,
      width: 300.0,
    );
  }
}
