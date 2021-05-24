class OwnersController < ApplicationController
  before_action :public_name, only: %i[show]


end
