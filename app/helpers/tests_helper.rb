# frozen_string_literal: true

module TestsHelper
  TEST_LEVELS = { 0 => :elementary, 1 => :easy, 2 => :advanced, 3 => :hard }.freeze

  def questions_amount(test)
    test.questions.count
  end

  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end

  def test_header(test)
    if test.new_record?
      'Create new Test'
    else
      "Edit #{test.title} Test"
    end
  end

  def time_limit_helper(test)
    [test.time_limit, I18n.t(:min)].join(' ')
  end
end
