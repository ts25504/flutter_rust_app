import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: GreetingWidget(),
        ),
      ),
    );
  }
}

class GreetingWidget extends StatefulWidget {
  @override
  _GreetingState createState() => _GreetingState();
}

class _GreetingState extends State<GreetingWidget> {
  static const platform = const MethodChannel('com.sakari/greetings');
  String _message = 'Hello';

  Future<void> _getGreetingMessage() async {
    String message;
    try {
      message = await platform.invokeMethod('greetings');
    } on PlatformException catch (e) {
      message = 'Failed to get greeting message';
    }

    setState(() {
      _message = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    _getGreetingMessage();
    return Material(
      child: Center(
        child: Text(_message),
      ),
    );
  }
}
