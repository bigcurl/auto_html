require 'action_controller'
require 'cgi'
require 'rails-deprecated_sanitizer'

AutoHtml.add_filter(:sanitize).with({}) do |text, options|
  HTML::WhiteListSanitizer.new.sanitize(text, options)
end
