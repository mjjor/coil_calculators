class CreateCalcCoilLengths < ActiveRecord::Migration
  def change
    create_table :calc_coil_lengths do |t|

      t.timestamps
    end
  end
end
