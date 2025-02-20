import 'package:flutter/material.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> recipes = [
    {
      'name': 'Pasta Carbonara',
      'ingredients': 'Pasta, Eggs, Cheese, Bacon',
      'instructions':
          'Boil pasta in water for 9 minutes. Cook bacon to perfection according to your preferences. Prepare the Guanciale until it is crispy and golden. Mix the sauce. Combine Pasta and Guanciale.',
      'image': 'assets/images/pasta.png',
    },
    {
      'name': 'Chicken Curry',
      'ingredients': 'Chicken, Curry Paste, Coconut Milk',
      'instructions':
          'Saute the Onions in medium hot oil. Add all the required spices. Cook the chicken for 5 to 7 minutes until it is brown on both sides. Add tomatoes and simmer for 20-25 minutes. Serve it piping hot.',
      'image': 'assets/images/curry.png',
    },
    {
      'name': 'Chocolate Cake',
      'ingredients': 'Flour, Cocoa, Sugar, Eggs, Butter',
      'instructions':
          'Preheat the oven & prepare pans. Mix all the dry ingredients. Now add wet ingredients and fold them gently. Bake the cake in the oven for 10 minutes. Frost it with desired flavour, decorate it as your wish. Serve it and munch in.',
      'image': 'assets/images/cake.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recipe Book')),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              recipes[index]['image']!,
              width: 50,
              height: 50,
            ),
            title: Text(recipes[index]['name']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(recipe: recipes[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
