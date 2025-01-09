import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class PackageImageDetailScreen extends StatelessWidget {
  final DocumentSnapshot imageData;

  const PackageImageDetailScreen({Key? key, required this.imageData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Package Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    imageData['name'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    'assets/${imageData['packagePath']}',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Details:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    imageData['description'],
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text("Contact Us    "),
                      IconButton(
                        icon: const Icon(Icons.phone),
                        onPressed: () => _launchPhoneCall(
                            '0770500641'), // Replace with your phone number
                      ),
                      IconButton(
                        icon: const Icon(Icons.message),
                        onPressed: () => _launchSMS(
                            '0770500641'), // Replace with your phone number
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text("Share    "),
                      IconButton(
                        icon: const Icon(Icons.share),
                        onPressed: () => _sharePackage(context),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchPhoneCall(String phoneNumber) async {
    String url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchSMS(String phoneNumber) async {
    String url = 'sms:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _sharePackage(BuildContext context) {
    final String packageName = imageData['name'];
    final String packageDescription = imageData['description'];

    Share.share(
      'Check out this amazing package: $packageName\n\nDescription: $packageDescription',
      subject: packageName,
      sharePositionOrigin: Rect.fromCenter(
        center: MediaQuery.of(context).size.bottomCenter(Offset.zero),
        width: 0,
        height: 0,
      ),
    );
  }
}
