import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit 5: Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // Separate results for each operation
  int addResult = 0;
  int subtractResult = 0;
  int multiplyResult = 0;
  int divideResult = 0;

  // Controllers for each text field
  TextEditingController firstAddNumController = TextEditingController();
  TextEditingController secondAddNumController = TextEditingController();

  TextEditingController firstSubNumController = TextEditingController();
  TextEditingController secondSubNumController = TextEditingController();

  TextEditingController firstMulNumController = TextEditingController();
  TextEditingController secondMulNumController = TextEditingController();

  TextEditingController firstDivNumController = TextEditingController();
  TextEditingController secondDivNumController = TextEditingController();

  // Separate functions for each operation
  void add() {
    int firstNum = int.tryParse(firstAddNumController.text) ?? 0;
    int secondNum = int.tryParse(secondAddNumController.text) ?? 0;
    setState(() {
      addResult = firstNum + secondNum;
    });
  }

  void subtract() {
    int firstNum = int.tryParse(firstSubNumController.text) ?? 0;
    int secondNum = int.tryParse(secondSubNumController.text) ?? 0;
    setState(() {
      subtractResult = firstNum - secondNum;
    });
  }

  void multiply() {
    int firstNum = int.tryParse(firstMulNumController.text) ?? 0;
    int secondNum = int.tryParse(secondMulNumController.text) ?? 0;
    setState(() {
      multiplyResult = firstNum * secondNum;
    });
  }

  void divide() {
    int firstNum = int.tryParse(firstDivNumController.text) ?? 0;
    int secondNum = int.tryParse(secondDivNumController.text) ?? 0;
    setState(() {
      divideResult = secondNum != 0 ? firstNum ~/ secondNum : 0; // Handle division by 0
    });
  }

  // Clear function to reset everything
  void clear() {
    firstAddNumController.clear();
    secondAddNumController.clear();
    firstSubNumController.clear();
    secondSubNumController.clear();
    firstMulNumController.clear();
    secondMulNumController.clear();
    firstDivNumController.clear();
    secondDivNumController.clear();

    setState(() {
      addResult = 0;
      subtractResult = 0;
      multiplyResult = 0;
      divideResult = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CALCULATOR"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Addition Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextField(
                    controller: firstAddNumController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "First Number"),
                  ),
                ),
                const Text(" + "),
                Expanded(
                  child: TextField(
                    controller: secondAddNumController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Second Number"),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.calculate),
                  onPressed: add,
                ),
                Text('= $addResult'),
              ],
            ),

            // Subtract Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextField(
                    controller: firstSubNumController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "First Number"),
                  ),
                ),
                const Text(" - "),
                Expanded(
                  child: TextField(
                    controller: secondSubNumController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Second Number"),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.calculate),
                  onPressed: subtract,
                ),
                Text('= $subtractResult'),
              ],
            ),

            // Multiply Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextField(
                    controller: firstMulNumController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "First Number"),
                  ),
                ),
                const Text(" * "),
                Expanded(
                  child: TextField(
                    controller: secondMulNumController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Second Number"),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.calculate),
                  onPressed: multiply,
                ),
                Text('= $multiplyResult'),
              ],
            ),

            // Divide Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextField(
                    controller: firstDivNumController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "First Number"),
                  ),
                ),
                const Text(" / "),
                Expanded(
                  child: TextField(
                    controller: secondDivNumController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Second Number"),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.calculate),
                  onPressed: divide,
                ),
                Text('= $divideResult'),
              ],
            ),

            // Clear Button
            ElevatedButton(
              onPressed: clear,
              child: const Text('Clear'),
            ),
          ],
        ),
      ),
    );
  }
}