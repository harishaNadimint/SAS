import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sas_internshala/widgets/FlipStoryCard.dart';
import 'package:sas_internshala/widgets/quitz_card.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../providers/story_provider.dart';
import '../widgets/story_card.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  late ConfettiController confetti;

  @override
  void initState() {
    super.initState();

    confetti = ConfettiController(duration: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    confetti.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<StoryProvider>();

    if (provider.state == StoryState.success) {
      confetti.play();
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 53, 175, 220),

      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            ConfettiWidget(
  confettiController: confetti,
  blastDirectionality:
      BlastDirectionality.explosive,
  numberOfParticles: 30,
  gravity: 0.2,
),

            SingleChildScrollView(
              padding: const EdgeInsets.all(20),

              child: Column(
                children: [
                  const SizedBox(height: 20),





// TweenAnimationBuilder(
//   duration: const Duration(milliseconds: 600),
//   tween: Tween(begin: 0.0, end: 20.0),
//   builder: (context, value, child) {
//     return Transform.translate(
//       offset: Offset(0, provider.state == StoryState.playing ? value : 0),
//       child: child,
//     );
//   },
//   child: CircleAvatar(
//     radius: 70,
//     backgroundImage: AssetImage(
//       "assets/images/bot.png",
//     ),
//   ),
// ),


// const SizedBox(height: 20),


AnimatedContainer(
  duration: const Duration(milliseconds: 500),
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    boxShadow: provider.state == StoryState.playing
        ? [
            BoxShadow(
              color: const Color.fromARGB(255, 231, 36, 36).withOpacity(0.6),
              blurRadius: 30,
              spreadRadius: 30,
            )
          ]
        : [],
  ),
  child: CircleAvatar(


    radius: 70,
    backgroundImage: AssetImage(
      "assets/images/bot.png",
    ),
  ),
   // radius: 70,
    


  ),



const SizedBox(height: 20),

















                 

                  FlipStoryCard(
                    front: StoryCard(story: provider.currentStory?.story ?? ""),
                    back: const QuizCard(),
                  ),

                  // Card(
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(24),
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(16),
                  //     child: Text(
                  //       provider.storyText,
                  //       style: const TextStyle(fontSize: 18),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: provider.state == StoryState.playing
                        ? null
                        : provider.readStory,
                    child: Text(
                      provider.state == StoryState.loading
                          ? "Preparing..."
                          : "Read Me a Story",
                    ),
                  ),

                  const SizedBox(height: 20),

                  const SizedBox(height: 12),

                  ElevatedButton(
                    onPressed: () {
                      provider.loadRandomStory();
                    },
                    child: const Text("📚 New Story"),
                  ),

                  const SizedBox(height: 20),

                  if (provider.state == StoryState.error)
                    Column(
                      children: [
                        Text("Oops! Couldn't read the story."),
                        ElevatedButton(
                          onPressed: () async {
                            provider.loadRandomStory();
                            await provider.readStory();
                          },
                          child: const Text("Retry"),
                        ),
                      ],
                    ),

                  if (provider.showQuiz) const QuizCard(),




                  if (provider.state ==
    StoryState.success)
  Container(
    width: double.infinity,
    margin: const EdgeInsets.only(
      top: 20,
    ),
    padding: const EdgeInsets.all(
      20,
    ),
    decoration: BoxDecoration(
      color: Colors.green.shade100,
      borderRadius:
          BorderRadius.circular(24),
    ),
    child: const Column(
      children: [

        Text(
          "🎉 Success!",
          style: TextStyle(
            fontSize: 28,
            fontWeight:
                FontWeight.bold,
          ),
        ),

        SizedBox(height: 12),

        Text(
          "Great job! You answered correctly.",
          textAlign:
              TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    ),
  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
