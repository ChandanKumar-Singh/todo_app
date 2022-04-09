import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_app/widgets/EditNotesWidget.dart';

import '../../../widgets/HomeNotesWidget.dart';

class PersonalNotesList extends StatelessWidget {
  const PersonalNotesList({Key? key}) : super(key: key);

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
                itemCount: 13,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      // onTap: () => Get.to(PersonalNotesList
                      // ()),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xA8A664E0),
                            gradient: LinearGradient(
                                colors: [Colors.orange, Colors.indigo]),
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
                                      'Chandan Kumar Singh',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                    Text(
                                      'Chandan Kumar SinghChandan Kumar SinghChandan Kumar SinghChandan Kumar Singh',
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.white),
                                    ),
                                    Text(
                                      'Added On: Mon 21/03/2022',
                                      style: TextStyle(
                                          fontSize: 11, color: Colors.white),
                                    ),
                                    Text(
                                      'Last Upadate: Mon 21/03/2022',
                                      style: TextStyle(
                                          fontSize: 11, color: Colors.white),
                                    )
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
    );
  }
}
