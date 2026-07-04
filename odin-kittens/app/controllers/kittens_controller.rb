class KittensController < ApplicationController
  before_action :set_kitten, only: [ :show, :edit, :update, :destroy ]
  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html
      format.json { render json: @kittens }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.create(kitten_params)
    if @kitten.save
      flash[:success] = "Let's goo, a new kitten added!"
      redirect_to @kitten
    else
      flash.now[:error] = "haha , you failed !!"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @kitten.update(kitten_params)
      flash[:success] = "Kitten updated !!"
      redirect_to @kitten
    else
      flash[:error] = "Rejecteeedd !!"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten.destroy
    flash[:success] = "Kitten deleted. You monster :'("
    redirect_to kittens_path
  end

  private

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.expect(kitten: [ :name, :age, :cuteness, :softness ])
  end
end
