import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_app/widgets/EditNotesWidget.dart';

import '../../../widgets/HomeNotesWidget.dart';
import '../../firebaseBackend/functins.dart';

class NotesListPage extends GetView<FirebaseMethodsController> {
   NotesListPage({Key? key}) : super(key: key);
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blueGrey,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  splashColor: Colors.transparent,
                  child: Icon(
                    Icons.more_vert_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.belongersTasksList.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      // onTap: () => Get.to(NotesListPage()),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xA8A664E0),
                            borderRadius: BorderRadius.circular(w * 0.05)),
                        child: Row(
                          children: [
                            // CircleAvatar(
                            //   radius: 30,
                            //   backgroundColor: Colors.white54,
                            //   child: Icon(Icons.add_a_photo_rounded),
                            // ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.belongersTasksList[i].title!,
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                    Text(
                                      'Chandan Kumar SinghChandan Kumar SinghChandan Kumar SinghChandan Kumar Singh',
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.white),
                                    ),
                                    Text('Added On: Mon 21/03/2022',style: TextStyle(fontSize: 11,color: Colors.white),),
                                    Text('Last Upadate: Mon 21/03/2022',style: TextStyle(fontSize: 11,color: Colors.white),)
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white10,
                                  borderRadius:
                                      BorderRadius.circular(w * 0.05)),
                              child: Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Get.to(EditNoteWidget(
                                        h: h,
                                        w: w,
                                        onTap: () {},
                                      ));
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(AddNoteWidget(
            onTap: () {
              controller.addTasks(description: descriptionController.text, title: titleController.text);},
            w: w,
            h: h,
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
  Widget AddNoteWidget(
      {required double w, required double h, required VoidCallback onTap}) {
    return Container(
      height: h * 0.55,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(w * 0.05),
              topRight: Radius.circular(w * 0.05))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: w,
                decoration: BoxDecoration(
                    color: Colors.green,

                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(w * 0.05)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text('ADD A NOTE')),
                ),
              ),
              SizedBox(height: w * 0.02),
              TextFormField(
                autofocus: true,
                initialValue: titleController.text,
                onChanged: (val) {
                  titleController.text = val;
                },
                style: TextStyle(color: Colors.green),
                decoration: InputDecoration(
                    fillColor: Colors.tealAccent,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(w * 0.03),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2,
                        )),
                    hintStyle: TextStyle(color: Colors.green),
                    hintText: 'Your Name'),
              ),
              SizedBox(height: w * 0.02),
              // TextFormField(
              //   autofocus: true,
              //   initialValue: groupController.text,
              //   onChanged: (val) {
              //     groupController.text = val;
              //   },
              //   style: TextStyle(color: Colors.green),
              //   decoration: InputDecoration(
              //       hintStyle: TextStyle(color: Colors.green),
              //       hintText: 'Group ',
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(w * 0.03),
              //           borderSide: BorderSide(
              //             color: Colors.red,
              //             width: 2,
              //           ))),
              // ),
              // SizedBox(height: w * 0.02),
              // TextFormField(
              //   autofocus: true,
              //   initialValue: titleController.text,
              //   onChanged: (val) {
              //     titleController.text = val;
              //   },
              //   style: TextStyle(color: Colors.green),
              //   decoration: InputDecoration(
              //       hintStyle: TextStyle(color: Colors.green),
              //       hintText: 'Title',
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(w * 0.03),
              //           borderSide: BorderSide(
              //             color: Colors.red,
              //             width: 2,
              //           ))),
              // ),
              // SizedBox(height: w * 0.02),
              TextFormField(
                autofocus: true,
                maxLines: 10,
                initialValue: descriptionController.text,
                onChanged: (val) {
                  descriptionController.text = val;
                },
                style: TextStyle(color: Colors.green),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(w * 0.03),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2,
                        )),
                    hintStyle: TextStyle(color: Colors.green),
                    hintText: 'Description'),
              ),
              SizedBox(height: w * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: onTap,
                          child: Text('ADD NOTE'),
                        ),
                      )),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: () => Get.back(),
                          child: Text('CANCEL'),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
