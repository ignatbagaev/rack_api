class BaseController
  attr_reader :request

  def initialize(request)
    @request = request
  end

  private

  def respond_with_success(status, body)
    { status: status,
      body: {
        data: body
      } }
  end

  def respond_with_error(status, body)
    { status: status, body: body }
  end

  def params
    request.params
  end
end
