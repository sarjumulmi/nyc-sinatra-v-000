class ChangeLandmarkYearToString < ActiveRecord::Migration[5.1]
  def up
    change_column :landmarks, :year_completed, :string
  end

  def down
    change_column :landmarks, :year_completed, :integer
  end
end
