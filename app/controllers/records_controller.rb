class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :edit, :update, :destroy]

  def index
    @records = Record.all
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    respond_to do |format|
      if @record.save
        format.html { redirect_to records_path, notice: "Record successfully created" }
        format.json { render :index, status: :created, location: @record }
      else
        format.html { render :new }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def show
    redirect_to records_path
  end

  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to @record, notice: 'Record successfully updated.' }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to records_path, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_record
    @record = Record.find(params[:id])
  end

  def record_params
    params.require(:record).permit(:title, :date, :amount)
  end
end
