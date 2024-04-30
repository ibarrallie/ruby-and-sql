# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Company.destroy_all
# **************************

# - Insert, read, update, and delete rows in companies table
#   (i.e. full CRUD of company data).

# 1a. check out the schema file
# # 1b. check out the model file
# puts "There are #{Company.all.count} companies"

# 2. insert new rows in companies table
new_company = Company.new
# p new_company
#if i stopped here (puts new_company), it would give me an odd memory allocation of where it lives in the computer, so you could do p instead!
#then this with the p makes basically a hash? key value pairs, rows of data that we can fill in with data
new_company["name"]="Apple"
new_company["city"]="Cupertino"
new_company["state"]="CA"
new_company["url"]="http://apple.com"
# p new_company
#now it's been populated but it isn't in the database, it doesn't have an ID yet, so let's go forward from here
new_company.save
# p new_company
# puts "there is #{Company.all.count} company"

company = Company.new
company["name"] = "Amazon"
company["city"] = "Seattle"
company["state"] = "WA"
company.save

company = Company.new
company["name"] = "Twitter"
company["city"] = "San Fran"
company["state"] = "CA"
company.save

puts "there are #{Company.all.count} companies"

all_companies=Company.all
# p all_companies
#basically makes an array (an array of hashes?)

# 3. query companies table to find all row with California company
cali_companies = Company.where({"state"=>"CA"})
p cali_companies

puts "California companies: #{cali_companies.count}"

# 4. query companies table to find single row for Apple
apple = Company.find_by({"name"=>"Apple"})
p apple
#this will just get rid of some of the noise, instead of doing a more complicated .where method 
#this will get us the single row -- but if there may be multiple names, then you're going to be SOL since it'll just do one

# 5. read a row's column value -- column is going to be a hash, so we read it the way we always do
p apple["name"]
p apple["url"]

# 6. update a row's column value
twitter = Company.find_by({"name"=>"Twitter"})
twitter["url"]="https://twitter.com"
twitter["name"]="X (Formerly Twitter)"
p twitter
#but we need to save it into the data! It will decide if it's a create or an update or what, since it's so smart
twitter.save
#we can check the data using rails runner data.rb
# 7. delete a row
twitter=Company.find_by({"name"=>"X (Formerly Twitter)"})
twitter.destroy
