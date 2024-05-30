# # config/initializers/secure_headers.rb

# SecureHeaders::Configuration.default do |config|
#     config.csp = {
#       default_src: %w('self'),
#       script_src: %w('self' https: 'unsafe-inline'),
#       style_src: %w('self' https: 'unsafe-inline'),
#       font_src: %w('self' https: data:),
#       img_src: %w('self' https: data:),
#       connect_src: %w('self' https:),
#       frame_src: %w('self' https:),
#       form_action: %w('self' https:),
#       base_uri: %w('self'),
#       frame_ancestors: %w('self'),
#       block_all_mixed_content: true,
#       upgrade_insecure_requests: true
#     }
#   end
  