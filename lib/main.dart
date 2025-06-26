import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'BMI App'),
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
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor = Colors.indigo.shade50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text("BMI APP"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'BMI Calculator',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: wtController,
              decoration: const InputDecoration(
                label: Text('Enter your Weight (in Kg)'),
                prefixIcon: Icon(Icons.line_weight),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: ftController,
              decoration: const InputDecoration(
                label: Text('Enter your Height (in Feet)'),
                prefixIcon: Icon(Icons.height),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: inController,
              decoration: const InputDecoration(
                label: Text('Enter your Height (in Inch)'),
                prefixIcon: Icon(Icons.height_outlined),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                var wt = wtController.text.toString();
                var ft = ftController.text.toString();
                var inch = inController.text.toString();

                if (wt != "" && ft != "" && inch != "") {
                  var iwt = int.parse(wt);
                  var ift = int.parse(ft);
                  var iinch = int.parse(inch);

                  var totalInch = (ift * 12) + iinch;
                  var totalCm = totalInch * 2.54;
                  var totalM = totalCm / 100;

                  var bmi = iwt / (totalM * totalM);
                  var msg = "";

                  if (bmi > 25) {
                    msg = "You're Overweight!!";
                    bgColor = Colors.redAccent;
                  } else if (bmi < 18) {
                    msg = "You're Underweight!!";
                    bgColor = Colors.orangeAccent;
                  } else {
                    msg = "You're Healthy!!";
                    bgColor = Colors.greenAccent;
                  }

                  setState(() {
                    result = "$msg\nYour BMI is: ${bmi.toStringAsFixed(4)}";
                  });
                } else {
                  setState(() {
                    result = "Please fill all fields!";
                  });
                }
              },
              child: const Text("Calculate"),
            ),
            const SizedBox(height: 20),
            Text(
              result,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
