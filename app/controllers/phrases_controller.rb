class PhrasesController < ApplicationController
  before_action :set_phrase, only: [:show, :edit, :update, :destroy]

  # GET /phrases
  # GET /phrases.json
  def index
    @phrases = Phrase.search(params[:search]).order(:english_phrase).paginate(page: params[:page], per_page: 25)

    respond_to do |format|
      format.html
      format.csv { send_data Phrase.all.to_csv }
      format.xls # { send_data @departments.to_csv(col_sep: "\t") }
    end
  end

  # GET /phrases/1
  # GET /phrases/1.json
  def show
  end

  # GET /phrases/new
  def new
    @phrase = Phrase.new
  end

  # GET /phrases/1/edit
  def edit
  end

  # POST /phrases
  # POST /phrases.json
  def create
    @phrase = Phrase.new(phrase_params)

    respond_to do |format|
      if @phrase.save
        format.html { redirect_to @phrase, notice: 'Phrase was successfully created.' }
        format.json { render :show, status: :created, location: @phrase }
      else
        format.html { render :new }
        format.json { render json: @phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phrases/1
  # PATCH/PUT /phrases/1.json
  def update
    respond_to do |format|
      if @phrase.update(phrase_params)
        format.html { redirect_to @phrase, notice: 'Phrase was successfully updated.' }
        format.json { render :show, status: :ok, location: @phrase }
      else
        format.html { render :edit }
        format.json { render json: @phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phrases/1
  # DELETE /phrases/1.json
  def destroy
    @phrase.destroy
    respond_to do |format|
      format.html { redirect_to phrases_url, notice: 'Phrase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    Phrase.import(params[:file])
    redirect_to phrases_path, notice: "Phrases imported."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phrase
      @phrase = Phrase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def phrase_params
      params.require(:phrase).permit(:english_phrase, :french_phrase, :version)
    end
end
