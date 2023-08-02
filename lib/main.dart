import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:logging_appenders/logging_appenders.dart';

createLogger() {
  Logger.root.level = Level.ALL;

  LogzIoApiAppender(
    apiToken: 'ToIujeviodyKLGBqKAcOCCiYbMebfjem',
    url: 'https://listener.logz.io:8071',
    labels: {'version': '1.0.0', 'build': '1'},
  ).attachToLogger(Logger.root);
}

void main() {
  createLogger();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Logz.io Test',
      theme: ThemeData(useMaterial3: true),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final _logger = Logger('com.example.logz_test_app');
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logz.io'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              child: const Text("Log '123' on Info"),
              onPressed: () {
                _logger.info("123");
              },
            ),
          ),
          ElevatedButton(
            child: const Text("Log '456' on severe"),
            onPressed: () {
              _logger.severe("456");
            },
          ),
        ],
      ),
    );
  }
}
