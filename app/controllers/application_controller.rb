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

  def api
  	user_email=params[:user_email]
  	puts(user_email)
  	ride_info=params[:ride]
  	@cur_user=User.where(email: user_email)
  	@new_ride=Ride.new(startL:"Ottawa", endL:"Scarborough", startT:"2018-02-24 23:04:53", endT:"2018-02-24 23:04:53", transForm:"Taxi", user_id:1)
  	puts(ride_info[:startL])
  	puts(ride_info[:endL])
  	puts(ride_info[:startT])
  	puts(ride_info[:endT])
  	puts(ride_info[:transForm])
  	puts(@cur_user.ids)
  	puts(@cur_user.ids[0].to_i)
  	@new_ride=Ride.new(startL: ride_info[:startL], endL: ride_info[:endL], startT: ride_info[:startT], endT: ride_info[:endT], transForm: ride_info[:transForm], user_id: @cur_user.ids[0])
  	
  	#puts(@new_ride)
  	#puts(@cur_user.ids)
  	if(@new_ride.save)
  		puts("success")
  	else
  		puts("failure")
  	end
  	render "Nothing"
  end
end