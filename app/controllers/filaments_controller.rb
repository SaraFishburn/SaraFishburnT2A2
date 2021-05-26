class FilamentsController < ApplicationController
  before_action :set_filament_colors, only: %i[create new]
  before_action :set_filament_types, only: %i[create new]

  def create
    filament = Filament.find_or_create_by(filament_params)
    current_user.filaments << filament unless current_user.filaments.include?(filament)
    redirect_to edit_user_registration_path
  end

  def new; end

  def destroy
    current_user.filaments.destroy(Filament.find(params[:id]))
    redirect_to edit_user_registration_path
  end

  private

  def filament_params
    params.permit(:filament_brand, :filament_type, :filament_color)
  end

  def set_filament_types
    @filament_types = ['PLA', 'Silk PLA', 'ABS', 'TPU', 'PETG', 'Nylon', 'Wood', 'Resin']
  end

  def set_filament_colors
    @filament_colors = %w[Black White Red Orange Yellow Green Blue Pink Purple Rainbow]
  end
end
