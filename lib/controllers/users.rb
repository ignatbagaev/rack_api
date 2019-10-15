class UsersController < BaseController
  def index
    respond_with 200, 'index'
  end

  def show
    respond_with 200, "show user #{params['id']}"
  end

  def create
    respond_with 201, 'user created'
  end
end
