class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
    	t.references :taggable, polymorphic: true, index: true
    	t.integer :tagger_id
    	t.integer :tagged_id

      t.timestamps null: false
    end
    add_index :tags, :tagger_id
    add_index :tags, :tagged_id
    add_index :tags, [:tagger_id, :tagged_id, :taggable_id, :taggable_type], unique: true, name: 'index_tag_tagger_tagged_taggable'
  end
end
