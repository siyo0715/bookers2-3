class HomesController < ApplicationController
before_action :authenticate_user!, except: [:top, :about, :public_action]
  before_action :configure_permitted_parameters, if: :devise_controller?
  def top
  end
  def about
  end
end
