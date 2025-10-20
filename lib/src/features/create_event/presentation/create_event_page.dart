import 'package:flutter/material.dart';
import 'package:myapp/src/features/create_event/presentation/widgets/add_image.dart';
import 'package:myapp/src/features/create_event/presentation/widgets/additional_information.dart';
import 'package:myapp/src/features/create_event/presentation/widgets/category_and_tags.dart';
import 'package:myapp/src/features/create_event/presentation/widgets/date_time_and_location.dart';
import 'package:myapp/src/features/create_event/presentation/widgets/event_title_and_description.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({super.key});

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Event')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const EventTitleAndDescription(),
                const SizedBox(height: 24),
                const CategoryAndTags(),
                const SizedBox(height: 24),
                const DateTimeAndLocation(),
                const SizedBox(height: 24),
                const AddImage(),
                const SizedBox(height: 24),
                const AdditionalInformation(),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, proceed with event creation
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('CREATE EVENT'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
