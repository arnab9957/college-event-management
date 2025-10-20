import 'package:flutter/material.dart';

class CategoryAndTags extends StatefulWidget {
  const CategoryAndTags({super.key});

  @override
  State<CategoryAndTags> createState() => _CategoryAndTagsState();
}

class _CategoryAndTagsState extends State<CategoryAndTags> {
  final _categories = ['Music', 'Sports', 'Technology', 'Arts', 'Food'];
  String? _selectedCategory;
  final _tagsController = TextEditingController();
  final List<String> _tags = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Category & Tags', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          initialValue: _selectedCategory,
          items: _categories.map((category) {
            return DropdownMenuItem(value: category, child: Text(category));
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedCategory = value;
            });
          },
          decoration: const InputDecoration(labelText: 'Category'),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _tagsController,
          decoration: InputDecoration(
            labelText: 'Tags',
            suffixIcon: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                if (_tagsController.text.isNotEmpty) {
                  setState(() {
                    _tags.add(_tagsController.text);
                    _tagsController.clear();
                  });
                }
              },
            ),
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          children: _tags
              .map(
                (tag) => Chip(
                  label: Text(tag),
                  onDeleted: () {
                    setState(() {
                      _tags.remove(tag);
                    });
                  },
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
