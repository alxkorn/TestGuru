module TestsHelper
  def questions_amount(test)
    test.questions.count
  end
end
