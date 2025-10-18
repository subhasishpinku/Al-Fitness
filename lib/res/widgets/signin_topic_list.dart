import 'package:flutter/material.dart';
import 'package:aifitness/res/widgets/coloors.dart';

class SigninTopicList extends StatelessWidget {
  final List<String> topics;
  final List<bool> isVisible;
  final Function(BuildContext, String) onTopicSelected;

  const SigninTopicList({
    super.key,
    required this.topics,
    required this.isVisible,
    required this.onTopicSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ListView.separated(
        itemCount: topics.length,
        separatorBuilder: (_, __) => const SizedBox(height: 20),
        itemBuilder: (context, index) {
          return AnimatedOpacity(
            opacity: isVisible[index] ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            child: Transform.translate(
              offset: isVisible[index] ? Offset.zero : const Offset(0, 30),
              child: Align(
                alignment: Alignment.centerRight,
                child: IntrinsicWidth(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 15),
                      side: BorderSide(color: AppColors.primaryColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      foregroundColor: AppColors.primaryColor,
                      backgroundColor: AppColors.backgroundColor,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () => onTopicSelected(context, topics[index]),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        topics[index],
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
