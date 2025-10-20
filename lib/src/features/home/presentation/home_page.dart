import 'package:flutter/material.dart';
import 'package:myapp/src/features/home/presentation/widgets/featured_events_grid.dart';
import 'package:myapp/src/features/home/presentation/widgets/hero_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(children: [HeroSection(), FeaturedEventsGrid()]),
    );
  }
}
