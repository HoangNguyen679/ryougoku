import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

// import '../helper/encryption.dart';
import '../model/button.dart';

class GenerateQrCodeScreen extends StatefulWidget {
  const GenerateQrCodeScreen({Key? key}) : super(key: key);

  @override
  State<GenerateQrCodeScreen> createState() => _GenerateQrCodeScreenState();
}

class _GenerateQrCodeScreenState extends State<GenerateQrCodeScreen> {
  String qrData = '';
  bool isGenerated = false;

  Future<ui.Image> _loadOverlayImage() async {
    final completer = Completer<ui.Image>();
    final byteData = await rootBundle.load('assets/images/fox.jpg');
    ui.decodeImageFromList(byteData.buffer.asUint8List(), completer.complete);
    return completer.future;
  }

  void generateQrCode() {
    String text = getRandomString(16);
    debugPrint(text);
    // String base64EncodedText = Encryption().text(text);

    setState(() {
      isGenerated = true;
      qrData = text;
    });
  }

  void resetQrCode() {
    setState(() {
      isGenerated = false;
      qrData = '';
    });
  }

  Random rnd = Random();

  String getRandomString(int length) {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton.customButton(context, 'Generate QR code',
                CustomButton.onPressedByCondition(isGenerated, generateQrCode)),
            CustomButton.customButton(context, 'Reset',
                CustomButton.onPressedByCondition(!isGenerated, resetQrCode)),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Visibility(
          visible: isGenerated && qrData.isNotEmpty,
          child: SizedBox(
            width: 280,
            child: FutureBuilder<ui.Image>(
              future: _loadOverlayImage(),
              builder: (ctx, snapshot) {
                const size = 280.0;
                if (!snapshot.hasData) {
                  return const SizedBox(width: size, height: size);
                }
                return CustomPaint(
                  size: const Size.square(size),
                  painter: QrPainter(
                    data: qrData,
                    version: QrVersions.auto,
                    // eyeStyle: const QrEyeStyle(
                    //   eyeShape: QrEyeShape.square,
                    //   color: Color(0xff128760),
                    // ),
                    // dataModuleStyle: const QrDataModuleStyle(
                    //   dataModuleShape: QrDataModuleShape.circle,
                    //   color: Color(0xff1a5441),
                    // ),
                    // embeddedImage: snapshot.data,
                    // embeddedImageStyle: QrEmbeddedImageStyle(
                    //   size: const Size.square(60),
                    // ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
