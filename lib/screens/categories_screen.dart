import 'package:flutter/material.dart';
import 'package:teachingapp2/models/category.dart';
import 'package:teachingapp2/theme/app_theme.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Category> categories = Category.getDefaultCategories();

  CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (ctx, index) {
          final category = categories[index];
          return Card(
            color: AppTheme.darkSurface,
            margin: const EdgeInsets.only(bottom: 16),
            child: ExpansionTile(
              leading: Icon(
                category.icon,
                color: AppTheme.primaryColor,
                size: 28,
              ),
              title: Text(
                category.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                category.description ?? '',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              children: [
                if (category.suggestedPrompts != null)
                  ...category.suggestedPrompts!.map((prompt) => ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        title: Text(
                          prompt,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: AppTheme.primaryColor,
                            size: 16,
                          ),
                          onPressed: () {
                            // TODO: Navigate to chat screen with pre-filled prompt
                            Navigator.pop(context);
                            // Implement navigation to chat with this prompt
                          },
                        ),
                      )),
              ],
            ),
          );
        },
      ),
    );
  }
}
