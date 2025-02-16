/* Class containing the information we store about companies */ 

class CompanyData {
  String _companyName = "";
  get name => _companyName;
  set setName(name) => _companyName = name;

  String _companyDetails = "";
  get details => _companyDetails;
  set setDetails(details) => _companyDetails = details;

  CompanyData(String companyName, {String companyDetails = ""}){
    _companyName = companyName;
    _companyDetails = companyDetails;
  }
}