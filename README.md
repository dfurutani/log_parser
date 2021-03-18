# Log parser

## Description

This script must receive an argument with the log filename (path) and display the list of pages that were visited and the visit count, and also display the same information but to unique visitors.

## Instalation

  `$ bundle install`

## How to run the script

  `./parser.rb webserver.log` 
  
## Next steps

The file `webserver.log` has a specific format, and the script will fail if you try with another format. A format validator will be a good thing to do next, such as the acceptance of multiple formats.

Other thing that is imperative here, is the memory usage control. If the file is too big, probably will lag. A good solution is to split the file handle with the system, not only use ruby for that... or split the files in batches.
