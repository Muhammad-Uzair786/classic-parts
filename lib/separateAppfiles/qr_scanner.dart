import 'dart:convert';

import 'package:com.classic.classicparts/Providers/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import 'MainBottomNavigationPage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QRScannerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => QRScannerScreenState();
}

class QRScannerScreenState extends State<QRScannerScreen> {
  QRViewController? _controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool _isProcessing = false; // Flag to prevent multiple pop-ups
  Rect? _validScanArea;
  @override
  void initState() {
    super.initState();
   // checkAndRequestCameraPermission(); // Check and request camera permission when the screen is initialized
  }
  Future<void> checkAndRequestCameraPermission() async {
    try {
      PermissionStatus status = await Permission.camera.status;
      print("ttt${status.isGranted}");
      print("ttt${status.isDenied}");
      print("ttt${status.name}");
      if (status.isPermanentlyDenied) {
        await Permission.camera.request();
        print("first");

        status = await Permission.camera.status;
        if (!status.isGranted) {
          //_showDialog('Permission Required', 'Camera permission is required to scan QR codes.');
          print("mehrbani kr");
        }
      } else if (status.isPermanentlyDenied) {
        print("notttttttt");
      } else {
        throw Exception();
      }
    }catch(e)
    {
      print("catch");
      Navigator.pop(context);

    }
  }
  @override
  Widget build(BuildContext context) {
    var tr= AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.WhiteColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                //Navigator.pop(context);
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainBottomNavigationPage()));

              },
              child: Container(
                padding: EdgeInsets.only(left: 8, right: 6, top: 8, bottom: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: CustomColor.GradientColor
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 12,
                    color: Colors.white, // Icon color
                  ),
                ),
              ),
            ),
            Text(
              '${tr.scan_product_qrcode}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: CustomColor.BlackColor),
            ),
            SizedBox(),
          ],
        ),automaticallyImplyLeading: false,),

      body: Stack(
        children: <Widget>[
          Positioned(
            top: 10, // Adjust the positioning as needed
            left: 0, // Adjust the positioning as needed
            right: 0, // Adjust the positioning as needed
            bottom: 0, // Adjust the positioning as needed
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: CustomPaint(
                painter: MyCustomPainter(frameSFactor: .1, padding: 20),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // Calculate the valid scan area within the frame
                    _validScanArea = Rect.fromPoints(
                      Offset(20.0, 20.0), // Adjust the margins as needed
                      Offset(
                        constraints.maxWidth - 20.0, // Adjust the margins as needed
                        constraints.maxHeight - 20.0, // Adjust the margins as needed
                      ),
                    );

                    return Container();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    try {
      print("beforescancreated.....");
      setState(() {
        _controller = controller;
        _controller!.scannedDataStream.listen((scanData) {
          if (!_isProcessing) {
            _isProcessing = true;
            _handleScanData(
                scanData.code!); // Extract the code from Barcode object
          }
        });
      });
      print("afterscancreated.....");

    }catch(e)
    {
      print("handlehere.....");

    }
  }

  void _handleScanData(String scanData,) {
    print("handlebefore");
    if (RegExp(r'https?://').hasMatch(scanData)) {
      if (_validScanArea != null) {
        final scanRect = Rect.fromPoints(
          Offset(0, 0), // Adjust if necessary
          Offset(
            _validScanArea!.width,
            _validScanArea!.height,
          ),
        );
        final scanOffset = Offset(_validScanArea!.left, _validScanArea!.top);

        if (scanRect.contains(scanOffset)) {
          _launchURL(scanData);
        } else {
          _showDialog('Invalid QR Code', 'Scan QR code within the frame.');
        }
      } else {
        _launchURL(scanData);
      }
    } else {
      _showDialog('Scanned QR Code', scanData);
    }
    print("handleafter");

  }

  void _launchURL(String url) async {
    if (await launchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      print("check here .....$url");
      _showDialog('Error', 'Could not launch URL');
    }
  //  await launchUrl(Uri.parse(url));

    //_isProcessing = false; // Reset the processing flag
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: jsonDecode(message)['type']==1?Text("Click Redeem to add ${jsonDecode(message)['credit']} Cash into your wallet "):Text("Click Redeem to add ${jsonDecode(message)['credit']} Points into your wallet"),
        actions: <Widget>[
          TextButton(
            child: Text('Redeem'),
            onPressed: () async {
              print("cash-----${jsonDecode(message)['credit']}");
              print("qrcodekey-----${jsonDecode(message)['qrcodekey']}");
              print("type-----${jsonDecode(message)['type']}");
              final jsonresponse= jsonDecode(message);
              await Provider.of<ApiProvider>(context,listen: false).fetchRedeemPoints(context, jsonresponse['credit'], jsonresponse['qrcodekey'],jsonresponse['type']);


              Navigator.pop(context);
              _isProcessing = false; // Reset the processing flag
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}


///
class MyCustomPainter extends CustomPainter {
  final double padding;
  final double frameSFactor;

  MyCustomPainter({
    required this.padding,
    required this.frameSFactor,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final frameHWidth = size.width * frameSFactor;

    Paint paint = Paint()
      ..color = Colors.transparent
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..strokeWidth = 4;

    /// background
    canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTRB(0, 0, size.width, size.height),
          Radius.circular(18),
        ),
        paint);

    /// top left
    canvas.drawLine(
      Offset(0 + padding, padding),
      Offset(
        padding + frameHWidth,
        padding,
      ),
      paint..color = CustomColor.WhiteColor,
    );

    canvas.drawLine(
      Offset(0 + padding, padding),
      Offset(
        padding,
        padding + frameHWidth,
      ),
      paint..color = CustomColor.WhiteColor,
    );

    /// top Right
    canvas.drawLine(
      Offset(size.width - padding, padding),
      Offset(size.width - padding - frameHWidth, padding),
      paint..color = CustomColor.WhiteColor,
    );
    canvas.drawLine(
      Offset(size.width - padding, padding),
      Offset(size.width - padding, padding + frameHWidth),
      paint..color = CustomColor.WhiteColor,
    );

    /// Bottom Right
    canvas.drawLine(
      Offset(size.width - padding, size.height - padding),
      Offset(size.width - padding - frameHWidth, size.height - padding),
      paint..color = CustomColor.WhiteColor,
    );
    canvas.drawLine(
      Offset(size.width - padding, size.height - padding),
      Offset(size.width - padding, size.height - padding - frameHWidth),
      paint..color = CustomColor.WhiteColor,
    );

    /// Bottom Left
    canvas.drawLine(
      Offset(0 + padding, size.height - padding),
      Offset(0 + padding + frameHWidth, size.height - padding),
      paint..color = CustomColor.WhiteColor,
    );
    canvas.drawLine(
      Offset(0 + padding, size.height - padding),
      Offset(0 + padding, size.height - padding - frameHWidth),
      paint..color = CustomColor.WhiteColor,
    );
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true; //based on your use-cases
}





