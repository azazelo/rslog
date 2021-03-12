# ***rslog*** [R(uby)S(tat)log] is a ruby gem to analyze webserver.log to find out page views metrics
#### Author: Andrey Eremeev
#### ruby-version: later than 2.6.0

## Usage:
  ```
  rslog path_to_file_with_log_data.[txt|log]
  ```

  Usage: rslog FILENAME.[log|txt]  
    -v, --version                    Show version and exit  
    -h, --help                       Prints this message and exit  


## Main Ideas of Design Application:

### 1. RSlog - main module - run the app

  Container to hold data  
  Worker - hold initialize for container and abstract execute method  
  Container passed to objects (subclasses of Worker class) to do work  
  InputParser -> Extractor -> Validator -> DataParser -> Presenter  

#### Container
  Hold all data and implement checks for self.data and output method

#### Worker
  Implement initialize for container and abstract execute method

####  InputHandler < Worker
  Parsing input options and args, creates object to hold options and args  
  Validating options and args if they compatible with rules  to pass to next step  

####  Extractor < Worker
  Extracts data from file  

####  Validator < Worker
  If Validator see errors -> it prints error message,  
  if error is fatal -> it exit from application  

####  DataParser < Worker
  Parses data in file, calculates counts

####  Presenter < Worker
  Format result and prepares it for output

####  RSlog 
  Runs Container.process_all and show output:  
    Report  
    Errors  
    Messages  

## Output:
  List of webpages with most page views ordered from most pages views to less page views  
    /home 90  
    /about 80  
 
  List list of webpages with most unique page views also ordered  
    /home 23  
    /about 20  


## Installation
### without bundler
```
gem install rslog
```
### with bundler
put "gem 'rslog'" to Gemfile
```
bundle install
```

## To test run
```
rspec
```

## To check syntax run
```
rubocop
```


# Future possible work:

- [ ] Make possible to output result to HTML, JSON, CSV formats
   See Presenter class for more ideas

- [ ] Make possible to analyse more metrics, for example what time most visited, 
   if webserver.log will include timestamp

- [ ] Separate functionality of DECORATORS from Presenter 

- [x] Separate functionality of OPTS from InputParser

- [ ] Accept --format option in command line to format output as table or plain text


