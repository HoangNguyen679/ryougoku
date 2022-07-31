import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
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
  final qrKey = GlobalKey();

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

  Future<void> saveQrCode(BuildContext context) async {
    PermissionStatus permission;
    permission = await Permission.storage.request();

    if (permission.isGranted) {
      if (qrKey.currentContext != null) {
        final boundary =
            qrKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
        final image = await boundary.toImage(pixelRatio: 5.0);
        final byteData =
            await (image.toByteData(format: ui.ImageByteFormat.png));
        if (byteData != null) {
          final pngBytes = byteData.buffer.asUint8List();
          final directory = (await getApplicationDocumentsDirectory()).path;
          final imgFile = File(
            '$directory/${DateTime.now()}$qrData.png',
          );
          imgFile.writeAsBytes(pngBytes);
          GallerySaver.saveImage(imgFile.path).then((success) {
            showDialog(
              context: context,
              builder: (context) {
                Timer(const Duration(seconds: 1), () {
                  Navigator.of(context).pop();
                });

                return AlertDialog(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Save!'),
                    ],
                  ),
                  // actions: [
                  //   TextButton(
                  //     onPressed: () => Navigator.pop(context),
                  //     child: const Text('OK'),
                  //   )
                  // ],
                );
              },
            );
          });
        }
      }
    }
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
            isGenerated
                ? ElevatedButton(
                    onPressed: () async {
                      await saveQrCode(context);
                    },
                    child: const Text('Save'),
                  )
                : ElevatedButton(
                    onPressed: null,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5);
                        } else if (states.contains(MaterialState.disabled)) {
                          return const Color(0xFF43b2d1);
                        }
                        return null;
                      }),
                    ),
                    child: const Text('Save'),
                  )
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Visibility(
          visible: isGenerated && qrData.isNotEmpty,
          child: SizedBox(
            width: 280,
            child: RepaintBoundary(
              key: qrKey,
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
        ),
      ],
    );
  }
}
