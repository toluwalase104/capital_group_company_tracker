import 'package:company_interest_tracker/company_data.dart';
import 'package:company_interest_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// A widget that allows the data stored about a company to be viewed and editted accordingly
class CompanyWidget extends StatefulWidget {
  final CompanyData companyData;

  const CompanyWidget({
    super.key,
    required this.companyData
  });

  @override
  State<CompanyWidget> createState() => _CompanyWidgetState();
}

// The company widget object acts as a form with mutable data that 
// can also be pulled from the user's previous responses.
class _CompanyWidgetState extends State<CompanyWidget> {
  // Defines text input for company name
  final TextEditingController nameController = TextEditingController();

  // Defines text input for company name
  final TextEditingController tickerSymbolController = TextEditingController();

  // Defines text input for additional details about the company
  final TextEditingController detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int index = widget.companyData.index;

    var appState = context.watch<MyAppState>();

    nameController.text = widget.companyData.name;

    tickerSymbolController.text = widget.companyData.tickerSymbol;

    detailsController.text = widget.companyData.details;

    return Container(
      constraints: BoxConstraints(minHeight: 200, minWidth: 200),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
    
            // Allows the user to change the company name
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize : MainAxisSize.min,
                children: [
                  const Text('Company Name: '),
                  SizedBox(
                    width : 200,
                    child: TextFormField(
                      validator : (name) {
                        if ( name == null || name.isEmpty ){
                          return 'Please enter some the company\'s name';
                        }
                        return null;
                      },
                        
                      controller : nameController,
                    ),
                  ),
                ],
              ),
            ),

            // Allows the user to change the ticker symbol associated with the company
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize : MainAxisSize.min,
                children: [
                  const Text('Ticker Symbol (Stock Code): '),
                  SizedBox(
                    width : 200,
                    child: TextFormField(
                      validator : (name) {
                        if ( name == null || name.isEmpty ){
                          return 'Please enter a ticker symbol';
                        }
                        return null;
                      },
                        
                      controller : tickerSymbolController,
                    ),
                  ),
                ],
              ),
            ),

            // Allows the user to make additional notes about the company
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize : MainAxisSize.min,
                children: [
                  const Text('Notes: '),
                  SizedBox(
                    width : 200,
                    child: TextFormField(
                      minLines : 5,
                      maxLines: null,
                      keyboardType : TextInputType.multiline,
                      validator : (notes) {
                        if ( notes == null || notes.isEmpty ){
                          return 'Please enter some text';
                        }
                        return null;
                      },
                        
                      controller : detailsController,
                      // Makes the textform field a box instead of a line
                      decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    border: OutlineInputBorder(),
                                    labelText: 'Enter text',
                                  ),
                    ),
                  ),
                ],
              ),
            ),

            // Allows the extra information widget to be closed
            ElevatedButton(
              child: const Text('Exit'),
              onPressed: () {
                appState.updateIthCompany(
                  index,
                  nameController.text,
                  tickerSymbol : tickerSymbolController.text,
                  companyDetails : detailsController.text
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}