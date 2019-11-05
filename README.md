# CMPUT-291-P1

Navras Kamal navras
Jacob Rechard reckhard
Radomir Wasowski wasowski

Our 291 project

To run, go `./test.sh reload` or `./test.sh`
Reload recreates the database, or creates one if its not there

## TODO
- [ ] **Create Test data** This is super important
- [x] Implement Login screen
- [x] Implement Option menu screen
- [x] Implement Option: Register a birth
- [x] Implement Option: Register a marriage
- [x] Implement Option: Renew a vehicle registration
- [x] Implement Option: Process a bill of sale
- [x] Implement Option: Process a payment
- [x] Implement Option: Get a driver abstract
- [x] Implement Option: Issue a ticket
- [x] Implement Option: Find a car owner
- [x] Make password not visible while typing
- [x] Make sure SQL injection cant happen
- [ ] Design Document in PDF


Option menu screen:
Should display 6 options for regular people who signin, 8 for traffic officers

## Notes
- String matching. Except the password which is case-sensitive, all other string matches (include user id, name, etc.) are case-insensitive. This means edmonton will match Edmonton, EDMONTON, edmontoN and edmonton, and you cannot make any assumption on the case of the strings in the database. The database can have strings in uppercase, lowercase or any mixed format.
- Must take db file as a CLI option
