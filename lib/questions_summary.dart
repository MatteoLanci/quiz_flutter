import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final bool isCorrect =
                data['user_answer'] == data['correct_answer'];
            final Color indexColor = isCorrect ? Colors.green : Colors.red;

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ((data['question_index'] as int) + 1).toString(),
                  style: TextStyle(
                      color: indexColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: TextStyle(
                              color: indexColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'You: ${data['user_answer'] as String}',
                          style: TextStyle(color: Colors.blue[400]),
                        ),
                        Text(
                          'Correct: ${data['correct_answer'] as String}',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 227, 127, 242)),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 120),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
