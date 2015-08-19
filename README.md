# CDR

## What?

Small app to parse Cisco Call Detail Records (CDR) csv files, and display meaningful data in table format.


## Why?

Because paying big bucks for some CDR analysis and visualization software which you probably don't actually need sucks.


## Usage

app {dir_path}

This read each cdr file and display it in console.


## future?

First version is just a proof of concept, for small batches (1 or 2 files).
Moving forward, it will make more sense to just transform and consolidated the data from all cdr files into one, more usable csv file.
Later, make this a GEM. for use in rails or standalone ruby apps.



## MISC

In an example scenario, one would have the cisco device save cdr files to an ftp server.
In future (Gem) version, your rails application could have background jobs running, and consuming the latest cdr data into an ActiveRecord model provided by the Gem. Then of course you could make your own beautiful dashboard, or CDR processing/visualization app.



## Contributions

Contributions are welcomed with open arms.

For contact, catch me on twitter @i5okie, or IRC @ivanskie  (#ruby, #rubyonrails)
