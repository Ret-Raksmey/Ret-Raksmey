import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  Category? _selectedCategory;
  DateTime? _selectedDate;

  void _presentDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _onCancel() {
    Navigator.pop(context);
  }

  void _onAdd() {
    final title = _titleController.text;
    final amount = double.tryParse(_valueController.text);

    if (title.isEmpty || amount == null || amount <= 0 || _selectedCategory == null || _selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    final expense = Expense(
      title: title,
      amount: amount,
      date: _selectedDate!,
      category: _selectedCategory!,
    );

    widget.onCreated(expense);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: const InputDecoration(label: Text('Title')),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _valueController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(
                      prefix: Text('\$'),
                      label: Text('Amount'),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        _selectedDate == null
                            ? 'No Date Selected'
                            : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                      ),
                      IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.calendar_today),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<Category>(
                    value: _selectedCategory,
                    hint: const Text('Select Category'),
                    isExpanded: true,
                    items: Category.values.map((category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                TextButton(
                  onPressed: _onCancel,
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: _onAdd,
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
