# Company Interest Tracker

A Flutter-based application that allows a user to maintain a list of companies that they are interested in.

The app can be accessed by visiting the site:
https://company-interest-tracker.web.app/

## Overview

The application is a single-page dashboard displaying a text input at the top of the screen for users to enter the names of companies that they are interested in. Care is taken to not allow exact duplicate entries by using an underlying HashMap data structure. However case sensitive duplicates (e.g. 'capital group' versus 'Capital Group') are allowed to occur as guarding against them by attempting to standardise input may have limited the user's freedom to use abbreviations and other company naming conventions. For example, with such strict standardisation of the input would require extra data to be stored otherwise a company named 'ABC' would be displayed on the screen as 'Abc'.

Underneath the text input widget, there is a list widget that contains all of the companies that a user is interested in. Each company widget in the list has a blue info icon which when pressed reveals more information about the company that the user has stored. Each company widget also has a red removal icon to allow any given company to also be removed from the list.

At the bottom of the application screen there is a search icon that (should) allow a user to search through the stock codes of their listed companies of interest and display recent trends in their stock variations.

## Extensions
One clear extension would be the integration of a working stock data API to allow a user to see the financial progress of their companies of interest.

A potential extensions that could be made to the app, include categorisation of companies and filtering to allow for a user to look at similar companies that they are interested in. For example, adding a "bleeding-edge" keyword to allow a user to see highlight their companies of interest that are also at the forefront of innovation.

Additionally, a login-system could prove beneficial in developing a product to be used in the long term, as users would be able to save their list and view it over time.

