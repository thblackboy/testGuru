class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_badge_not_found

  def index
    @badges = Badge.all  
  end

  def new
    @badge = Badge.new
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :image_src, :condition_type, :condition_value)
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def rescue_with_badge_not_found
    render plain: 'Бэйдж не найден'
  end
end
