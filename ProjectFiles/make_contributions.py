import random

#Package for randomly creating fake data
# pip install Faker
from faker import Faker
fake = Faker()

fund_names = ["Comfort Dog", "No Longer Active", "Scholarship",
              "Youth Camp Fees", "Youth Fundraisers", "Youth, Other"]

c_types = ["ach", "coin", "check", "currency"]

env_num_limit = 50

with open("make_contributions.sql", "w+") as file:
    for i in range(50):
        amt = random.randint(500, 99999999) / 100
        c_date = "'{}-{}-{}'".format(random.randint(2000, 2017), random.randint(1, 12), random.randint(1,29))
        note = "'{}'".format(fake.sentence())
        c_type = "'{}'".format(c_types[random.randint(0,3)]) #HARDCODED
        fund_name = "'{}'".format(fund_names[random.randint(0,5)]) #HARDCODED
        env_num = random.randint(0,50)

        file.write("INSERT INTO contribution(amt, c_date, note, c_type, fund_name, env_num)")
        file.write(" VALUES({}, {}, {}, {}, {}, {});\n\n".format( amt, c_date, note, c_type, fund_name, env_num))