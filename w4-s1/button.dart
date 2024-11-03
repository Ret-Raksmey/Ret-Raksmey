import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String buttonLabel;
  final IconData buttonIcon;
  final String? iconPosition;
  final String buttonType;

  const CustomButton({
    required this.buttonLabel,
    required this.buttonIcon,
    this.iconPosition,
    required this.buttonType,
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  Color _buttonColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: _getButtonColor(),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.iconPosition == 'left') ...[
            Icon(widget.buttonIcon, size: 18),
            SizedBox(width: 8),
          ],
          Text(widget.buttonLabel),
          if (widget.iconPosition == 'right') ...[
            SizedBox(width: 8),
            Icon(widget.buttonIcon, size: 18),
          ],
        ],
      ),
    );
  }

  Color _getButtonColor() {
    switch (widget.buttonType) {
      case 'primary':
        return Colors.blue;
      case 'secondary':
        return Colors.green;
      case 'disabled':
        return Colors.grey;
      default:
        return Colors.blue;
    }
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Buttons',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Buttons'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomButton(
                buttonLabel: 'Submit',
                buttonIcon: Icons.check,
                iconPosition: 'right',
                buttonType: 'primary',
              ),
              SizedBox(height: 16),
              CustomButton(
                buttonLabel: 'Time',
                buttonIcon: Icons.punch_clock_outlined,
                iconPosition: 'right',
                buttonType: 'secondary',
              ),
              SizedBox(height: 16),
              CustomButton(
                buttonLabel: 'Account',
                buttonIcon: Icons.class_,
                iconPosition: 'right',
                buttonType: 'disabled',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
