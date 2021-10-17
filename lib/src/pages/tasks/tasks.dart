import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/src/controllers/tasks_controller/tasks_page_controller.dart';

class TasksPage extends StatefulWidget {
  final int groupId;
  final String groupName;
  final VoidCallback deletedGroup;

  const TasksPage(this.groupId, this.groupName, this.deletedGroup(), {Key? key})
      : super(key: key);

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final tasksPageController = TasksPageController();

  @override
  void initState() {
    tasksPageController.getData(widget.groupId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.groupName} Tasks'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => tasksPageController.createTask(context),
              icon: const Icon(Icons.add)),
          IconButton(
              onPressed: () => tasksPageController.deleteTaskGroup(
                  widget.deletedGroup, context),
              icon: const Icon(Icons.delete)),
        ],
      ),
      body: Observer(
        builder: (_) => !tasksPageController.loading
            ? Center(
                child: tasksPageController.tasks.isEmpty
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.7,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/illustrations/undraw_Next_tasks_re_5eyy.svg',
                              height: 150,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: ElevatedButton(
                                onPressed: () =>
                                    tasksPageController.createTask(context),
                                child: const Text(
                                  'Create My First Task',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15),
                                ),
                                style: ButtonStyle(
                                    minimumSize: MaterialStateProperty.all(
                                        const Size(300, 50)),
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color(0XFF0984E3)),
                                    shape: MaterialStateProperty.all(
                                        const StadiumBorder())),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        padding: const EdgeInsets.all(20),
                        child: ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: tasksPageController.tasks.length,
                            itemBuilder: (context, index) => ListTile(
                                  leading: Checkbox(
                                    value: false,
                                    onChanged: (newValue) {
                                      setState(() {
                                        tasksPageController.deleteTask(
                                            tasksPageController
                                                .tasks[index].id!,
                                            index);
                                      });
                                    },
                                  ),
                                  title: Text(tasksPageController
                                      .tasks[index].taskName!),
                                )),
                      ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
