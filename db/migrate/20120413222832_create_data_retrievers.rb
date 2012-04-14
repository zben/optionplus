class CreateDataRetrievers < ActiveRecord::Migration
  def change
    create_table :data_retrievers do |t|

      t.timestamps
    end
  end
end
