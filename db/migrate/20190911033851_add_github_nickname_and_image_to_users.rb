class AddGithubNicknameAndImageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :github_nickname, :string
    add_column :users, :image, :string
  end
end
