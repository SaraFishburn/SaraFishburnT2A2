class PrintersController < ApplicationController
  def create
    # use rails find_or_create_by to only create a printer record if one doesnt already exist
    printer = Printer.find_or_create_by(printer_params)

    # unless they already have that printer in their list
    # add the found or created printer record to the current user's printer list (add a join table record)
    current_user.printers << printer unless current_user.printers.include?(printer)

    redirect_to edit_user_registration_path
  end

  def destroy
    # remove the join table record not the printer record
    current_user.printers.destroy(Printer.find(params[:id]))

    redirect_to edit_user_registration_path
  end

  private

  def printer_params
    params.permit(:printer_brand, :printer_model, :printer_type)
  end
end
