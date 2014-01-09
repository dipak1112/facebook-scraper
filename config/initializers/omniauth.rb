OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'], {:scope => 'user_birthday,user_events,email,user_groups,read_friendlists,read_stream,friends_online_presence,user_online_presence,publish_stream,user_about_me,user_activities,friends_activities,friends_birthday,user_education_history,friends_education_history,user_events,user_hometown,user_interests,user_likes,user_location,user_notes,user_photos,user_relationships,user_relationship_details,user_status,friends_status,user_website,user_work_history,publish_actions,create_event,rsvp_event' }
end

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}