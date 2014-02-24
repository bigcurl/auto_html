require 'uri'
require 'rinku'
require 'rexml/document'
require 'addressable/uri'

AutoHtml.add_filter(:link).with({}) do |text, options|
  option_short_link_name = options.delete(:short_link_name)
  attributes = Array(options).reject { |k,v| v.nil? }.map { |k, v| %{#{k}="#{REXML::Text::normalize(v)}"} }.join(' ')
  Rinku.auto_link(text, :all, attributes) do |url|
    if option_short_link_name
      begin
        url_parsed = Addressable::URI.heuristic_parse(url).normalize
        uri = URI.parse(URI.encode(url_parsed.to_s.strip))
        uri.query = nil
        uri.to_s
      rescue
        url
      end
    else
      url
    end
  end
end
