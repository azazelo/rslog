# rslog is ruby gem to analyze webserver.log to find out page views metrics
## Author: Andrey Eremeev
## ruby-version: 2.6.2



## Usage:
  rslog path_to_file_with_log_data

  Usage: rslog FILENAME
    -v, --version                    Show version and exit
    -h, --help                       Prints this message and exit


## Main Ideas of Design Application:

### 1. RSlog - main module - run the app

  Container to hold data
  Container passed to modules to do work
  InputParser -> Extractor -> Validator -> DataParser -> Presenter

####  InputHandler 
    Parsing input options and args, creates object to hold options and args
    Validating options and args if they compatible with rules
    to pass to next step

####  Extractor
    Extracts data from file

####  Validator
    If Validator see errors -> it prints error message, 
    if error is fatal -> it exit from application 

####  DataParser
    Parses data in file, calculates counts

####  Presenter
    Format output and prepares it for output

####  RSlog 
  Runs Container.process_all and show output:
    Report
    Errors
    Messages


## To run app you need to type in commnd line:
> rslog webserver.log


## Output:
  List of webpages with most page views ordered from most pages views to less page views
  List list of webpages with most unique page views also ordered


## Installation
### without bundler
> gem install rslog
### with bundler
put 'gem rslog' to Gemfile
> bundle install

## To test run
> rspec

## To check syntax run
> rubocop


# Future possible work:

1. Make possible to output result to HTML, JSON, CSV formats
   See Presenter class for more ideas

2. Make possible to analyse more metrics, for example what time most visited, 
   if webserver.log will include timestamp

3. Separate functionality of DECORATORS from Presenter 

4. Separate functionality of OPTS from InputParser 


