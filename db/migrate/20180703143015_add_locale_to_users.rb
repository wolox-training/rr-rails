class AddLocaleToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.string :locale, default: 'en'
    end
  end
end
