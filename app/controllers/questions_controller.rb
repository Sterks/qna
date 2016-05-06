class QuestionsController < ApplicationController
  before_action :load_question, only: [:show, :edit]

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.new(questions_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def update
    @question = Question.update(questions_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end


private
  def load_question
    @question = Question.find(params[:id])
  end
  def questions_params
    params.require(:question).permit(:title, :body)
  end

end
