class WelcomePagesController < ApplicationController

  skip_before_action :authenticate_user!

  def index_welcome; end

  def why_socket_chat; end

  def about_us; end

  def find_your_workspace; end
end
