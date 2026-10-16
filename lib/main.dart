import 'package:flutter/material.dart';

void main() => runApp(const DirectoryApp());

class Student {
  final String name;
  final String course;
  final int yearLevel;
  final String email;

  const Student({
    required this.name,
    required this.course,
    required this.yearLevel,
    required this.email,
  });
}

  const List<Student> students = [
    Student(
      name: 'Jed B. Mendoza',
      course: 'BS Information Technology',
      yearLevel: 3,
      email: 'jed.mendoza@csucc.edu.ph'
    ),
    Student(
      name: 'John Hope Maribao',
      course: 'BS Information Technology',
      yearLevel: 3,
      email: 'john.hope.maribao@csucc.edu.ph'
    ),
    Student(
      name: 'Jonard Osa',
      course: 'BS Information Technology',
      yearLevel: 3,
      email: 'jonard.osa@csucc.edu.ph'
    ),
    Student (
      name: 'Ken Luminads',
      course: 'BS Information Technology',
      yearLevel: 3,
      email: 'ken.luminads@csucc.edu.ph'
    )
  ];
class DirectoryApp extends StatelessWidget {
  const DirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Directory',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.teal, // Customization 1: teal theme seed color
        useMaterial3: true,
      ),
      home: const DirectoryScreen(),
    );
  }
}

class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Directory'),
        backgroundColor: colors.primary, // Customization 2: solid colored AppBar
        foregroundColor: colors.onPrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16), // Customization 3: extra spacing around the list
        children: [
          const SectionHeader(title: 'Students'),
          const SizedBox(height: 8),
          for (final student in students) StudentCard(student: student),
        ],
      ),
    );
  }
}

// Stateless: it only displays the title it receives through its constructor.
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const Divider(),
      ],
    );
  }
}

// Stateless: it shows one icon and one text that are passed in, nothing else.
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 6), // small gap between icon and text
        Expanded(
          child: Text(text, style: const TextStyle(fontSize: 13)),
        ),
      ],
    );
  }
}

// Stateless: it renders the Student it is given; a new Student means the parent builds a new card.
class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // Customization 4: rounded Card corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: colors.primary, // Customization 5: avatar color
              child: Text(
                student.name[0],
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: colors.onPrimary,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold, // Customization 6: bold name TextStyle
                    ),
                  ),
                  Text(
                    student.course,
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  const SizedBox(height: 8),
                  InfoRow(
                    icon: Icons.school,
                    text: 'Year ${student.yearLevel}',
                  ),
                  const SizedBox(height: 4),
                  InfoRow(icon: Icons.email, text: student.email),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}