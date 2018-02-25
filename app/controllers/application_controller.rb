class ApplicationController < ActionController::API
  def query
  	query_variables = params[:variables]
  	context={variable: query_variables}
    result = Schema.execute(
      params[:query],  context: context
    )
    puts(context)
    render json: result
  end

end