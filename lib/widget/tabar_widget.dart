import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final String title;
  final int count;
  final IconData icon; // Added icon field

  const TabItem({
    Key? key,
    required this.title,
    required this.count,
    required this.icon, // Receive the icon as a parameter
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        

        // padding: EdgeInsets.symmetric(horizontal: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon, // Display the icon
              size: 30, // Set icon size
              color: Colors.white, // You can customize the color
            ),
            const SizedBox(width: 5), // Add space between the icon and text
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
