import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_03/utils/color.dart';
import 'package:test_03/utils/input_style.dart';

class TaskItem {
  String? title;
  bool isDone;

  TaskItem({required this.title, this.isDone = false}); 
}

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final TextEditingController controllerText = TextEditingController();
  final key = GlobalKey<FormState>();
  List<TaskItem> tasks = [];

  void test() {
    String addText = controllerText.text.trim();

    if (key.currentState!.validate() && controllerText.text.isNotEmpty) {
      setState(() {
        tasks.add(TaskItem(title: addText));
      });
      controllerText.clear();
    } 
  }

  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsetsGeometry.all(0),
          child: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorApp.color_08,
                  ColorApp.color_08,
                  ColorApp.color_02,
                  ColorApp.color_02,
                ],
                stops: [0.0, 0.5, 0.5, 1.0]
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  height: size.height*0.9,
                  width: 350,
                  decoration: BoxDecoration(
                    color: ColorApp.color_02,
                    border: Border.all(color: ColorApp.color_09, width: 2),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Lista de tareas:',
                            style: GoogleFonts.poppins(color: ColorApp.color_04, fontSize: 30, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'Pendientes:',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins( color: ColorApp.color_03, fontWeight: FontWeight.w900, fontSize: 15),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Expanded(
                        child: ListView.builder(
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const  EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                              decoration: BoxDecoration(
                                color: ColorApp.color_02,
                                border: Border.all(color: ColorApp.color_09, width: 2),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: CheckboxListTile(
                                controlAffinity: ListTileControlAffinity.leading,
                                activeColor: ColorApp.color_08,
                                value: tasks[index].isDone, 
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    tasks[index].isDone = newValue!;
                                  });
                                },
                                title: Text(
                                  '${tasks[index].title}',
                                  style: GoogleFonts.poppins(
                                    color: tasks[index].isDone ? Colors.grey : ColorApp.color_01, 
                                    fontWeight: FontWeight.w500, 
                                    fontSize: 18,
                                    decoration: tasks[index].isDone ? TextDecoration.lineThrough : TextDecoration.none,
                                  ),
                                ),
                                secondary: IconButton(
                                  onPressed: () => setState(() => tasks.removeAt(index)), 
                                  icon: const Icon(Icons.delete, color: ColorApp.color_11,)
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          Form(
                            key: key,
                            child: TextFormField(
                              controller: controllerText,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'Añadir tarea',
                                hintStyle: GoogleFonts.poppins(color: ColorApp.color_10, fontSize: 15),
                                isDense: false,
                                  enabledBorder: InputStyles.customBorder(color: ColorApp.color_09),
                                  focusedBorder: InputStyles.customBorder(color: ColorApp.color_09),
                                  errorBorder: InputStyles.customBorder(color: ColorApp.color_11),
                                  focusedErrorBorder: InputStyles.customBorder(color: ColorApp.color_11),
                                  suffixIcon: Container(
                                  decoration: BoxDecoration(
                                    color: ColorApp.color_04,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: IconButton(
                                    onPressed: test, 
                                    icon: Icon(Icons.add, color: ColorApp.color_02,)
                                  ),
                                ),
                              ),
                              validator: (value) => (value?.trim().isEmpty ?? true) ? 'Ingrese una tarea' : null,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}