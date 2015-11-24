require 'action_controller'
require 'cgi'
require 'rails-html-sanitizer'

=======
>>>>>>> master
AutoHtml.add_filter(:sanitize).with({}) do |text, options|
  require 'action_controller'
  require 'cgi'
  RAILS::HTML::WhiteListSanitizer.new.sanitize(text, options)
end
