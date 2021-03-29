class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy like]
  before_action :authenticate_user!, except: %i[index show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  respond_to :js, :html, :json

  # GET /questions
  # GET /questions.json
  def username0
    @question.user.username
  end

  def index
    @questions = Question.order('created_at DESC').paginate(page: params[:page])
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params.merge(user_id: current_user.id, created_by: current_user.username))
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: "تم نشر الموضوع" }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: "تم تعديل الموضوع بنجاح" }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE questions
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  def like
    if current_user.voted_for? @question
      @question.unliked_by current_user
    else
      @question.liked_by current_user
    end
    redirect_to @question
  end

  def correct_user
    if user_signed_in? && @question.user_id == current_user.id or current_user.try(:admin?)
      else
        redirect_to questions_path, notice: ">غير مصرح لك "
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:title, :content)
    end

end
