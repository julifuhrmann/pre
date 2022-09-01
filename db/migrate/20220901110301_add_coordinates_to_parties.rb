class AddCoordinatesToParties < ActiveRecord::Migration[7.0]
  def change
    add_column :parties, :latitude, :float
    add_column :parties, :longitude, :float
  end
end
