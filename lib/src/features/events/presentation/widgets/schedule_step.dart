import 'package:flutter/material.dart';

class ScheduleStep extends StatelessWidget {
  const ScheduleStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(labelText: 'Start Date'),
          onTap: () async {
            await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2101),
            );
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Start Time'),
          onTap: () async {
            await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          decoration: const InputDecoration(labelText: 'End Date'),
          onTap: () async {
            await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2101),
            );
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          decoration: const InputDecoration(labelText: 'End Time'),
          onTap: () async {
            await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
          },
        ),
        const SizedBox(height: 16),
        TextFormField(decoration: const InputDecoration(labelText: 'Venue')),
      ],
    );
  }
}
