class CreateTables < ActiveRecord::Migration
    
    def change
        
        create_table :users do |t|
            t.string :username #look into using twitter oauth
            t.string :email
            t.string :password
            t.timestamps
        end
        
        create_table :videos do |t|
            t.string :title
            t.string :image #for poster etc.
            t.string :media_type #short/feature/series
            t.integer :genre #scifi/action/comedy/suspense
            t.timestamps
        end
        
        create_table :reviews do |t|
            t.string :content #limit to 144 later
            t.timestamps
        end
        
        create_table :ratings do |t|
            t.integer :content #change to binary, like/not like, good/bad
        end
        
#        create_table :people do |t|
#            t.string :name
#            t.string :image #for their face picture
#            t.timestamps
#        end
        
    end
    
end