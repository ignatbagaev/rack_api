class BaseController
  attr_reader :request

  def initialize(request)
    @request = request
  end

  private

  def respond_with(status, body)
    { status: status,
      body: {
        data: body
      } }
  end

  def params
    request.params
  end
end
