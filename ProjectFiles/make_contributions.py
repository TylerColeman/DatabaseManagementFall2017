import random

#Package for randomly creating fake data
# pip install Faker
from faker import Faker
fake = Faker()

#########################################################################
#These are hardcoded. copied from a select statement in phpMyAdmin      #
fund_names = ["Comfort Dog", "No Longer Active", "Scholarship",         
              "Youth Camp Fees", "Youth Fundraisers", "Youth, Other",
              "Building", "Bulletins", "Facility Use", "General", "Missions",
              "Music", "Sunday School"]                                 #
                                                                        #
c_types = ["ach", "coin", "check", "currency"]                          #
                                                                        #
env_num_limit = 50 #Highest envelope number in database                 #
                                                                        #
#End of hard coding                                                     #
#########################################################################

with open("make_contributions.sql", "w+") as file:
    for i in range(50):
        amt = random.randint(0, 30000) / 100
        if i % 15 == 0: #add random decimal sometimes
            amt += random.randint(0,100)/ 100
        c_date = "'{}-{}-{}'".format(2017, random.randint(1, 11), random.randint(1,29))
        note = "'{}'".format(fake.sentence())
        c_type = "'{}'".format(c_types[random.randint(0,len(c_types)-1)])
        fund_name = "'{}'".format(fund_names[random.randint(0,len(fund_names)-1)])
        env_num = random.randint(0,env_num_limit)
        if i % 15 == 0:
            file.write("INSERT INTO contribution(amt, c_date, note, c_type, fund_name, env_num)")
            file.write(" VALUES({}, {}, {}, {}, {}, {});\n\n".format( amt, c_date, note, c_type, fund_name, env_num))
        else:
            file.write("INSERT INTO contribution(amt, c_date, c_type, fund_name, env_num)")
            file.write(" VALUES({}, {}, {}, {}, {});\n\n".format( amt, c_date, c_type, fund_name, env_num))
