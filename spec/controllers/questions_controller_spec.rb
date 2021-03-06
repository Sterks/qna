require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  describe 'GET #index' do

    let(:questions) { create_list(:question, 2) }

    before { get :index }

    it 'populates an array of all questions' do
      expect(assigns(:questions)).to match_array(questions)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end
  describe 'GET #show' do
    let (:question) { create(:question) }

    before { get :show, id: question }

    it 'assigns the required question to @question' do
      expect(assigns(:question)).to eq question
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end
  describe 'GET #new' do
    before { get :new }

    it 'assigns a new Question to @question' do
      expect(assigns(:question)).to be_a_new(Question)
    end

    it 'render new view' do
      expect(assigns(:question)).to render_template :new
    end
  end

  describe 'GET #edit' do
    let (:question) { create(:question) }
    before { get :edit, id: question }
    it 'assigns the required question to @question' do
      expect(assigns(:question)).to eq question
    end

    it 'render new view' do
      expect(assigns(:question)).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'save new question in the database' do
        expect { post :create, question: attributes_for(:question) }.to change(Question, :count).by(1)
      end
      it 'redirect to show view' do
        post :create, question: attributes_for(:question)
        expect(response).to redirect_to question_path(assigns(:question))
      end
    end
    context 'with invalid attributes' do
      it 'does not save the question' do
        expect { post :create, question: attributes_for(:invalid_question) }.to_not change(Question, :count)
      end
      it 're-renders new view' do
        post :create, question: attributes_for(:invalid_question)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    let (:question) { create(:question) }
    context 'valid attributes' do
      it 'assings the required question to @question' do
        patch :update, id: question, question: attributes_for(:question)
        expect(assigns(:question)).to eq question
      end

      it 'change attributes' do
        patch :update, id: question, question: { title: 'new title', body: 'new body' }
        question.reload
        expect(question.title).to eq 'new title'
        expect(question.body).to eq 'new body'
      end

      it 'redirects to the updated question' do
        patch :update, id: question, question: attributes_for(:question)
        expect(response).to redirect_to question
      end
    end
  end

end
