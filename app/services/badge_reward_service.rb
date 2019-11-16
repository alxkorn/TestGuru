class BadgeRewardService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    Badge.all.select { |badge| badge.check_condition(@test_passage)}
  end
end