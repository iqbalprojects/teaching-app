import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData icon;
  final String? description;
  final List<String>? suggestedPrompts;

  Category({
    required this.name,
    required this.icon,
    this.description,
    this.suggestedPrompts,
  });

  // Predefined categories for teaching assistant
  static List<Category> getDefaultCategories() {
    return [
      Category(
        name: 'Teaching Methodologies',
        icon: Icons.school,
        description: 'Explore different teaching approaches and strategies',
        suggestedPrompts: [
          'How can I implement project-based learning in my classroom?',
          'What are effective differentiation strategies?',
          'How to incorporate collaborative learning techniques?',
        ],
      ),
      Category(
        name: 'SOP Guidance',
        icon: Icons.assignment,
        description: 'Standard Operating Procedures for classroom management',
        suggestedPrompts: [
          'What are best practices for emergency procedures?',
          'How to handle student conflicts?',
          'Guidelines for parent-teacher communication',
        ],
      ),
      Category(
        name: 'Lesson Planning',
        icon: Icons.event_note,
        description: 'Create and organize effective lesson plans',
        suggestedPrompts: [
          'Help me create a lesson plan for mathematics',
          'How to structure a 45-minute lesson?',
          'Ideas for engaging lesson activities',
        ],
      ),
      Category(
        name: 'Question Generation',
        icon: Icons.help,
        description: 'Generate various types of questions for assessments',
        suggestedPrompts: [
          'Create quiz questions for science topic',
          'Generate critical thinking questions',
          'Formative assessment question examples',
        ],
      ),
      Category(
        name: 'Classroom Management',
        icon: Icons.people,
        description: 'Tips and strategies for managing your classroom',
        suggestedPrompts: [
          'How to handle disruptive behavior?',
          'Strategies for maintaining student engagement',
          'Setting up classroom rules and routines',
        ],
      ),
    ];
  }
}

