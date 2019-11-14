class BadgeRewardService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    rewarded_badges = []
    Badge.all.each do |badge|
      rewarded_badges << reward(badge) if badge.check_condition(@test_passage) #self.send(badge.rule.to_sym, badge.rule_value)
    end
    rewarded_badges
  end

  def reward(badge)
    @user.badges.push(badge)
    badge
  end
end