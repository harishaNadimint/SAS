import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/story_provider.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<StoryProvider>();

    if (provider.currentStory == null) {
      return const SizedBox.shrink();
    }

    final quiz = provider.currentStory!.quizzes[
        provider.currentQuestionIndex];

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            /// Progress Text
            Text(
              "Question ${provider.currentQuestionIndex + 1} of ${provider.currentStory!.quizzes.length}",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 8),

            /// Progress Bar
            LinearProgressIndicator(
              borderRadius:
                  BorderRadius.circular(20),
              value:
                  (provider.currentQuestionIndex + 1) /
                      provider
                          .currentStory!
                          .quizzes
                          .length,
            ),

            const SizedBox(height: 24),

            /// Question
            Text(
              quiz.question,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            /// Dynamic Options
            ...quiz.options.map(
              (option) => Padding(
                padding:
                    const EdgeInsets.only(
                  bottom: 12,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      provider.checkAnswer(
                        option,
                      );
                    },
                    style: ElevatedButton
                        .styleFrom(
                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(
                                16),
                      ),
                    ),
                    child: Text(
                      option,
                      style:
                          const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            if (provider.state ==
                StoryState.success)
              const Padding(
                padding:
                    EdgeInsets.only(
                  top: 20,
                ),
                child: Center(
                  child: Text(
                    "🎉 Great Job!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}