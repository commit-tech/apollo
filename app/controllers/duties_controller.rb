class DutiesController < ApplicationController
  def index
    @date = params[:date]
    starting_date = date - (date.cwdays - 1)
    # @duties = Array.new(7)
    # starting_date.upto(starting_date + 7) do |day|
    #  @duties.push(day)
    # end
    @duties = Array.new(starting_date..(starting_date + 7))
    @time_ranges = Time_range.all
    @places = Place.all
  end

  def process_grab
    @user = User.find(params[:user_id])
    @duty = Duty.find(params[:duty_id])

    # user_id of duty_id should and must be null
    redirect_to action: 'index' if @duty.update(@user_id)
  end

  def process_drop
    @user = User.find(params[:user_id])
    @duty = Duty.find(params[:duty_id])

    redirect_to action: 'index' if @duty.update(:user_id, nil)
  end

  def edit
    render 'admin_edit'
  end

  def update
    render 'admin_update'
  end

  def admin_edit # mass edit
    @user = User.find(params[:user_id])
    @duties = Duty.find(params[:duty_ids])
  end

  def admin_update
    @user = User.find(params[:user_id])
    @duties = Duty.find(params[:duty_ids])
    @duties.each do |duty|
      duty.process_grab(duty.params[:user_id], params[:duty_id])
      unless duty.update(duty_params)
        flash[:notice] = 'Error!'
        render 'admin_edit'
      end
    end
    flash[:notice] = 'Successfully update the duty status!'
    redirect_to root_path
  end

  def set_default
    @user = User.find(params[:user_id])
    @timeslot = Timeslot.find(params[:timeslot_id])

    redirect_to action: 'index' if @timeslot.update(@user_id)
  end

  def mass_set_default
    @duties = Duty.find(params[:duty_ids])
    @duties.each do |duty|
      duty.set_default(duty, duty.params[:user_id], params[:timeslot_id])
    end
  end

  private

  def user_id_params
    params.require(:users).permit(:user_id)
  end

  def duty_params
    params.require(:duties).permit(:duty_id)
  end

  def timeslot_params
    params.require(:timeslots).permit(:timeslot_id)
  end
end
