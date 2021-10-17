import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/src/controllers/task_groups_page_controller/task_groups_page_controller.dart';
import 'package:to_do_app/src/pages/tasks/tasks.dart';

class TaskGroupsPage extends StatefulWidget {
  const TaskGroupsPage({Key? key}) : super(key: key);

  @override
  _TaskGroupsPageState createState() => _TaskGroupsPageState();
}

class _TaskGroupsPageState extends State<TaskGroupsPage> {
  final taskGroupsPageController = TaskGroupsPageController();

  @override
  void initState() {
    taskGroupsPageController.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Groups'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () =>
                  taskGroupsPageController.createTaskGroup(context),
              icon: const Icon(Icons.add))
        ],
      ),
      body: Observer(
        builder: (_) => !taskGroupsPageController.loading
            ? taskGroupsPageController.taskGroups.isEmpty
                ? Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.7,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/illustrations/undraw_blank_canvas_3rbb.svg',
                            height: 150,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: ElevatedButton(
                              onPressed: () => taskGroupsPageController
                                  .createTaskGroup(context),
                              child: const Text(
                                'Create My First Task Group',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 15),
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
                    ),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    padding: const EdgeInsets.all(20),
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: taskGroupsPageController.taskGroups.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => TasksPage(
                                    taskGroupsPageController
                                        .taskGroups[index].id!,
                                    taskGroupsPageController
                                        .taskGroups[index].name!,
                                    () => taskGroupsPageController.getData())),
                          ),
                          title: Text(
                            taskGroupsPageController.taskGroups[index].name!,
                          ),
                          trailing: IconButton(
                              onPressed: () => {},
                              icon: const Icon(Icons.keyboard_arrow_right)),
                        );
                      },
                    ),
                  )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
