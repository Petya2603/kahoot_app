import 'package:flutter/material.dart';
import '../../../config/constants/constants.dart';
import '../../../models/participant_reiting.dart';

class PodiumBlock extends StatelessWidget {
  final ParticipantResponse participant;
  final int rank;
  final double height;
  final Color color;

  const PodiumBlock({
    super.key,
    required this.participant,
    required this.rank,
    required this.height,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
            radius: 45, backgroundImage: NetworkImage(participant.avatar)),
        const SizedBox(height: 8),
        Text(participant.nickname,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white)),
        const SizedBox(height: 8),
        Container(
          width: 90,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [color.withOpacity(0.7), color]),
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(color: Colors.black45, blurRadius: 5, spreadRadius: 2)
            ],
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$rank',
                  style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    participant.score.toString(),
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 20.0,
                      fontFamily: Fonts.gilroyBold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                      height: 25,
                      width: 25,
                      child: Image.asset('assets/images/star.png')),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
