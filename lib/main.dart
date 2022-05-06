import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tp/models/film.dart';
import 'package:flutter_tp/services/film_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);
  final FilmService _filmService = FilmService();
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // inspect(widget._filmService.getFilm());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tp MADANI Houssem'),
      ),
      body: FutureBuilder(
          future: widget._filmService.getFilm(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // ignore: unused_local_variable
              Film data = snapshot.data as Film;
              String type = data.contentType == 'm' ? 'movie' : 'show';
              inspect(type);
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                          "https://img.reelgood.com/content/$type/${data.id}/poster-780.jpg"),
                      Center(
                          child: Text(
                        '${data.title}',
                        style:
                            const TextStyle(fontSize: 30, color: Colors.amber),
                      )),
                      const Text(
                        "Description : ",
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        "${data.overview}",
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {});
                          },
                          child: const Text(
                            "Spin",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator(), );
          }),
    );
  }
}
