class ContributionMailer < ApplicationMailer
  def contribution_mail(contribution)
    @contribution = contribution
    mail to: "test@example.com", subject: "お問い合わせの確認メール"
  end
end
