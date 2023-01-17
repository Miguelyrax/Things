import 'package:flutter/material.dart';
import 'package:things/proyects/custom_switch_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/',
      routes:{
        '/':(_)=>const HomeWidget(),
        'switch':(_)=>const CustomSwitchWidget(),
      },
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: ()=>Navigator.pushNamed(context, 'switch'),
                  child: const Text('CustomSwitch')
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}