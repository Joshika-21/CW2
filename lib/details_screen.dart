import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Map<String, dynamic> recipe;

  DetailsScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    List<String> instructions = recipe['instructions']!.split('. ');

    return Scaffold(
      appBar: AppBar(title: Text(recipe['name']!)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Adjusted Image Container to Prevent Cropping
              Container(
                width: double.infinity,
                height: 250, // Adjusted height for better visibility
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  recipe['image']!,
                  fit:
                      BoxFit
                          .contain, // Ensures full image is visible without cropping
                ),
              ),
              SizedBox(height: 16),

              // Ingredients Section
              Text(
                'Ingredients:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(recipe['ingredients']!),
              SizedBox(height: 16),

              // Instructions Section with Bullet Points
              Text(
                'Instructions:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    instructions.map((step) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '• ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              step.trim(),
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
