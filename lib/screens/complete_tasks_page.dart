import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CompletedTasksPage extends StatelessWidget {
  final List<Map<String, dynamic>> completedTasks;

  const CompletedTasksPage({super.key, required this.completedTasks});

  @override
  Widget build(BuildContext context) {
    // Sort completed tasks by deadline
    List<Map<String, dynamic>> sortedCompletedTasks = List.from(completedTasks)
      ..sort((a, b) => a['deadline'].compareTo(b['deadline']));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade500,
        centerTitle: true,
        title: Text(
          "Completed Tasks",
          style: GoogleFonts.lato(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: sortedCompletedTasks.isEmpty
          ? const Center(child: Text('No completed tasks available'))
          : ListView.builder(
              itemCount: sortedCompletedTasks.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ListTile(
                    title: Text(
                      sortedCompletedTasks[index]['task'],
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    subtitle: Text(
                      'Deadline: ${formatDate(sortedCompletedTasks[index]['deadline'])}',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                );
              },
            ),
    );
  }

  // Format date to dd/MM/yy
  String formatDate(DateTime date) {
    return DateFormat('dd/MM/yy').format(date);
  }
}
