import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_app/app/modules/NotesListPage/NotesListPage.dart';

import 'HomeNotesWidget.dart';

class BelongersList extends StatelessWidget {
  const BelongersList({
    Key? key,
    required this.w,
    required this.h,
  }) : super(key: key);

  final double w;
  final double h;

  @override
  Widget build(BuildContext context) {
    return
      Expanded(
      child: ListView.builder(
        itemCount: 13,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () =>Get.to(NotesListPage()),
              child: Container(
                decoration: BoxDecoration(
                  // color: Colors.white38,
                    gradient: LinearGradient(
                        colors: [Color(0x9586EC69),Color(0xCED2EC39)]
                    ),
                    borderRadius: BorderRadius.circular(w * 0.03)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white54,
                        child: Icon(Icons.add_a_photo_rounded),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Chandan Kumar Singh'),
                            Text('Mon 21/03/2022'),
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
                              Get.bottomSheet(NoteWidget( onTap: (){},enabled2:false,enabled3: false,enabled4: false, name: '',));
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
    );
  }
}