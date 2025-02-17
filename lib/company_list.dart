import 'package:company_interest_tracker/company_widget.dart';
import 'package:company_interest_tracker/main.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

/* Class defining the widget that allows companies that we are interested in to
   be listed on the homepage. */
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
        String companyName = appState.getIthCompanyName(index);

        return Card(
            child : ListTile(
              title : Text(companyName),
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
                          // We use exclamation mark as we know the company name must exist during operation
                          return CompanyWidget( companyData : appState.getCompanyData(companyName)! );
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