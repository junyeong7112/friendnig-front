import 'package:flutter/material.dart';
import 'package:prototype_0/address_book/json_url.dart';
import 'package:prototype_0/address_book/json_to_dart.dart';

import '../home.dart';

class JsonParse extends StatefulWidget {
  const JsonParse({Key? key}) : super(key: key);

  @override
  State<JsonParse> createState() => _JsonParseState();
}

class _JsonParseState extends State<JsonParse> {
  List<User> _user = <User>[];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    Services.getInfo().then((value) {
      setState(() {
        _user = value;
        loading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 238, 235, 235),
            elevation: 5,
            title: loading
                ? Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 202, 202, 202),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.search_outlined,
                            color: Color.fromARGB(255, 47, 85, 151)),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            'search',
                            style: TextStyle(
                                color: Color.fromARGB(255, 47, 85, 151),
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  )
                : const Text(
                    'Loading...',
                    style: TextStyle(
                        color: Color.fromARGB(255, 47, 85, 151),
                        fontWeight: FontWeight.w900,
                        fontSize: 25),
                  )),
        body: ListView.builder(
          itemCount: _user.length,
          itemBuilder: ((context, index) {
            User user = _user[index];
            return ListTile(
              leading: const Icon(
                Icons.account_circle_rounded,
                color: Colors.blue,
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.phone_android_outlined,
                  color: Colors.red,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(user.name),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(user.phone),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Close'))
                            ],
                          ),
                        );
                      });
                },
              ),
              title: Text(user.name),
              subtitle: Text(user.email),
            );
          }),
        ),
        bottomNavigationBar: Container(
          height: 50.0,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 10)
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
