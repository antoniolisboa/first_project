import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => FormScreenState();
}

class FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text(
          'New Task',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 375,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 1,
                  color: Colors.black38,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 3,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return 'No name defined for the task.';
                          }
                          return null;
                        },
                        controller: nameController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: 'Task Name',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.greenAccent,
                              width: 2.5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.greenAccent,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        cursorColor: Colors.greenAccent,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        validator: (String? value) {
                          print(value);
                          if (value != null && value.isEmpty) {
                            return 'No difficulty defined for the task.';
                          } else {
                            try {
                              if (int.parse(value!) < 0 ||
                                  int.parse(value) > 5) {
                                return 'Value is not in the range of 0 to 5.';
                              }
                            } catch (e) {
                              return 'No difficulty defined for the task.';
                            }
                          }

                          return null;
                        },
                        controller: difficultController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: 'Difficulty',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.greenAccent,
                              width: 2.5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.greenAccent,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        cursorColor: Colors.greenAccent,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return 'No image link defined for the task.';
                          }
                          return null;
                        },
                        controller: imageController,
                        keyboardType: TextInputType.url,
                        textAlign: TextAlign.center,
                        onChanged: (text) {
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                          hintText: 'Image Url',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.greenAccent,
                              width: 2.5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.greenAccent,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        cursorColor: Colors.greenAccent,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 100,
                        width: 75,
                        decoration: BoxDecoration(
                          //color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            width: 2,
                            color: Colors.greenAccent,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            imageController.text,
                            fit: BoxFit.cover,
                            errorBuilder: (
                              BuildContext context,
                              Object exception,
                              StackTrace? stackTrace,
                            ) {
                              return const Icon(
                                Icons.no_photography_outlined,
                                size: 36,
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print(nameController.text);
                            print(difficultController.text);
                            print(imageController.text);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent,
                        ),
                        child: const Text(
                          'Add',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
