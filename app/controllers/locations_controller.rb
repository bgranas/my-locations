class LocationsController < ApplicationController
  
  layout "admin"

  before_filter :authorize

  def index
  	@locations = Location.sorted
    @latitude = [params[:lat]]
    @longitude = [params[:lng]]
  end

  def new
  	@location = Location.new()
  	@location_count = Location.count + 1
    @myip = request.remote_ip
    @latitude = [params[:latitude]]
    @longitude = [params[:longitude]]
  end

  def create	
    @location = Location.new(location_params)
  	if @location.save
  		flash[:notice] = "Location created succesfully"
      redirect_to(:action => 'index')
     else
     	render('new')
     	@location_count = Location.count - 1
    end
  end

  def auto
    #if ip is not already in database
    @location_count = Location.count + 1
    @myip = request.remote_ip
    @latitude = [params[:latitude]]
    @longitude = [params[:longitude]]
    @location = Location.new(:name => "Test", :ip => @myip, :position => @location_count, :latitude => @latitude, :longitude => @longitude)
    if @location.save
      redirect_to(:action => 'index')
    end
  end

  def edit
  	@location = Location.find(params[:id])
  	@location_count = Location.count
  end

  def update
  	@location = Location.find(params[:id])
  	if @location.update_attributes(location_params)
  		redirect_to(:action => 'index')
  	else
  		render('edit')
  	end
  end

  def delete
  	@location = Location.find(params[:id])
  end

  def destroy
  	@location = Location.find(params[:id])
  	@location.destroy
  	redirect_to(:action => 'index')
  end


  private

  def location_params
  	params.require(:location).permit(:name, :ip, :latitude, :longitude, :created_at, :position, :updated_at)
  end

end
