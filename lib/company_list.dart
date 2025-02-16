import 'package:company_interest_tracker/main.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CompanyList extends StatelessWidget {
  const CompanyList({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    // When there are no companies we let the user know
    if (appState.noCompaniesAdded()){
      return Center(
        child : Text('No companies yet...'),
      );
    }

    // Creates a list of deletable components based on the company names in the ilst
    return ListView.builder(
      itemCount : appState.numberOfCompanies,
      itemBuilder: (context, index) {
        return Card(
            child : ListTile(
              title : Text(appState.getIthCompany(index)),
              trailing : Row(
                mainAxisSize : MainAxisSize.min,
                children: [
                  // An information button to see extra details about the company
                  // e.g. stock variations, personal notes and associated keywords  
                  IconButton(
                    icon : Icon(Icons.info, color : Colors.blue),
                    onPressed : () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            color: Colors.amber,
                            constraints: BoxConstraints(minHeight: 200, minWidth: 200),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const Text('Modal BottomSheet'),
                                  ElevatedButton(
                                    child: const Text('Close BottomSheet'),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  // A deletion button, allows the user to remove companies from the list
                  IconButton(
                    icon : Icon(Icons.remove_circle_sharp,color : Colors.red),
                    onPressed : () => appState.removeIthCompany(index),
                  ),
                ],
              ),
            ),
        );
      },
      controller : ScrollController(),
    );
  }
  
}