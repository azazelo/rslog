# frozen_string_literal: true

# 1. As a user I want to input in command line 'rslog good.log' and get output#{' '}
#    Visits:
#       /index 2 visits
#       /home 1 visit
#       /about 1 visit
#    List of webpages with most unique page views also ordered
#       /index 1 unique vies
#       /home 1 unique views
#       /about 1 unique views'
# 2. As a user I want to input in command line 'rslog -v' and get output
#    Version 0.0.1
# 3. As a user I want to input in command line 'rslog --help' and get output
#  Usage: rslog FILENAME
#    -v, Show version and exit
#    -h, Prints this message and exit
# 5. As a user I want to input in command line 'rslog empty.log' and get
#    Empty file!
# 6. As a user I want to input in command line 'rslog non_text.log' and get output#{' '}
#    (not yet)
#    Not a text file!
# 7. As a user I want to input in command line 'rslog not_valid.log'
#    and get output same as for (1) and error message
#    Some IPs are NOT valid!

require 'spec_helper'

describe RSlog do
  context 'when user want to see version of gem' do
    it 'print version' do
      expect { system %(./bin/rslog -v) }
        .to output(a_string_including('0.0.15'))
        .to_stdout_from_any_process
    end
  end
  context 'when user wants to see help information' do
    it 'print usage information' do
      expect { system %(./bin/rslog -h) }
        .to output(a_string_including('R(uby)S(imple)log'))
        .to_stdout_from_any_process
    end
  end
end

describe RSlog do
  context 'when ip in given file are not valid' do
    it 'prints message some IPs are NOT valid' do
      expect { system %(./bin/rslog ./spec/fixtures/files/bad.log) }
        .to output(a_string_including('Some IPs are NOT valid'))
        .to_stdout_from_any_process
    end
  end
  context 'when ip in given file are valid' do
    it 'prints stat for file' do
      expect { system %(./bin/rslog ./spec/fixtures/files/good.log) }
        .to output(a_string_including('All IPs are valid'))
        .to_stdout_from_any_process
    end
  end
end
