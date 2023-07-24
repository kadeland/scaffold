import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:scaffold/screens/profile.dart';

class HomeScreen extends StatelessWidget {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("hello"),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.wifi),
              color: Colors.black),
          IconButton(
              onPressed: () => click("Setting", context),
              icon: const Icon(Icons.wifi_1_bar)),
        ],
      ),
      drawer: myDrawer(context),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "add"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "add"),
        ],
        currentIndex: selectedIndex,
        onTap: (int index) => bottomClick(index, context),
        selectedIconTheme: const IconThemeData(color: Colors.white),
        selectedLabelStyle: const TextStyle(color: Colors.grey),
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => click("ADD", context),
        backgroundColor: Colors.green,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Profile(),
    );
  }

  void click(String data, BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.rightSlide,
      title: data,
      desc: 'Dialog description here.............',
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    ).show();
  }

  void bottomClick(int index, BuildContext context) {
    selectedIndex = index;
    if (index == 0) {
      click("Bottm setting index 0", context);
    } else {
      click("Bottm setting index 1", context);
    }
  }

  Widget myDrawer(BuildContext c) {
    return Container(
        width: MediaQuery.of(c).size.width * 0.75,
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.all(3),
            child: Column(
              children: [
                InkWell(
                  onTap: () => click("Inbox", c),
                  child: const ListTile(
                    title: Text("inbox"),
                    leading: Icon(Icons.inbox),
                  ),
                ),
                const ListTile(
                  title: Text("title"),
                  leading: Icon(Icons.inbox),
                ),
                Container(height: 1, color: Colors.grey)
              ],
            )));
  }
}
