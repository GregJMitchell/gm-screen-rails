class Campaigns::BaseController < ApplicationController
  before_action :is_current_user
end
