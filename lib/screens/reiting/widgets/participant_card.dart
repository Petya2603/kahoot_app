import 'package:flutter/material.dart';
import '../../../config/constants/constants.dart';
import '../../../models/participant_reiting.dart';

class ParticipantCard extends StatelessWidget {
  final ParticipantResponse participant;
  final int rank;

  const ParticipantCard({
    super.key,
    required this.participant,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 5, spreadRadius: 2)
        ],
      ),
      child: Row(
        children: [
          Text('$rank.',
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black)),
          const SizedBox(width: 12),
          CircleAvatar(
              radius: 22, backgroundImage: NetworkImage(participant.avatar)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(participant.nickname,
                style: const TextStyle(
                    fontSize: 18,
                    fontFamily: Fonts.gilroyBold,
                    color: AppColors.black)),
          ),
          Row(
            children: [
              Text(
                participant.score.toString(),
                style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 20.0,
                  fontFamily: Fonts.gilroyBold,
                ),
              ),
              const SizedBox(width: 5),
              SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset('assets/images/star.png')),
            ],
          ),
        ],
      ),
    );
  }
}
