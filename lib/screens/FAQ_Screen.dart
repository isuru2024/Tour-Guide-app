import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xdf460000),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text('FAQ'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FAQItem(
                question: 'What are the main features of this app?',
                answer:
                    'This app offers detailed information on popular tourist destinations in Sri Lanka, including attractions, activities, accommodations, local cuisine, and cultural experiences. It also provides maps, itineraries, and booking options for your convenience.',
              ),
              SizedBox(height: 20),
              FAQItem(
                question: 'How can I add a destination to my favorites?',
                answer:
                    'To add a destination to your favorites, navigate to the destination details page and tap on the heart icon.',
              ),
              FAQItem(
                question: 'How do I plan my trip using the app?',
                answer:
                    'You can use the app to browse through different destinations, read reviews, and explore suggested itineraries based on your interests. You can also save your favorite places and activities to create a personalized travel plan.',
              ),
              FAQItem(
                question: 'Is the app free to use?',
                answer:
                    'Yes, the app is free to download and use. You can access most of the information and features without any cost. Some premium services, like special tour packages, may require additional fees.',
              ),
              FAQItem(
                question: 'Does the app work offline?',
                answer:
                    'Yes, certain features such as saved maps, itineraries, and destination details are available offline. However, for real-time updates, booking services, and weather forecasts, you will need an internet connection.',
              ),
              FAQItem(
                question: 'Can I share my travel experience through the app?',
                answer:
                    'Yes, you can leave reviews and ratings for attractions, restaurants, and accommodations, allowing other users to benefit from your experience. You can also share your travel stories and photos with the community.',
              ),
              FAQItem(
                  question:
                      'What should I do if I encounter a problem with the app?',
                  answer:
                      'If you experience any issues, you can reach out to our support team through the app’s help section or contact us via email. We are here to assist you with any technical issues or questions you may have.'),
              // Add more FAQ items as needed
            ],
          ),
        ),
      ),
    );
  }
}

class FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  const FAQItem({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);

  @override
  _FAQItemState createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            widget.question,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: IconButton(
            icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
            onPressed: () {
              setState(() {
                _expanded = !_expanded;
              });
            },
          ),
        ),
        if (_expanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(widget.answer),
          ),
        const Divider(),
      ],
    );
  }
}
