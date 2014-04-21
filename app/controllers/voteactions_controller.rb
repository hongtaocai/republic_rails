class VoteactionsController < ApplicationController
  before_action :set_voteaction, only: [:show, :edit, :update, :destroy]

  # GET /voteactions
  # GET /voteactions.json
  def index
    @voteactions = Voteaction.all
  end

  # GET /voteactions/1
  # GET /voteactions/1.json
  def show
  end

  # GET /voteactions/new
  def new
    @voteaction = Voteaction.new
  end

  # GET /voteactions/1/edit
  def edit
  end

  # POST /voteactions
  # POST /voteactions.json
  def create

    puts voteaction_params

    @voteaction = Voteaction.new(voteaction_params)

    respond_to do |format|
      if @voteaction.save
        format.html { redirect_to @voteaction, notice: 'Voteaction was successfully created.' }
        format.json { render :show, status: :created, location: @voteaction }
        format.js
      else
        format.html { render :new }
        format.json { render json: @voteaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /voteactions/1
  # PATCH/PUT /voteactions/1.json
  def update
    respond_to do |format|
      if @voteaction.update(voteaction_params)
        format.html { redirect_to @voteaction, notice: 'Voteaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @voteaction }
      else
        format.html { render :edit }
        format.json { render json: @voteaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voteactions/1
  # DELETE /voteactions/1.json
  def destroy
    @voteaction.destroy
    respond_to do |format|
      format.html { redirect_to voteactions_url }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voteaction
      @voteaction = Voteaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def voteaction_params
      params[:voteaction].permit(:user_id, :publication_id)
    end
end
