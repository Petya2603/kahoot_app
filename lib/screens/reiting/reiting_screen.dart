import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../config/constants/constants.dart';
import '../../models/participant_reiting.dart';
import '../../services/participant_reiting.dart';
import 'widgets/podium_block.dart';
import 'widgets/participant_card.dart';

class ReitingScreen extends StatefulWidget {
  final int quizID;

  const ReitingScreen({super.key, required this.quizID});

  @override
  ReitingScreenState createState() => ReitingScreenState();
}

class ReitingScreenState extends State<ReitingScreen> {
  late Future<List<ParticipantResponse>> futureParticipants;

  @override
  void initState() {
    super.initState();
    futureParticipants = ApiServiceParticipant().fetchQuestions(widget.quizID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(70, 23, 143, 1),
      body: FutureBuilder<List<ParticipantResponse>>(
        future: futureParticipants,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: const CircularProgressIndicator(
                  color: AppColors.white,
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error: ${snapshot.error}',
                    style: const TextStyle(color: Colors.white)));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text('No participants found.',
                    style: TextStyle(color: Colors.white)));
          } else {
            List<ParticipantResponse> participants = snapshot.data!;
            participants.sort((a, b) => (b.score).compareTo(a.score));

            return Column(
              children: [
                const SizedBox(height: 40),
                buildPodium(participants),
                Expanded(
                  child: ListView.builder(
                    itemCount: participants.length - 3,
                    itemBuilder: (context, index) {
                      return ParticipantCard(
                          participant: participants[index + 3],
                          rank: index + 4);
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget buildPodium(List<ParticipantResponse> participants) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        PodiumBlock(
            participant: participants[1],
            rank: 2,
            height: 110,
            color: Colors.grey),
        PodiumBlock(
            participant: participants[0],
            rank: 1,
            height: 160,
            color: AppColors.gold),
        PodiumBlock(
            participant: participants[2],
            rank: 3,
            height: 90,
            color: Colors.brown),
      ],
    );
  }
}
