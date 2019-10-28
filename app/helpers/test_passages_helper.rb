module TestPassagesHelper
  def passage_result(test_passage)
    if test_passage.passed?
      'You have passed the test!'
    else
      'Test failed'
    end
  end

  def passage_status(test_passage)
    if test_passage.passed?
      'passed_status'
    else
      'failed_status'
    end
  end
end
