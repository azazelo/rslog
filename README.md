# rslog is ruby gem to analyze webserver.log to find out page views metrics
# Author: Andrey Eremeev
# ruby-version: 2.6.2

TODO:

Stories:
1. As a user I want to input in command line 'rslog good.log' 
  and get output 
    Visits:
       /index 2 visits
       /home 1 visit
       /about 1 visit
    List of webpages with most unique page views also ordered
       /index 1 unique vies
       /home 1 unique views
       /about 1 unique views'
2. As a user I want to input in command line 'rslog --version' 
  and get output 
    0.0.1
3. As a user I want to input in command line 'rslog --help' 
  and get output 
    Help message
4. As a user I want to input in command line 'rslog' 
  and get output 
    Help message
5. As a user I want to input in command line 'rslog empty.log' 
  and get output 
    Error: Empty file!
6. As a user I want to input in command line 'rslog non_text.log' 
  and get output 
    Error: Not a text file!
7. As a user I want to input in command line 'rslog not_valid.log' 
  and get output same as for (1) and error message
    Error: Some IPs are NOT valid!


Main Ideas of Design Application:

1. RSlog - main module - run the app

  InputParser -> Extractor -> Validator -> DataParser -> Presenter

  InputHandler 
    Parsing input options and args, creates object to hold options and args
    to pass to next step

  Validator
    Validating options and args if they compatible with rules
    If Validator see errors -> it prints error message, 
    if error is fatal -> it exit from application 

  Analyser
    Count visits and unique views

  Presenter
    Show the result




To run app you need to type in commnd line:
> cd app_folder
> ./lib/parser webserver.log

   - parser - ruby script which will parse given textfile
   - webserver.log - given textfile:
        for example it could look like this
        /home 111.222.222.222
        /about 111.222.222.222
        /about/2 111.222.222.222

# Output:
  List of webpages with most page views ordered from most pages views to less page views
  List list of webpages with most unique page views also ordered


# Installation
> bundle install

# To test run
> rspec

# To check syntax run
> rubocop


# Future possible work:

1. Make possible to output result to HTML, JSON, CSV formats
   See Presenter class for more ideas

2. Make possible to analyse more metrics, for example what time most visited, 
   if webserver.log will include timestamp
 


