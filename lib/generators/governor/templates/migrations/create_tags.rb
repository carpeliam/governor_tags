class GovernorCreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end
    
    create_table :<%= ['tags', mapping.plural.to_s].sort.join '_' %>, :id => false do |t|
      t.references :<%= mapping.singular %>, :tag
    end
  end

  def self.down
    drop_table :tags
    drop_table :<%= ['tags', mapping.plural.to_s].sort.join '_' %>
  end
end
