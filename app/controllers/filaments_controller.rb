class FilamentsController < ApplicationController
  before_action :set_filament_colors, only: %i[create new]
  before_action :set_filament_types, only: %i[create new]

  def create
    filament_brand = filaments_params[:filament_brand]
    filament_type = filaments_params[:filament_type]
    filament_color = filaments_params[:filament_color]
    current_user.filaments.create(filament_brand: filament_brand, filament_type: filament_type,
                                  filament_color: filament_color)
    redirect_to edit_user_registration_path
  end

  def new; end

  def destroy
    @filament = Filament.where(id: filaments_params[:id])[0]
    @filament.destroy
    redirect_to edit_user_registration_path
  end

  private

  def filaments_params
    params.permit(:filament_brand, :filament_type, :filament_color, :id)
  end

  def set_filament_types
    @filament_types = ['PLA', 'silk PLA', 'ABS', 'TPU', 'PETG', 'Nylon', 'Wood', 'Resin']
  end

  def set_filament_colors
    @filament_colors = %w[Black White Red Orange Yellow Green Blue Pink Purple Rainbow]
  end
end
