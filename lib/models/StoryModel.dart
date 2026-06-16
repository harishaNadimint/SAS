// // ignore: file_names
// import 'package:sas_internshala/models/quitz_model.dart';
// //import 'package:sas_internshala/models/quiz_model.dart';

// class StoryModel {
//   final String story;
//   final List<QuizModel> quizzes;

//   StoryModel({
//     required this.story,
//     required this.quizzes,
//   });

//   factory StoryModel.fromJson(
//       Map<String, dynamic> json) {
//     return StoryModel(
//       story: json['story'],
//       quizzes: (json['quizzes'] as List)
//           .map(
//             (e) => QuizModel.fromJson(e),
//           )
//           .toList(),
//     );
//   }
// }





import 'package:sas_internshala/models/quitz_model.dart' show QuizModel;

//import 'quiz_model.dart';

class StoryModel {
  final String story;
  final List<QuizModel> quizzes;

  StoryModel({
    required this.story,
    required this.quizzes,
  });

  factory StoryModel.fromJson(
      Map<String, dynamic> json) {
    return StoryModel(
      story: json['story'],
      quizzes: (json['quizzes'] as List)
          .map((e) => QuizModel.fromJson(e))
          .toList(),
    );
  }
}