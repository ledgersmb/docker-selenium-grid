# docker-selenium-grid

Provides a selenium grid to run LedgerSMB tests against.

## Installation

```sh
wget https://github.com/ledgersmb/docker-selenium-grid/docker-compose.yml
```

## Usage

```sh
docker-compose up -d
```
This will run the grid as a daemon. Remove `-d` to run it in a terminal.

## Scaling

By default, the grid will run one copy of each browser but you can scale it easily after it is started. For example: 
```sh
docker-compose firefox=5 chrome=3 phantomjs=2
```

## Stopping the grid

Stoping the entire selenium grid is just as easy as starting them.
Since it only takes seconds to start, you can have a clean slate for all the Selenium tests.

```sh
docker-compose -f docker-compose.yml stop && docker-compose -f docker-compose.yml rm -f
```

## Testing

A small ruby script is provided to test the grid. Simply replace `grid-server` to point to your grid location and `ledgersmb-vm` to point to your LedgerSMB location and start the script will ```sh
ruby grid.rb
```. It will report access with Firefox, Chrome and PhantomJS.

## Notes

This grid is targetted and adapted for ledgerSMB, although it can be generalized easily. The prefered usage is to run it outside of the development machine.
The usage of google dns is intended as a place holder. Replace by yours so it can find your machines.
