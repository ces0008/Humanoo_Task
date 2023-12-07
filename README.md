### What is this repo for?
This repository is the base for case Study at Humanoo, for Analytics Engineer position.
The purpose of it is to test the knowledge of: Python, SQL, dbt

### Setup / Stack

Please use **only** these "tools":
- **Python** 3.9 or higher.
- **dbt-core** 1.5.x or higher
- **duckdb** 0.9.x

During this Case Study you would need DuckDB as your DB Engine.
You could install only this package: "dbt-duckdb"
, which will install: dbt-code, duckdb

You can test if you installed DuckDB properly using "duckdb_test.py"


### Tasks
1. Use files inside "source_files" directory as foundation or source for your dbt models, with this data model
   - **users**:
     - user_id - Unique Identifier of a User
     - user_name - Nickname of a User
     - company_id - Unique Identifier of a Company
     - company_name - Company Name
     - company_size - Number of employees
   - **steps_data**:
     - **activity_date** - Date of activity (i.e. when the steps were tracked)
     - **user_id** - Unique Identifier of a User
     - **steps** - How many steps were tracked
2. Design your dbt models, so they could be a foundation for you to answer the question below
3. Write these Queries **with SQL** and **show** the result (either with Pandas or any other plotting package):
    - Show the daily average number of steps for all the users, accross all days
            An example of the expected outcome: 10.000 (i.e. just a single number)
    - Show per "Company Name" amount of users and calculate % of how many users have steps data
    - Show the top 10 and bottom 10 users with the most (and least) steps collect in any day
            Output shoudl be for both top & bottom: "User Name" and "Number of Steps"

### How to share the result?
1. Clone (don't fork) this repository
2. Do the necessary changes
3. Don't forget to commit/push them
4. Share your cloned repo URL
5. P.S. it's ok to commit/push after you submitted your work, better later then never
