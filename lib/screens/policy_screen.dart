import 'package:flutter/material.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xdf024b23),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text('Policy'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              ' We respect your privacy and are committed to protecting your personal data. The information we collect includes details such as your name, email address, payment details, and location information (if enabled). This data helps us provide personalized recommendations, assist with bookings, and improve your experience. We do not share your data with third parties unless required for service delivery, like payment processing. You have the right to access, update, and delete your personal information at any time by contacting us.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '\nTerms and Conditions',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'By using this app, you agree to abide by our Terms and Conditions. This includes using the app only for lawful purposes, not engaging in fraudulent activities, and not violating the intellectual property rights of the app or third parties. We reserve the right to suspend or terminate your access if you violate these terms. We also disclaim any liability for errors in content or disruptions in service.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '\nUser Data Collection and Usage',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'To improve your experience, we collect certain data such as your device location, booking history, preferences, and interactions with our app. This data helps us provide personalized travel recommendations, offer exclusive deals, and enhance the app features. We may also use the data for marketing purposes, but we will never sell your personal information. You can manage your data preferences through the app settings or by contacting our support team.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '\nContent Ownership and Usage',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'All content within the app, including text, images, videos, logos, and graphics, is owned by us or licensed to us by third parties. You are granted a limited, non-exclusive, and non-transferable license to use this content for personal, non-commercial purposes. You may not copy, reproduce, modify, or distribute any of the app’s content without prior written consent. Any content shared by users (e.g., reviews, photos) remains the property of the user but grants us the right to use it for promotional purposes.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '\nUpdates to Policies',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'We may update our policies from time to time to reflect changes in our services or legal obligations. Any updates to our policies will be communicated to you through the app or via email. You will be required to accept the updated policies to continue using the app. We encourage you to review this page periodically for any changes. The most recent version of our policies will be available on this page with the date of the last update.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '\nSupport and Contact Information',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              ' If you have any questions or concerns about our policies, or if you need help with the app, you can contact our customer support team at support@tourapp.lk. Our team is available Monday through Friday, 9 AM to 6 PM (local time), and we aim to respond to all inquiries within 24 hours. For urgent issues, you can also reach us via the in-app support chat.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
