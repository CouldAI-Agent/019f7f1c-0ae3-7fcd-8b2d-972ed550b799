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
                
                _buildSectionTitle(context, 'Career Objective'),
                const Text(
                  'Motivated and detail-oriented graduate seeking an entry-level position in a reputed '
                  'organization where I can utilize my communication, problem-solving, and teamwork '
                  'skills while contributing to the company\'s growth and developing my professional abilities.',
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
                const SizedBox(height: 32),

                _buildSectionTitle(context, 'Education'),
                _buildExperienceItem(
                  'B. Sc',
                  'Govt Degree College, Rajahmundry',
                  '2021-2024',
                  'Percentage: 82%',
                ),
                const SizedBox(height: 24),
                _buildExperienceItem(
                  'Intermediate',
                  'Pragati Junior College, Rajahmundry',
                  '2019-2021',
                  'Percentage: 75.4%',
                ),
                const SizedBox(height: 24),
                _buildExperienceItem(
                  'SSC',
                  'BVM High School',
                  '2019',
                  'Percentage: 87%',
                ),
                const SizedBox(height: 32),

                _buildSectionTitle(context, 'Skills'),
                const Text(
                  'Technical Skills',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    'MS Word', 'MS Excel', 'MS PowerPoint'
                  ].map((skill) => Chip(label: Text(skill))).toList(),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Soft Skills',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    'Communication Skills', 'Problem Solving', 'Adaptability', 'Leadership Skills'
                  ].map((skill) => Chip(label: Text(skill))).toList(),
                ),
                const SizedBox(height: 32),

                _buildSectionTitle(context, 'Certificate Courses'),
                _buildListItems([
                  'Digital Marketing certificate',
                  'Ms Office'
                ]),
                const SizedBox(height: 32),

                _buildSectionTitle(context, 'Internships'),
                _buildExperienceItem(
                  'Digital marketing Intern (Short Term)',
                  '',
                  '',
                  '• Managed social media content and posting.\n'
                  '• Assisted in SEO and content marketing activities.\n'
                  '• Monitored campaign performance and audience engagement.\n'
                  '• Prepared basic marketing reports.',
                ),
                const SizedBox(height: 32),

                _buildSectionTitle(context, 'Languages'),
                _buildListItems([
                  'English',
                  'Telugu'
                ]),
                const SizedBox(height: 32),
                
                _buildSectionTitle(context, 'Interests'),
                _buildListItems([
                  'Cooking',
                  'Listening to music'
                ]),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListItems(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) => Padding(
        padding: const EdgeInsets.only(bottom: 6.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('• ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Expanded(child: Text(item, style: const TextStyle(fontSize: 16))),
          ],
        ),
      )).toList(),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shaik Munnisha',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Graduate',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.grey[700],
              ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16.0,
          runSpacing: 8.0,
          children: [
            _buildContactInfo(Icons.email, 'munnishashaik52@gmail.com'),
            _buildContactInfo(Icons.phone, '+918341195399'),
            _buildContactInfo(Icons.location_on, 'Rajahmundry'),
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
            if (date.isNotEmpty)
              Text(
                date,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        ),
        if (company.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            company,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800],
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
        if (description.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(fontSize: 15, height: 1.5),
          ),
        ],
      ],
    );
  }
}
