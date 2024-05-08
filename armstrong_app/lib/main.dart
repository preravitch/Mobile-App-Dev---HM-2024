import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int startingNumber = 0;
  int nextArmstrongNumber = 0; //searched next Armstrong number
  bool isFinding = false;

  void findNextArmstrongNumber(int startingNum) async {
    setState(() {
      isFinding = true;
    });
    int nextArmstrong = startingNum + 1;
    while (!isArmstrong(nextArmstrong) && nextArmstrong > startingNum) {
      await Future.delayed(const Duration(milliseconds: 100));
      nextArmstrong++;
    }
    setState(() {
      nextArmstrongNumber = nextArmstrong;
      isFinding = false;
    });
  }

  bool isArmstrong(int i) {
    int sum = 0;
    int input = i;
    int digits = i.toString().length;

    while (i > 0) {
      int digit = i % 10;
      sum += pow(digit, digits).toInt();
      i ~/= 10;
    }

    return sum == input;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          foregroundColor: Colors.black,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Armstrong Number App"),
          centerTitle: true,
          shape: Border(bottom: BorderSide(color: Colors.black, width: 1.5)),
          ),
        body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          //height: MediaQuery.of(context).size.height,
          color: Color.fromARGB(255, 216, 216, 216),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //SizedBox(height: 10),
            Text(
              "Starting Number:",
               textAlign: TextAlign.left,
               style: TextStyle(fontSize: 20),
               ),
               
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.right, //set keyboard to num pad
              cursorColor: Colors.black,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                  borderRadius: BorderRadius.zero,
                ),
                //labelText: "Enter a Number",
              ),
              onChanged: (value) {
                if (value.isNotEmpty && num.tryParse(value) != null) {
                  startingNumber = int.parse(value);
                }
              },
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 150, 
                height: 50, 
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 1.5), 
                ),
                child: TextButton(
                  style: TextButton.styleFrom(foregroundColor: Colors.black),
                  onPressed: isFinding ? null : () => findNextArmstrongNumber(startingNumber),
                  child: isFinding ? CircularProgressIndicator() : Text("Find Next Number"),
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              child: Center(
                child: Text(
                  "The next number is \n$nextArmstrongNumber",
                  style: TextStyle(fontSize: 40),
                  textAlign: TextAlign.center,
                  ),
                ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 150, 
                height: 50, 
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 1.5), 
                ),
                child: TextButton(
                  style: TextButton.styleFrom(foregroundColor: Colors.black),
                  onPressed: isFinding ? null : () => findNextArmstrongNumber(nextArmstrongNumber),
                  child: isFinding ? CircularProgressIndicator() : Text("Find Next Number"),
                ),
              ),
            ),
          ],
        ),
      ),
      ),
      )
    );
  }
}
