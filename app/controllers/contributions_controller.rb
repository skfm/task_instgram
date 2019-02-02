class ContributionsController < ApplicationController
  before_action :set_contribution, only: [:edit, :show, :update, :destroy]

  def index
    @contributions = Contribution.all.order(created_at: :desc)
  end

  def new
    if params[:back]
      @contribution = Contribution.new(contribution_params)
    else
      @contribution = Contribution.new
    end
  end
  
  def show
    @favorite = current_user.favorites.find_by(contribution_id: @contribution.id)
  end
  
  def edit
  end

  def create
    @contribution = current_user.contributions.build(contribution_params)
    if @contribution.save
      #ContributionMailer.contribution_mail(@contribution).deliver
      redirect_to contributions_path, notice: '投稿が完了しました！'
    else
      render 'new' 
    end
  end
  
  def update
    if @contribution.update(contribution_params)
      redirect_to contributions_path, notice: '投稿を編集しました！' 
    else
      render 'edit'
    end
  end

  def destroy
    @contribution.destroy
    redirect_to contributions_path, notice: '投稿を削除しました！' 
  end
  
  def confirm
    @contribution = current_user.contributions.build(contribution_params)
    render :new if @contribution.invalid?
  end
  
  private
  
  def set_contribution
    @contribution = Contribution.find(params[:id])
  end

  def contribution_params
    params.require(:contribution).permit(:content, :picture, :picture_cache)
  end
end
