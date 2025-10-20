import 'package:flutter/material.dart';

class BasicInfoStep extends StatelessWidget {
  const BasicInfoStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(labelText: 'Event Title'),
        ),
        const SizedBox(height: 16),
        TextFormField(decoration: const InputDecoration(labelText: 'Subtitle')),
        const SizedBox(height: 16),
        DropdownButtonFormField(
          items: const [
            DropdownMenuItem(value: 'Technical', child: Text('Technical')),
            DropdownMenuItem(value: 'Cultural', child: Text('Cultural')),
            DropdownMenuItem(value: 'Sports', child: Text('Sports')),
            DropdownMenuItem(value: 'Academic', child: Text('Academic')),
            DropdownMenuItem(value: 'Workshop', child: Text('Workshop')),
          ],
          onChanged: (value) {},
          decoration: const InputDecoration(labelText: 'Category'),
        ),
        const SizedBox(height: 16),
        TextFormField(decoration: const InputDecoration(labelText: 'Tags')),
        const SizedBox(height: 16),
        TextFormField(
          maxLines: 5,
          decoration: const InputDecoration(labelText: 'Event Description'),
        ),
      ],
    );
  }
}
