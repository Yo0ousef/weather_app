import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                'there is no weather 😔',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Center(
              child: Text(
                'start searching now 🔍',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
