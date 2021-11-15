# frozen_string_literal: true

class ChangeColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :password, :string
    add_column :users, :api_key, :string
  end
end
