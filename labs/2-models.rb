# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Salesperson.destroy_all
# **************************

# Lab 2: Models
# - We've added data into the companies table.  Next, we'll add data
#   into the salespeople table.  Follow the steps below to insert and
#   read rows of salesperson data.  Update a row.  Afterwards, display
#   how many rows have been inserted into the salespeople table.
#   Lastly, if you want a challenge, try writing code to display the
#   full name of each salesperson.

# 1a. check out the schema file
# 1b. check out the model file

# 2. insert 1-2 rows in salespeople table.
salesperson_one = Salesperson.new
salesperson_one["first_name"]="Jane"
salesperson_one["last_name"]="Doe"
salesperson_one["email"]="jd@gmail.com"
salesperson_one.save

salesperson_two = Salesperson.new
salesperson_two["first_name"]="Cat"
salesperson_two["last_name"]="Barns"
salesperson_two["email"]="cb@gmail.com"
salesperson_two.save

# 3. write code to display how many salespeople rows are in the database
total_sales_force = Salesperson.all.count
puts "There are #{total_sales_force} salespeople"
# ---------------------------------
# Salespeople: 2

# 4. modify/update column data for a row in the salespeople table.
salesperson_one=Salesperson.find_by({"first_name"=>"Jane", "last_name"=>"Doe"})
#tough with nonunique names? this will find the first one extant -- be sure when we do findby that there's only one
#ideally we'd look it up by the id, since we know it is unique - but you can do what we did above with an AND via ,
salesperson_one["email"] = "janedoe@yahoo.com"
salesperson_one.save

# CHALLENGE:
# 5. write code to display each salesperson's full name
# first_name =salesperson_one["first_name"]
# last_name = salesperson_one["last_name"]
# puts "#{first_name} #{last_name}"
#we don't know how many rows there are, so this method is not very smart, so we need LOOPS! 
#If we see arrays, we always want to loop
# for something in dataset
# end
salespeople = Salesperson.all
for person in salespeople
    first_name = person["first_name"]
    last_name = person["last_name"]
    puts "#{first_name} #{last_name}"    
end



# ---------------------------------
# Salespeople: 2
# Ben Block
# Brian Eng
