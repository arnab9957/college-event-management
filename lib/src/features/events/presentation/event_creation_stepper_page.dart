import 'package:flutter/material.dart';
import 'package:myapp/src/features/events/presentation/widgets/basic_info_step.dart';
import 'package:myapp/src/features/events/presentation/widgets/schedule_step.dart';
import 'package:myapp/src/widgets/app_bar.dart';

class EventCreationStepperPage extends StatefulWidget {
  const EventCreationStepperPage({super.key});

  @override
  State<EventCreationStepperPage> createState() =>
      _EventCreationStepperPageState();
}

class _EventCreationStepperPageState extends State<EventCreationStepperPage> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < 5) {
            setState(() {
              _currentStep += 1;
            });
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep -= 1;
            });
          }
        },
        steps: const [
          Step(title: Text('Basic Info'), content: BasicInfoStep()),
          Step(title: Text('Schedule'), content: ScheduleStep()),
          Step(title: Text('Media'), content: Text('Media')),
          Step(title: Text('Registration'), content: Text('Registration')),
          Step(title: Text('Payment'), content: Text('Payment')),
          Step(title: Text('Review'), content: Text('Review')),
        ],
      ),
    );
  }
}
