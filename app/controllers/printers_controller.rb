class PrintersController < ApplicationController
  before_action :set_printer_types, only: %i[create]

  def create
    printer_brand = printer_params[:printer_brand]
    printer_type = printer_params[:printer_model]
    printer_color = printer_params[:printer_type]
    current_user.filaments.create(printer_brand: printer_brand, printer_model: printer_model,
                                  printer_color: printer_type)
    redirect_to edit_user_registration_path
  end

  def read
    # placeholder
  end

  def update
    # placeholder
  end

  def destroy
    @printer = Printer.where(id: printer_params[:id])[0]
    @printer.destroy
    redirect_to edit_user_registration_path
  end

  private

  def printer_params
    params.permit(:printer_brand, :printer_model, :printer_type, :id)
  end

  def set_printer_types
    @printer_types = %w[FDM SLA]
  end
end
