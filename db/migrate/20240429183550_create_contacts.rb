class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string "first_name"
      t.string "last_name"
      t.string "email"
      t.integer "company_id"
      #we would and could do something else for this integer special case, but for practice we are leaving it alone rn

      t.timestamps
    end
  end
end
