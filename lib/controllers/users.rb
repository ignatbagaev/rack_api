class UsersController < BaseController
  def index
    respond_with_success 200, User.order(:id).map(&:values)
  end

  def show
    user = User.find(id: params['id'].to_i)
    if user
      respond_with_success(200, user.values)
    else
      respond_with_error(404, 'Not Found')
    end
  end

  def create
    user = User.new(email: params['email'])
    user.save
    respond_with_success 201, user.values
  rescue Sequel::ValidationFailed
    respond_with_error 422, user.errors.full_messages.join(', ')
  end
end
