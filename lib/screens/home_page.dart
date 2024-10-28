import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todolist_app/screens/complete_tasks_page.dart';
import 'login_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool show = true;
  List<Map<String, dynamic>> tasks = [];
  final TextEditingController _controller = TextEditingController();
  DateTime? selectedDate;
  int? editingTaskIndex; // Track the task being edited

  // Sign out user and navigate to login screen
  void signOutUser() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const SignInScreen()),
    );
  }

  // Add new task
  void addTask() {
    if (_controller.text.isNotEmpty && selectedDate != null) {
      setState(() {
        tasks.add({
          'task': _controller.text,
          'completed': false,
          'deadline': selectedDate,
        });
        _controller.clear();
        selectedDate = null;
      });
    }
  }

  // Save edited task
  void saveTask() {
    if (editingTaskIndex != null && _controller.text.isNotEmpty && selectedDate != null) {
      setState(() {
        tasks[editingTaskIndex!]['task'] = _controller.text;
        tasks[editingTaskIndex!]['deadline'] = selectedDate;
        _controller.clear();
        selectedDate = null;
        editingTaskIndex = null; // Reset editing index
      });
    }
  }

  // Toggle task completion
  void toggleTaskCompletion(int index) {
    setState(() {
      tasks[index]['completed'] = !tasks[index]['completed'];
    });
  }

  // Select a date for the task
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Format date to dd/MM/yy
  String formatDate(DateTime date) {
    return DateFormat('dd/MM/yy').format(date);
  }

  // Edit task
  void editTask(int index) {
    setState(() {
      _controller.text = tasks[index]['task'];
      selectedDate = tasks[index]['deadline'];
      editingTaskIndex = index; // Set the index of the task being edited
    });
  }

  // Delete task
  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
      if (editingTaskIndex == index) {
        editingTaskIndex = null; // Reset if the edited task is deleted
      }
    });
  }

  // Reset all tasks with confirmation
  void resetAllTasks() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm'),
          content: const Text('Are you sure you want to clear all tasks?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text('Clear'),
              onPressed: () {
                setState(() {
                  tasks.clear(); // Clear all tasks
                  editingTaskIndex = null; // Reset editing index
                });
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> sortedTasks = List.from(tasks)
      ..sort((a, b) {
        if (a['completed'] == b['completed']) {
          return a['deadline'].compareTo(b['deadline']);
        }
        return a['completed'] ? 1 : -1;
      });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade500,
        centerTitle: true,
        title: Text(
          "Task Management",
          style: GoogleFonts.lato(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: signOutUser,
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      floatingActionButton: Stack(
        alignment: Alignment.bottomRight,
        children: [
          // Reset All Tasks button
          FloatingActionButton(
            onPressed: resetAllTasks,
            backgroundColor: Colors.red,
            child: const Icon(
              Icons.refresh,
              size: 30,
              color: Colors.white,
            ),
          ),
          // Completed Tasks button
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: FloatingActionButton(
              onPressed: () {
                List<Map<String, dynamic>> completedTasks =
                    tasks.where((task) => task['completed']).toList();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CompletedTasksPage(completedTasks: completedTasks),
                  ),
                );
              },
              backgroundColor: Colors.blue,
              child: const Icon(
                Icons.task,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          // Add Task button
          Padding(
            padding: const EdgeInsets.only(bottom: 120),
            child: FloatingActionButton(
              onPressed: () {
                if (editingTaskIndex != null) {
                  saveTask(); // Save changes if editing
                } else {
                  addTask(); // Add new task
                }
              },
              backgroundColor: Colors.green,
              child: const Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Enter a new task',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (value) {
                  if (editingTaskIndex != null) {
                    saveTask(); // Save if editing
                  } else {
                    addTask(); // Add new task
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedDate == null
                        ? 'No deadline selected'
                        : 'Deadline: ${formatDate(selectedDate!)}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: const Text('Select Deadline'),
                  ),
                ],
              ),
            ),
            // Save button when editing
            if (editingTaskIndex != null)
              ElevatedButton(
                onPressed: saveTask,
                child: const Text('Save'),
              ),
            Expanded(
              child: sortedTasks.isEmpty
                  ? const Center(child: Text('No tasks available'))
                  : ListView.builder(
                      itemCount: sortedTasks.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: ListTile(
                            title: Text(
                              sortedTasks[index]['task'],
                              style: TextStyle(
                                decoration: sortedTasks[index]['completed']
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                            subtitle: Text(
                              'Deadline: ${formatDate(sortedTasks[index]['deadline'])}',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    editTask(tasks.indexOf(sortedTasks[index]));
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    deleteTask(tasks.indexOf(sortedTasks[index]));
                                  },
                                ),
                                Checkbox(
                                  value: sortedTasks[index]['completed'],
                                  onChanged: (value) {
                                    toggleTaskCompletion(tasks.indexOf(sortedTasks[index]));
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}