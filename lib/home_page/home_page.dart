import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var titleController = TextEditingController();

  var descriptionComtroller = TextEditingController();


  var formKey = GlobalKey<FormState>();

  List<String> listTitle = [];
  List<String> listDes = [];
bool iconBool =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu_open_rounded),
        title: const Text('HTI Todo'),
        centerTitle: false,

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (formKey.currentState!.validate()) {
              listTitle.add(titleController.text);
              listDes.add(descriptionComtroller.text);

              // return null;
            }
          });
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Form(
            key: formKey,
            child: Column(children: [
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
                    borderRadius: BorderRadius.all(Radius.circular(16)),
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
                     borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  labelText: 'Note Description',
                ),
              ),
            ]),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listTitle.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(44, 33, 149, 243).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color.fromARGB(98, 0, 0, 0))
                        ),
                    child: ListTile(
                      title: Text(
                        listTitle[index],
                        style: const TextStyle(fontSize: 24),
                      ),
                      subtitle: Text(
                        listDes[index],
                        style: const TextStyle(fontSize: 20),
                      ),
                      leading: const Icon(
                        Icons.note_alt_outlined,
                        size: 40,
                      ),
                      trailing: SizedBox(
                        width: 70,
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
                                  Icons.delete,color: Colors.red,size: 30,
                                ),
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => SimpleDialog(
                                       
                                       contentPadding:const EdgeInsets.all(18),
                                            children: [
                                             const Text('update title: ',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                               const  SizedBox(height: 3,),
                                              TextField(
                                                controller:
                                                    titleController,
                                                    decoration:const InputDecoration(
                                                      
                                                      border: OutlineInputBorder()
                                                    ),
                                              ),
                                            const  SizedBox(height: 3,),
                                            const Text('update Des: ',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                              const  SizedBox(height: 3,),
                                                TextField(
                                                controller:
                                                    descriptionComtroller,
                                                      decoration:const InputDecoration(
                                                      border: OutlineInputBorder()
                                                    ),
                                              ),
                                            const  SizedBox(height: 15,),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)) ),
                                                  onPressed: () {
                                                    setState(() {
                                                      listTitle[index] = titleController.text;
                                                      listDes[index] = descriptionComtroller.text;
                              
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                  child:const Text('Update')),
                                            ],
                                          ));
                                },
                                icon: const Icon(
                                  Icons.edit_note,color: Colors.white,size: 30,
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
