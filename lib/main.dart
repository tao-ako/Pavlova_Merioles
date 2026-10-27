import 'package:flutter/material.dart';

void main() {
  runApp(const StackImageActivityApp());
}

class StackImageActivityApp extends StatelessWidget {
  const StackImageActivityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Strawberry Pavlova',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFDF3E),
          surface: Colors.white,
        ),
        fontFamily: 'Roboto',
      ),
      home: const PavlovaRecipePage(),
    );
  }
}

class PavlovaRecipePage extends StatelessWidget {
  const PavlovaRecipePage({super.key});

  static const _accent = Color(0xFFFFDF3E);
  static const _cardColor = Color(0xFFFFF7FF);
  static const _ink = Color(0xFF29272B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Merioles'),
        backgroundColor: Colors.white,
        foregroundColor: _ink,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(28, 4, 28, 24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AspectRatio(
                  aspectRatio: 351 / 367,
                  child: Image.asset(
                    'assets/strawberry_pavlova.png',
                    key: const ValueKey('pavlova-image'),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  color: _cardColor,
                  padding: const EdgeInsets.fromLTRB(12, 14, 12, 10),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Strawberry Pavlova',
                        style: TextStyle(
                          color: _ink,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          height: 1.15,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Pavlova is a meringue-based dessert named after the '
                        'Russian ballerina Anna Pavlova. Pavlova features a '
                        'crisp crust and soft, light inside, topped with fruit '
                        'and whipped cream.',
                        style: TextStyle(
                          color: _ink,
                          fontSize: 13,
                          height: 1.4,
                        ),
                      ),
                      SizedBox(height: 10),
                      _RatingRow(),
                      SizedBox(height: 18),
                      _RecipeDetails(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RatingRow extends StatelessWidget {
  const _RatingRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var index = 0; index < 5; index++)
          Icon(
            index < 3 ? Icons.star : Icons.star_border,
            key: ValueKey('rating-star-$index'),
            color: PavlovaRecipePage._accent,
            size: 19,
          ),
        const SizedBox(width: 8),
        const Text(
          '90 Reviews',
          style: TextStyle(
            color: PavlovaRecipePage._ink,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _RecipeDetails extends StatelessWidget {
  const _RecipeDetails();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: _RecipeDetail(
            icon: Icons.timer_outlined,
            label: 'PREP',
            value: '25 min',
          ),
        ),
        Expanded(
          child: _RecipeDetail(
            icon: Icons.restaurant,
            label: 'COOK',
            value: '1 gr',
          ),
        ),
        Expanded(
          child: _RecipeDetail(
            icon: Icons.groups_outlined,
            label: 'FEEDS',
            value: '4-6 hrs',
          ),
        ),
      ],
    );
  }
}

class _RecipeDetail extends StatelessWidget {
  const _RecipeDetail({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: PavlovaRecipePage._accent, size: 24),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            color: PavlovaRecipePage._ink,
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(color: PavlovaRecipePage._ink, fontSize: 12),
        ),
      ],
    );
  }
}
