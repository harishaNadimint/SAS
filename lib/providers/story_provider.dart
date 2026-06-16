//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:sas_internshala/models/StoryModel.dart';

//import '../models/story_model.dart';

enum StoryState {
  idle,
  loading,
  playing,
  quiz,
  success,
  error,
}

class StoryProvider extends ChangeNotifier {
  final FlutterTts _tts = FlutterTts();

  StoryState state = StoryState.idle;

  bool showQuiz = false;
  bool shakeQuiz = false;

  int currentQuestionIndex = 0;

  StoryModel? currentStory;

  StoryProvider() {
    _init();
    loadRandomStory();
  }

  Future<void> _init() async {
    await _tts.setLanguage("en-US");

    _tts.setCompletionHandler(() {
      state = StoryState.quiz;
      showQuiz = true;
      notifyListeners();
    });
  }

  final List<Map<String, dynamic>> stories = [
    {
      "story":
          "Once upon a time, a clever little robot named Pip lost his shiny blue gear in the Whispering Woods.",
      "quizzes": [
        {
          "question":
              "What colour was Pip's gear?",
          "options": [
            "Red",
            "Green",
            "Blue",
            "Yellow"
          ],
          "answer": "Blue"
        }
      ]
    },
    {
      "story":
          "A brave dinosaur1 named Dino1 explored a mysterious cave.",
      "quizzes": [
        {
          "question":
              "Who explored the cave?",
          "options": [
            "Dino1",
            "Monkey",
            "Tiger",
            "Bear"
          ],
          "answer": "Dino1"
        }
      ]
    },
    {
      "story":
          "A brave dinosaur2 named Dino2 explored a mysterious cave.",
      "quizzes": [
        {
          "question":
              "Who explored the cave?",
          "options": [
            "Dino2",
            "Monkey",
            "Tiger",
            "Bear"
          ],
          "answer": "Dino2"
        }
      ]
    },
    {
      "story":
          "A brave dinosaur3 named Dino3 explored a mysterious cave.",
      "quizzes": [
        {
          "question":
              "Who explored the cave?",
          "options": [
            "Dino3",
            "Monkey",
            "Tiger",
            "Bear"
          ],
          "answer": "Dino3"
        }
      ]
    },
    {
      "story":
          "A brave Monkey named Momo explored a mysterious cave and found a treasure,then he shared it with his friends.",
      "quizzes": [
        {
          "question":
              "Who explored the cave?",
          "options": [
            "Dino",
            "Monkey",
            "Tiger",
            "Bear"
          ],
          "answer": "Monkey"
        },
         {
          "question":
              "where he went?",
          "options": [
            "cave",
            "Monkey",
            "Tiger",
            "Bear"
          ],
          "answer": "cave"
        }
      ]
    },
    
  ];


int _currentStoryIndex = 0;

void loadRandomStory() {
  _currentStoryIndex++;

  if (_currentStoryIndex >= stories.length) {
    _currentStoryIndex = 0;
  }

  currentStory = StoryModel.fromJson(
    stories[_currentStoryIndex],
  );

  currentQuestionIndex = 0;
  showQuiz = false;
   state = StoryState.idle;

  notifyListeners();
}
  // void loadRandomStory() {
  //   final random = Random();

  //   // currentStory = StoryModel.fromJson(
  //   //   stories[random.nextInt(stories.length)],
  //   // );

  //   currentQuestionIndex = 0;
  //   showQuiz = false;
  //   state = StoryState.idle;

  //   notifyListeners();
  // }

  Future<void> readStory() async {
    if (currentStory == null) return;

    state = StoryState.loading;
    notifyListeners();

    await Future.delayed(
      const Duration(milliseconds: 700),
    );

    state = StoryState.playing;
    notifyListeners();

    await _tts.speak(
      currentStory!.story,
    );
  }

  Future<void> checkAnswer(
      String selected) async {
    final quiz =
        currentStory!.quizzes[
            currentQuestionIndex];

    if (selected == quiz.answer) {
      if (currentQuestionIndex <
          currentStory!.quizzes.length -
              1) {
        currentQuestionIndex++;
      } else {
        state = StoryState.success;
      }

      notifyListeners();
    } else {
      HapticFeedback.mediumImpact();

      shakeQuiz = true;
      notifyListeners();

      await Future.delayed(
        const Duration(milliseconds: 400),
      );

      shakeQuiz = false;
      notifyListeners();
    }
  }
}