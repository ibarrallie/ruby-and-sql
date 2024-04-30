class CreateDominatrixes < ActiveRecord::Migration[7.1]
  def change
    create_table :dominatrixes do |t|

      t.timestamps
    end
  end
end
