import 'package:flutter/material.dart';
import 'package:task1/features/widgets/custome_check_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> tasks = [];
  bool? checkedValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                String taskTitle = '';
                TimeOfDay? selectedTime;
                return AlertDialog(
                  title: Text('Task title'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        onChanged: (value) {
                          taskTitle = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter task',
                        ),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            child: Text('Select Time'),
                            onPressed: () async {
                              final TimeOfDay? picked = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (picked != null && picked != selectedTime)
                                setState(() {
                                  selectedTime = picked;
                                });
                            },
                          ),
                          ElevatedButton(
                            child: Text('Submit'),
                            onPressed: () {
                              setState(() {
                                if (selectedTime != null)
                                  tasks.add(
                                      '$taskTitle \n${selectedTime?.format(context)}');
                                else {
                                  tasks.add('$taskTitle');
                                }
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10), // Set the radius of the corners
          ),
        ),
        appBar: AppBar(actions: [
          Container(
            child: CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage("assets/images/Left Icon.png"),
            ),
          )
        ]),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Today",
                style: TextStyle(
                    fontSize: 34,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w700),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return CustomeCheckBox(
                      tasks: tasks,
                      titleText: tasks[index],
                      callback: (task) {
                        setState(() {
                          tasks.remove(task);
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
