class ConcertsController < ApplicationController
  before_action :set_concert, only: [:show, :edit, :update, :destroy]
  before_action :authorized?, only: [:edit, :update, :destroy]
  before_action :set_group, except: [:list, :about]
  # GET /concerts
  # GET /concerts.json
  def index
    @concerts = @group.concerts
  end

  def list
    @concerts = Concert.all
    render :action => "index"
  end

  # GET /concerts/1
  # GET /concerts/1.json
  def show
  end

  # GET /concerts/new
  def new
    @concert = Concert.new
    # @group_id = Group.find(params[:group_id])
  end

  # GET /concerts/1/edit
  def edit
  end

  # POST /concerts
  # POST /concerts.json
  def create
    @concert = Concert.new(concert_params)
    @concert.group_id = @group.id
    @concert.user_id = current_user.id

    respond_to do |format|
      if @concert.save
        format.html { redirect_to group_concerts_path, notice: 'Concert was successfully created.' }
        format.json { render :show, status: :created, location: @concert }
      else
        format.html { render :new }
        format.json { render json: @concert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concerts/1
  # PATCH/PUT /concerts/1.json
  def update
     @concert.group_id = @group.id
    respond_to do |format|
      if @concert.update(concert_params)
        format.html { redirect_to group_concerts_path, notice: 'Concert was successfully updated.' }
        format.json { render :show, status: :ok, location: @concert }
      else
        format.html { render :edit }
        format.json { render json: @concert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concerts/1
  # DELETE /concerts/1.json
  def destroy
    @concert.performers.destroy_all
    @concert.destroy
    respond_to do |format|
      format.html { redirect_to  group_concerts_path, notice: 'Concert was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concert
      @concert = Concert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def concert_params
      params.require(:concert).permit(:user_id, :group_id, :venue, :date, :address)
    end

     def authorized? 
      
      redirect_to '/' unless current_user.id == @concert.group.user_id
    end

    def set_group
      @group = Group.find(params[:group_id])
    end

end
