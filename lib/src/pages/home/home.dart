import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/src/pages/task_groups/task_groups.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make Code To Do App'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.7,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/make_code_logo.png',
                height: 100,
              ),
              SvgPicture.asset(
                'assets/illustrations/undraw_To_do_re_jaef.svg',
                height: 150,
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TaskGroupsPage()),
                ),
                child: const Text(
                  'Start Manager My Tasks',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                ),
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(300, 50)),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0XFF0984E3)),
                    shape: MaterialStateProperty.all(const StadiumBorder())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
