class RecommendationMailer < ActionMailer::Base
  
  def recommendation_email(recommendation)
    @recommendation = recommendation
    
    mail( :from => "#{recommendation.name} <#{recommendation.from_email}>",
          :reply_to => "#{recommendation.name} <#{recommendation.from_email}>",
          :to => "#{recommendation.to_email}",
          :subject => "#{recommendation.subject}"
    )
  end
end
