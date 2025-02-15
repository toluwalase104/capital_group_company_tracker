# Development Process #
(1) Specification

(2) Design

(3) Implementation and Unit Testing

(4) Integration and System Testing

(5) Handover / Deployment / ~~Maintenance~~

## Specification ##
### Must ###
* Allow users to keep track of companies they are interested in
* Allow users to add or remove companies    
### Should ###
* Include some form of persistence so that a user can keep track of their interests over time
    * Would likely have a login system + database to ensure this
* A means of categorising companies
### Could ###
* Use an API to show recent news related to the company
* Could use an API to keep track of job vacancies at the company

## Testing ##
* Handle duplicate entries appropriately, using something like a (Hash)Set data structure
* Ensure correct behaviour when attempting to remove from an empty list
* 