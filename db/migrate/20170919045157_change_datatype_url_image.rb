class ChangeDatatypeUrlImage < ActiveRecord::Migration[5.1]
  def change
    change_column(:images, :url, :text)
  end
end
