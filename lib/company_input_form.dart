import 'package:company_interest_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Defines the form widget
class CompanyInputForm extends StatefulWidget {
  const CompanyInputForm({super.key});

  @override
  State<CompanyInputForm> createState() => _CompanyInputFormState();
}

// Holds the data related to the form
class _CompanyInputFormState extends State<CompanyInputForm> {
  // This is a unique identifier of the form allowing it to be validated
  final _formKey = GlobalKey<FormState>();

  // Allows the text data in the form to be retrieved 
  final formController = TextEditingController();

  @override
  void dispose(){
    // Free resources used by controller once finished
    formController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    var appState = context.watch<MyAppState>();

    return Form(
      key : _formKey,
      child : Column(
        children : <Widget>[
          // Allows the user to enter text
          TextFormField(
            // Here ``value`` is the text that is enterred into the form
            validator : (value) {
              if ( value == null || value.isEmpty ){
                return 'Please enter some text';
              }
              return null;
            },

            controller : formController,
          ),

          ElevatedButton(
            onPressed: () {
              // For the form corresponding to _formKey, the ``validate()`` method
              // returns True if the text within it is valid and False otherwise

              // If it is invalid then we cease further processing
              if (!_formKey.currentState!.validate()){
                return;
              }

              // Otherwise if valid then add the given company to the list
              appState.addCompany(formController.text);

              // Clear the text in the form after it has been submitted
              formController.clear();
            },
            child : const Text('Submit'),
          ),
          
        ],
      ),
    );
  }
}
