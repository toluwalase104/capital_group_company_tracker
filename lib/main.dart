import 'dart:collection';

import 'package:company_interest_tracker/company_data.dart';
import 'package:company_interest_tracker/finance_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'company_input_form.dart';
import 'company_list.dart';

// import 'company_input_form.dart';

void main() {
  runApp(const MyApp());
}

/* MAIN APP */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const appTitle = "Company Interest Tracker";
    
    return ChangeNotifierProvider(
      create : (context) => MyAppState(),
      child: MaterialApp(
          title: appTitle,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
            useMaterial3: true,
          ),
      
          // Defines the structure of the app
          home: const HomePage(title: appTitle,),
        ),
    );
  }
}

/* Stores the data related to the state of the app, e.g. the list of companies and data stored about them*/
class MyAppState extends ChangeNotifier {
  List<String> _companyNames = [];

  HashMap<String, CompanyData> _companyMap = HashMap<String, CompanyData>();

  int _numberOfCompanies = 0;
  get numberOfCompanies => _numberOfCompanies;

  // Add a company to the company set and
  // update anything watching this notifier
  void addCompany(String companyName){
    companyName = companyName;

    // Do not allow duplicate entries
    if (_companyMap.containsKey(companyName)){
      return;
    }

    _companyNames.add(companyName);
    _companyMap.putIfAbsent(companyName, () => CompanyData(_numberOfCompanies, companyName));

    ++_numberOfCompanies;

    notifyListeners();
  }

  // Remove a company from the company set and
  // update anything watching this notifier
  void removeCompany(String companyName){
    companyName = companyName;

    // Cannot remove non-existent items, so we cease further operations
    if (!_companyMap.containsKey(companyName)){
      return;
    }

    _companyNames.remove(companyName);
    _companyMap.remove(companyName);
    --_numberOfCompanies;

    notifyListeners();
  }

  void removeIthCompany(int i){
    if (i < 0 || i >= _numberOfCompanies){
      return;
    }

    String companyToBeRemoved = _companyNames[i];

    _companyMap.remove(companyToBeRemoved);
    _companyNames.removeAt(i);
    --_numberOfCompanies;

    notifyListeners();
  }

  String getIthCompanyName(int i){
    if (i < 0 || i >= _numberOfCompanies){
      return "";
    }

    return _companyNames[i];
  }

  bool noCompaniesAdded(){
    return _companyNames.isEmpty;
  }

  CompanyData? getCompanyData(String companyName){
    companyName = companyName;

    return _companyMap[companyName];
  }

  void updateIthCompany(int index, String companyName, {String? tickerSymbol, String? companyDetails}){
    if (index < 0 || index >= numberOfCompanies){
      return;
    }
    companyName = companyName;

    String previousName = _companyNames[index];

    // We establish the new company's data potentially
    // uses existing data when company details have not been changed
    // or have been left undefined
    CompanyData newData = 
      CompanyData(
        index,
        companyName,
        tickerSymbol : tickerSymbol ?? _companyMap[previousName]!.tickerSymbol,
        companyDetails : companyDetails ?? _companyMap[previousName]!.details
      );

    // Update the relevant company using the existing company details if need be

    if (!_companyMap.containsKey(companyName)){
      // Ensure that a company is not included twice in the list of company names
      _companyNames[index] = companyName;
      _companyMap.putIfAbsent(
        companyName,
        () => newData
      );
    } else {
      _companyMap[companyName] = newData;

      // Remove the previous company being editted
      // This handles the case when we edit the name of a 
      // company to that of an existing company
      if (companyName != previousName){
        removeIthCompany(index);
      }
    }

    // Only remove the prior entry if it is not equal to the current 
    if (companyName != previousName){
      _companyMap.remove(previousName);
    }

    notifyListeners();
    debugPrint("$_companyNames");
    debugPrint("$_companyMap");
    debugPrint("$_numberOfCompanies");
  }

}

class HomePage extends StatelessWidget {
  final String _appTitle;

  const HomePage({super.key, required String title})
    :_appTitle = title;

  @override
  Widget build(BuildContext context){
    return Scaffold(
            appBar : AppBar(title: Text(_appTitle)),
            body : Column(
              children: [
                const CompanyInputForm(),
                const Expanded(
                  child: CompanyList()
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: FloatingActionButton.large(
                    child: Icon(Icons.search),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context){
                          return Container(
                            constraints : BoxConstraints(minHeight: 200, minWidth: 200),
                            child : const Center(child: DTOSearch()),
                          );
                        }
                      );
                    }
                  ),
                )
              ],
            ),
          );
  }
}

/* END OF MAIN APP */