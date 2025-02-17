/* Class containing the information we store about companies */ 

class CompanyData {
  // Allows for quick access to its position in the list of 
  // companies (i.e. relative order of insertion)
  int _index = -1;
  get index => _index;

  String _companyName = "";
  get name => _companyName;
  set setName(String name) => 
    _companyName = name;

  String _tickerSymbol = "";
  get tickerSymbol => _tickerSymbol;
  set setTickerSymbol(String tickerSymbol) =>
     _tickerSymbol = tickerSymbol;
  
  String _companyDetails = "";
  get details => _companyDetails;
  set setDetails(String details) =>
    _companyDetails = details;

  CompanyData(int index, String companyName, {String tickerSymbol = "", String companyDetails = ""}){
    _index = index;
    _companyName = companyName;
    _tickerSymbol = tickerSymbol;
    _companyDetails = companyDetails;
  }
}