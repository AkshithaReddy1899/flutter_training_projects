import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              //height: MediaQuery.of(context).size.height / 2 - 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: const AssetImage('assets/images/background.jpg'),
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.3), BlendMode.dstIn),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/coal-svg.svg',
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.yellow,
              // height: MediaQuery.of(context).size.height / 2 - 40,
              child: const Center(
                child: Text('Look, I am poor.'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
