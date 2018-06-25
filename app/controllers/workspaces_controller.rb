class WorkspacesController < ApplicationController

  def show
    @workspace = Workspace.find_by(id: params[:id])
  end
end
