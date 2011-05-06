class GovernorCreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end
    
    create_table :articles_tags, :id => false do |t|
      t.references :article, :tag
    end
  end

  def self.down
    drop_table :tags
    drop_table :articles_tags
  end
end
