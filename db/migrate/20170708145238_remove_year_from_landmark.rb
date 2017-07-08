class RemoveYearFromLandmark < ActiveRecord::Migration[5.1]
  def change
    remove_column :landmarks, :year_completed
  end
end
