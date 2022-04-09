import 'package:flutter/material.dart';

class FailureView extends StatelessWidget {
  const FailureView(
      {Key? key,
      required this.title,
      required this.message,
      required this.onPressed})
      : super(key: key);

  final String title, message;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.error,
              color: Colors.red,
              size: 150,
            ),
            SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 2),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(height: 2),
            FlatButton(onPressed: onPressed, child: Text('Retry')),
          ],
        ),
      ),
    );
  }
}
