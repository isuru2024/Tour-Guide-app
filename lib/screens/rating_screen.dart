import 'dart:async';
import 'package:flutter/material.dart';

class FeedbackItem {
  final String feedback;
  final int rating;
  final DateTime timestamp;

  FeedbackItem(
      {required this.feedback, required this.rating, required this.timestamp});
}

class FeedbackListScreen extends StatefulWidget {
  const FeedbackListScreen({super.key});

  @override
  _FeedbackListScreenState createState() => _FeedbackListScreenState();
}

class _FeedbackListScreenState extends State<FeedbackListScreen> {
  List<FeedbackItem> feedbackList = [];

  void _addFeedback(String feedback, int rating) {
    setState(() {
      feedbackList.add(FeedbackItem(
          feedback: feedback, rating: rating, timestamp: DateTime.now()));
    });
    // Set a timer to remove the feedback after 20 seconds
    Timer(const Duration(seconds: 20), () {
      setState(() {
        feedbackList.removeWhere(
            (item) => DateTime.now().difference(item.timestamp).inSeconds > 10);
      });
    });
  }

  void _editFeedback(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FeedbackFormScreen(
          onFeedbackSubmitted: (newFeedback, newRating) {
            setState(() {
              feedbackList[index] = FeedbackItem(
                  feedback: newFeedback,
                  rating: newRating,
                  timestamp: feedbackList[index].timestamp);
            });
          },
          initialFeedback: feedbackList[index].feedback,
          initialRating: feedbackList[index].rating,
        ),
      ),
    );
  }

  void _deleteFeedback(int index) {
    setState(() {
      feedbackList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xdf350d94),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text('Feedback & Ratings'),
      ),
      body: feedbackList.isEmpty
          ? const Center(
              child: Text('Add your feedback'),
            )
          : ListView.builder(
              itemCount: feedbackList.length,
              itemBuilder: (context, index) {
                final item = feedbackList[index];
                return ListTile(
                  title: Text(item.feedback),
                  subtitle: Text('Rating: ${item.rating}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _editFeedback(index),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deleteFeedback(index),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to feedback form screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FeedbackFormScreen(
                onFeedbackSubmitted: _addFeedback,
                initialFeedback: '',
                initialRating: 1,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class FeedbackFormScreen extends StatefulWidget {
  final String initialFeedback;
  final int initialRating;
  final Function(String, int) onFeedbackSubmitted;

  const FeedbackFormScreen(
      {super.key,
      required this.initialFeedback,
      required this.initialRating,
      required this.onFeedbackSubmitted});

  @override
  _FeedbackFormScreenState createState() => _FeedbackFormScreenState();
}

class _FeedbackFormScreenState extends State<FeedbackFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _feedbackController;
  late int _rating;

  @override
  void initState() {
    super.initState();
    _feedbackController = TextEditingController(text: widget.initialFeedback);
    _rating = widget.initialRating;
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Feedback'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _feedbackController,
                decoration: const InputDecoration(labelText: 'Feedback'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your feedback';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Text('Rating: $_rating'),
              Slider(
                value: _rating.toDouble(),
                min: 1,
                max: 5,
                divisions: 4,
                onChanged: (value) {
                  setState(() {
                    _rating = value.toInt();
                  });
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Submit feedback
                    widget.onFeedbackSubmitted(
                        _feedbackController.text, _rating);
                    // Navigate back
                    Navigator.pop(context);
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: FeedbackListScreen(),
  ));
}
