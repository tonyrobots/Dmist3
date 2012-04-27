class AddRatingAverageToDreams < ActiveRecord::Migration
  def change
    add_column :dreams, :rating_average_writing, :decimal, :default => 0, :precision => 6, :scale => 2
    add_column :dreams, :rating_average_weirdness, :decimal, :default => 0, :precision => 6, :scale => 2
    add_column :dreams, :rating_average_interestingness, :decimal, :default => 0, :precision => 6, :scale => 2
  end
end
