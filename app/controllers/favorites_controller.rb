class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites
  end
  
  def create
    favorite = current_user.favorites.create(contribution_id: params[:contribution_id])
    redirect_to contributions_url, notice: "#{favorite.contribution.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to contributions_url, notice: "#{favorite.contribution.user.name}さんのブログをお気に入り解除しました"
  end
  end
end
