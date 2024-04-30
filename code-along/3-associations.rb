# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Contact.destroy_all
# **************************

# - Insert and read contact data for companies in the database

# 1. insert new rows in the contacts table with relationship to a company
contact = Contact.new
contact["first_name"] = "Tim"
contact["last_name"] = "Cook"
contact["email"] = "a@apple.com"
apple = Company.find_by({"name"=>"Apple"})
contact["company_id"] = apple["id"]
contact.save

contact = Contact.new
contact["first_name"] = "Jim"
contact["last_name"] = "Nook"
contact["email"] = "b@apple.com"
apple = Company.find_by({"name"=>"Apple"})
contact["company_id"] = apple["id"]
contact.save

puts "There are #{Company.all.count} companies"
puts "There are #{Contact.all.count} contacts"
#we want to associate him with a company, so we use the company_id ... but how do we find that?
# company_id = Company.find_by({"name"=>"Apple"})
# p apple
#now we see the number 53 in the hash, but if we don't know what it is then we can:
# contact["company_id"]=apple["id"] to access the info from another table

# 2. How many contacts work at Apple?
apple_employees = Contact.where({"company_id"=>apple["id"]})

puts "There are #{(apple_employees.count)} contacts at Apple"

# # 3. What is the full name of each contact who works at Apple?
for employee in apple_employees
    first_name = employee["first_name"]
    last_name = employee["last_name"]
    puts "#{first_name} #{last_name}"
end