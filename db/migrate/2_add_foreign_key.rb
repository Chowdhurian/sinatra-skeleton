class AddForeignKey < ActiveRecord::Migration
    
    def change
        
        change_table :videos do |t|
            t.references :user
        end
        
        change_table :reviews do |t|
            t.references :video
        end
        
        change_table :reviews do |t|
            t.references :user
        end
        
        change_table :ratings do |t|
            t.references :video
        end
        
        change_table :ratings do |t|
            t.references :user
        end 
        
    end
    
end