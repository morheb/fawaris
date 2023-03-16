import 'package:fawares/product_widget.dart';
import 'package:flutter/material.dart';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final String username = 'mailer.bigbyte@gmail.com';
  final String password = 'Aa121212.';
  sendEmail() async {
    final message = Message()
      ..from = Address(username, 'مرعب')
      ..recipients.add('morhebbek@gmail.com')
      ..subject = 'Test email'
      ..text = 'This is a test email sent from Flutter ';
    final smtpServer = gmail(username, password);
    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  ProductWidget(
                    imageUrl:
                        'https://cdn.salla.sa/dWxjp/9BaPyqUHGjMkOGc90bepqOJ7tlSr0vTQueOTDUft.png',
                    name: 'منهل 18 ليتر',
                    price: '12',
                  ),
                  ProductWidget(
                    imageUrl:
                        'https://cdn.salla.sa/QezNV/hywhzSXEf5eFInAbXJToscdEMc8HJj6g9oQZoqUm.png',
                    name: 'منهل 1 ليتر',
                    price: '5',
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  await sendEmail();
                },
                child: Text("send order"))
          ],
        ),
      ),
    );
  }
}
