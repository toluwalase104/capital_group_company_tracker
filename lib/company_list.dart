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

    // Otherwise we iterate through the list of companies
    // and display each of them as list widgets using map
    // return ListView(
    //   children : 
    //     appState.companies
    //       .map(
    //         (company) => ListTile(
    //           title : Text(company),
    //         )
    //       )
    //       .toList()
    // );

    // Creates a list of deletable components based on the company names in the ilst
    return ListView.builder(
      itemCount : appState.numberOfCompanies,
      itemBuilder: (context, index) {
        return Card(
            child : ListTile(
              title : Text(appState.getIthCompany(index)),
              trailing : IconButton(
                icon : Icon(Icons.delete, color : Colors.red),
                onPressed : () => appState.removeIthCompany(index),
              ),
            ),
        );
      }
    );
  }
  
}