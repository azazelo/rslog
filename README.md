# ***rslog*** [r(uby)s(tat)log] is a ruby gem to analyze webserver.log to find out page views metrics
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

###Validator  
    validate IPs  
   
###Parser -  
    - extract  
    - group  
    - calculate  
    - order    
####Presenter  
    output result as table,  
    borders could be strings (|, -, +) or utf ancoded pseudo graphics  
   
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

- [ ] Accept --format option in command line to format output as table or plain text

- [ ] Accept --metrics option in command line to count specific statistics  
      for example:  
      --metrics unique, all, avg - defaults  
      --metrics unique - count  and show only uniq visiters by url  
