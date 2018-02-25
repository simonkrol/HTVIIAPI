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
  	@cur_id=(@cur_user.ids[0].to_i)
  	@cur_user=User.find(@cur_id)
  	puts(@cur_user.age)
  	#@new_ride=Ride.new(startL:"Ottawa", endL:"Scarborough", startT:"2018-02-24 23:04:53", endT:"2018-02-24 23:04:53", transForm:"Taxi", user_id:1)
  	# puts(ride_info[:location])
  	# puts(ride_info[:time])
  	# puts(ride_info[:transForm])
  	# puts(ride_info[:current])
  	# puts(@cur_user.inspect)
  	# puts(@cur_user.inspect)
  	# puts(@cur_user.inspect)
  	# puts(@cur_user.get_value())
  	puts(@cur_user.age)
  	puts(@cur_user.age.nil?)
  	if(@cur_user.age.nil?)
  		@new_ride=Ride.new(startL: ride_info[:location],  startT: ride_info[:time], transForm: ride_info[:transForm], user_id: @cur_user.id)
		@new_ride.save
		puts(@new_ride.id)
		@cur_user.update(age: @new_ride.id)
		
  		
  	else
  		@test_ride=Ride.find(@cur_user.age)
  		@test_ride.endL=ride_info[:location]
  		@test_ride.endT=ride_info[:time]
  		@test_ride.save
		@cur_user.age=nil
		@cur_user.save
  	end
  	puts(@cur_user.age)
  	
  	render "Nothing"
  end

  def true?(obj)
  	obj.to_s == "true"
  end
end