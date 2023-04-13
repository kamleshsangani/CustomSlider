import 'package:flutter/material.dart';

import 'custom_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Custom Slider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[
      Color(0xff13B3E6),
      Color(0xff0385BF),],
  ).createShader(
    Rect.fromLTWH(100.0, 200.0, 200.0, 70.0),
  );
  final List<Widget> widgets = [];
  @override
  Widget build(BuildContext context) {
    widgets.clear();
    for (int i = 0; i <= 10; i++) {
      widgets.add(Column(
        children: [
          const Text(".",style: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w700,
        color:Color(0xff0385BF),
      ),),
          const SizedBox(height: 5,),
          Text(i.toString(),style:  TextStyle(
              fontWeight: FontWeight.w700,
            fontSize: 15,
            foreground: Paint()..shader = linearGradient,
          ),),
        ],
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Custom Slider"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: const [
                SizedBox(
                  width: 55,
                  child: Text("Not At All Likely",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff065198),
                      )),
                ),
                Spacer(),
                SizedBox(
                  width: 60,
                  child: Text(
                    "Extremely Likely",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff065198),
                    ),

                  ),
                )
              ],
            ),
          ),
          Stack(children:[const CustomSlider(),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 23, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,children: widgets,),
            )]
          ),


        ],
      ),
    );
  }
}
