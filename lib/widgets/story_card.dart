// import 'package:flutter/material.dart';

// class StoryCard extends StatelessWidget {
//   final String story;

//   const StoryCard({
//     super.key,
//     required this.story,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(24),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Text(
//           story,
//           style: const TextStyle(
//             fontSize: 18,
//             height: 1.5,
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  final String story;

  const StoryCard({
    super.key,
    required this.story,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            offset: Offset(0, 4),
            color: Colors.black12,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.menu_book_rounded),
              SizedBox(width: 8),
              Text(
                "Story Time",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          SizedBox(height: 16),

          Text(
            story,
            style: const TextStyle(
              fontSize: 18,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}