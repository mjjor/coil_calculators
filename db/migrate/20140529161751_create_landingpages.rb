class CreateLandingpages < ActiveRecord::Migration
  def change
    create_table :landingpages do |t|

      t.timestamps
    end
  end
end
