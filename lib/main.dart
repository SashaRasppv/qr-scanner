import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QrCode(),
    );
  }
}

class QrCode extends StatefulWidget {
  const QrCode({super.key});

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  @override
  Widget build(BuildContext context) {
    String scansData = '';

    // scan function

    scanFunction() async {
      await FlutterBarcodeScanner.scanBarcode(
              '#18b586', 'Cancel', true, ScanMode.QR)
          .then((value) => setState(() => scansData = value));
    }

    // scan function

    // ------------

    // result

    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(scansData)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => scanFunction(),
        child: const Center(child: Text('Scan')),
      ),
    );

    // result
  }
}
