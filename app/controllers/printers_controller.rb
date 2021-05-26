class PrintersController < ApplicationController
  def create
    printer = Printer.find_or_create_by(printer_params)
    current_user.printers << printer unless current_user.printers.include?(printer)
    redirect_to edit_user_registration_path
  end

  def destroy
    current_user.printers.destroy(Printer.find(params[:id]))
    redirect_to edit_user_registration_path
  end

  def update
    # placeholder
  end

  private

  def printer_params
    params.permit(:printer_brand, :printer_model, :printer_type)
  end
end
