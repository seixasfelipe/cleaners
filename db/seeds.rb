# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
countries = Country.create([{name: 'Canada', abbreviation:'CAN'},
                            {name: 'Brazil', abbreviation: 'BRA'},
                            {name: 'United States', abbreviation: 'USA'}])
