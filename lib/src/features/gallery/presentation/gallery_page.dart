import 'package:flutter/material.dart';
import 'package:myapp/src/widgets/app_bar.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(child: Text('Gallery Page')),
    );
  }
}
