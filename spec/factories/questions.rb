FactoryGirl.define do
  factory :question, class: "Question"  do
    title "MyString"
    body "MyText"
  end

  factory :invalid_question, class: "Question" do
    title nil
    body nil
  end
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
