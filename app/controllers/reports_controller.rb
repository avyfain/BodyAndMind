class ReportsController < ApplicationController
  before_action :set_report, only: [ :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.last(7)
    @diaries = Report.order(:created_at)
    respond_to do |format|
      format.html
      format.csv { send_data @diaries.to_csv }
      format.xls { send_data @diaries.to_csv(col_sep: "\t") }
    end
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
      ReportMailer.MailReports(params[:export][:email]).deliver
      flash[:success] = params[:export][:email]
      @diaries = Report.order(:created_at)
      respond_to do |format|
        format.html
        format.csv { send_data @diaries.to_csv }
        format.xls { send_data @diaries.to_csv(col_sep: "\t") }
      end
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)
    @report.excercise = (report_params['excercise'] == "Yes" ? 1 : 0)
    if @report.save
      redirect_to reports_path
    else
      flash[:error] = "Something went wrong."
      render 'new'
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:sleep, :wake, :excercise, :energy, :mood, :weight, :stress, :weather, :temperature, :geolocation)
    end

end
