module QuestionsHelper
  def question_header
    case params[:action]
    when 'new'
      "Create new #{@test.title} Question"
    when 'edit'
      "Edit #{@question.test.title} Question"
    end
  end
end
