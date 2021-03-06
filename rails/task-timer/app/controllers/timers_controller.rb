class TimersController < ApplicationController
  before_action :set_timer, only: [:update, :edit, :destroy]
  before_action :authenticate_user!
  def new
  end

  def create
    @task = Task.find params[:task_id]

    @timer = @task.timers.create(timer_params)
    respond_to do |format|
      # format.html { redirect_to @task, notice: 'Timer started' }
      format.json { render json: @timer.to_json(except: [:created_at, :updated_at]) }
      format.js
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @timer.update timer_params
        # format.html { redirect_to @task, notice: 'Timer stopped' }
        format.json { render json: @timer.to_json(except: [:created_at, :updated_at]) }
        format.js
      end
    end

  end

  def destroy
    respond_to do |format|
      if @timer.destroy
        format.json { render json: {success: true} }
        format.js
      end
    end
  end

  private
    def set_timer
      @timer = Timer.find(params[:id])
      @task = @timer.task
    end

    def timer_params
      form_params = params.require(:timer).permit :start, :finish
    end

end
