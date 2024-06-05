import 'package:flutter/material.dart';

import 'widget/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var titleController = TextEditingController();
  var descriptionComtroller = TextEditingController();
  var titleUpdate = TextEditingController();
  var describtionUpdate = TextEditingController();

  var formKey = GlobalKey<FormState>();

  List<String> listTitle = [];
  List<String> listDes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
           showDragHandle: true,

              context: context,
              builder: (context) => Padding(
                padding:  EdgeInsets.only(top: 20,left: 20,right: 20,bottom: MediaQuery.viewInsetsOf(context).bottom),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    TextFormField(
                      controller: titleController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'you must inter Note';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(16)),
                        ),
                        labelText: 'Note title',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: descriptionComtroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'you must inter Description';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(16)),
                        ),
                        labelText: 'Note Description',
                      ),
                    ),
                   const  SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(16))),
                          onPressed: () {
                            setState(() {
                              if (formKey.currentState!.validate()) {
                                listTitle.add(titleController.text);
                                listDes.add(descriptionComtroller.text);
                                titleController.text = '';
                                descriptionComtroller.text = '';
                                Navigator.pop(context);

                                // return null;
                              }
                            });
                          },
                          child: const Text('Add')),
                    ),
                    SizedBox(height: 30,),
                  ]),
                ),
              ));
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: listTitle.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(44, 33, 149, 243)
                            .withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color.fromARGB(98, 0, 0, 0))),
                    child: ListTile(
                      title: Text(
                        listTitle[index],
                        style: const TextStyle(fontSize: 24),
                      ),
                      subtitle: Text(
                        listDes[index],
                        style: const TextStyle(fontSize: 20),
                      ),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    listTitle.removeAt(index);
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: IconButton(
                                onPressed: () {
                                  titleUpdate.text = listTitle[index];
                                  describtionUpdate.text = listDes[index];

                                  showModalBottomSheet(
                                     isScrollControlled: true,
                                    showDragHandle: true,
                                    context: context,
                                    builder: (context) => Padding(
                                      padding:  EdgeInsets.only(top: 20,left: 20,right: 20,bottom: MediaQuery.viewInsetsOf(context).bottom),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text(
                                            'update title: ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          TextField(
                                            controller: titleUpdate,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(16))),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          const Text(
                                            'update Des: ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          TextField(
                                            controller: describtionUpdate,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(16))),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 40,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16))),
                                              onPressed: () {
                                                setState(() {
                                                  listTitle[index] =
                                                      titleUpdate.text;
                                                  listDes[index] =
                                                      describtionUpdate.text;
                                                });
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                'Update',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 30,)
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.edit_note,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    listTitle.add(listTitle[index]);
                                    listDes.add(listDes[index]);
                                  });
                                },
                                icon: const Icon(
                                  Icons.copy,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
