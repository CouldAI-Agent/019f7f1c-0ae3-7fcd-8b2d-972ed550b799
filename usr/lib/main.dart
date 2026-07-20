import 'package:flutter/material.dart';

void main() {
  runApp(const ResumeApp());
}

class ResumeApp extends StatelessWidget {
  const ResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resume',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ResumeScreen(),
      },
    );
  }
}

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: ListView(
              padding: const EdgeInsets.all(24.0),
              children: [
                _buildHeader(context),
                const SizedBox(height: 32),
                _buildSectionTitle(context, 'Summary'),
                const Text(
                  'Experienced Software Engineer with a passion for building scalable, '
                  'user-friendly applications. Proven ability to lead teams and deliver '
                  'high-quality software solutions across various platforms including '
                  'mobile and web.',
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
                const SizedBox(height: 32),
                _buildSectionTitle(context, 'Experience'),
                _buildExperienceItem(
                  'Senior Software Engineer',
                  'TechCorp Solutions',
                  'Jan 2021 - Present',
                  'Led the development of a cross-platform mobile application using Flutter, '
                  'resulting in a 40% increase in user engagement. Architected the backend '
                  'services using Node.js and PostgreSQL.',
                ),
                const SizedBox(height: 24),
                _buildExperienceItem(
                  'Software Engineer',
                  'Innovate LLC',
                  'Jun 2018 - Dec 2020',
                  'Developed and maintained RESTful APIs for a high-traffic e-commerce '
                  'platform. Implemented CI/CD pipelines to automate testing and deployment.',
                ),
                const SizedBox(height: 32),
                _buildSectionTitle(context, 'Education'),
                _buildExperienceItem(
                  'B.S. in Computer Science',
                  'University of Technology',
                  '2014 - 2018',
                  'Graduated with Honors. Specialized in Software Engineering and Human-Computer Interaction.',
                ),
                const SizedBox(height: 32),
                _buildSectionTitle(context, 'Skills'),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    'Flutter', 'Dart', 'Node.js', 'Python', 'React',
                    'PostgreSQL', 'Docker', 'AWS', 'Git', 'Agile'
                  ].map((skill) => Chip(label: Text(skill))).toList(),
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jane Doe',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Software Engineer',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.grey[700],
              ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16.0,
          runSpacing: 8.0,
          children: [
            _buildContactInfo(Icons.email, 'jane.doe@example.com'),
            _buildContactInfo(Icons.phone, '+1 (555) 123-4567'),
            _buildContactInfo(Icons.location_on, 'San Francisco, CA'),
          ],
        ),
      ],
    );
  }

  Widget _buildContactInfo(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        const SizedBox(width: 8),
        Text(text, style: TextStyle(color: Colors.grey[700])),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 2,
            width: 40,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(
      String title, String company, String date, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Text(
              date,
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          company,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[800],
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(fontSize: 15, height: 1.5),
        ),
      ],
    );
  }
}
