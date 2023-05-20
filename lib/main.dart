import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  String name = "";

  String amount = "";
  List<String> nameList = [];
  List<String> amountList = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Expense Tracker'),
            actions: const [
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: null,
                // onPressed: () => _addnew(context),
              )
            ],
          ),
          body: ListView.builder(
            itemCount: nameList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                child: SingleChildScrollView(
                  child: Column(children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  color:
                                      const Color.fromRGBO(212, 22, 22, 0.769),
                                  width: 2,
                                )),
                                padding: const EdgeInsets.all(10),
                                child: Text(amountList[index])),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  nameList[index],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  DateFormat('yMMMd').format(DateTime.now()),
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              );
            },
          ),
          floatingActionButton: Builder(
            builder: (context) => FloatingActionButton(
              onPressed: () => _addnew(context),
              child: const Icon(Icons.add),
            ),
          ),
        ));
  }

  // void onPrint() {
  _addnew(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (bCtx) {
        return GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              TextField(
                onChanged: (value) {
                  // Add the user input to the list whenever it changes
                  setState(() {
                    name = value;
                  });
                },
                controller: titleController,
                decoration: const InputDecoration(label: Text("Title")),
              ),
              TextField(
                onChanged: (value) {
                  // Add the user input to the list whenever it changes
                  setState(() {
                    amount = value;
                  });
                },
                controller: amountController,
                decoration: const InputDecoration(label: Text("Amount")),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(80, 20, 40, 20),
                child: Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            nameList.add(name);
                            name = '';
                            amountList.add(amount);
                            amount = '';
                            Navigator.pop(context);
                          });
                        },
                        child: const Text("Submit")),
                    const SizedBox(
                      width: 40,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel"))
                  ],
                ),
              )
            ]),
          ),
        );
      },
    );
  }
}
