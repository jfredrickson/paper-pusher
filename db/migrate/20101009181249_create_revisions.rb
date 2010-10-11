class CreateRevisions < ActiveRecord::Migration
  def self.up
    create_table :revisions do |t|
      t.string :note
      t.string :content_type
      t.binary :data
      t.references :document

      t.timestamps
    end
  end

  def self.down
    drop_table :revisions
  end
end
