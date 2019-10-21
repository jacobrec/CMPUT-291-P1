# CMPUT-291-P1

Our 291 project

To run, go `./test.sh reload` or `./test.sh`
Reload recreates the database, or creates one if its not there

## TODO
- [ ] **Create Test data** This is super important
- [x] Implement Login screen
- [x] Implement Option menu screen
- [ ] Implement Option: Register a birth
- [ ] Implement Option: Register a marriage
- [ ] Implement Option: Renew a vehicle registration
- [ ] Implement Option: Process a bill of sale
- [ ] Implement Option: Process a payment
- [ ] Implement Option: Get a driver abstract
- [ ] Implement Option: Issue a ticket
- [ ] Implement Option: Find a car owner
- [x] Make password not visible while typing
- [ ] Make sure SQL injection cant happen


Option menu screen:
Should display 6 options for regular people who signin, 8 for traffic officers

## Notes
- String matching. Except the password which is case-sensitive, all other string matches (include user id, name, etc.) are case-insensitive. This means edmonton will match Edmonton, EDMONTON, edmontoN and edmonton, and you cannot make any assumption on the case of the strings in the database. The database can have strings in uppercase, lowercase or any mixed format.
- Must take db file as a CLI option
