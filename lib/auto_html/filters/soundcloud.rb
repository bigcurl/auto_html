# encoding: UTF-8
require 'uri'

# set these options and default values
# :width => '100%', :height => 166, :auto_play => false, :theme_color => '00FF00', :color => '915f33', :show_comments => false
AutoHtml.add_filter(:soundcloud).with(:width => '100%', :height => 166, :auto_play => false, :theme_color => '00FF00', :color => '915f33', :show_comments => false, :show_artwork => false) do |text, options|
  text.gsub(/(https?:\/\/)?(www.)?soundcloud\.com\/\S*/) do |match|
    new_uri = match.to_s
    clean_url = new_uri.match(/(?i)\b((?:[a-z][\w-]+:(?:\/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))/)
    new_uri = (clean_url[0] =~ /^https?\:\/\/.*/) ? URI(clean_url[0]) : URI("https://#{clean_url[0]}")
    new_uri.normalize!
    width = options[:width]
    height = options[:height]
    auto_play = options[:auto_play]
    theme_color = options[:theme_color]
    color = options[:color]
    show_artwork = options[:show_artwork]
    show_comments = options[:show_comments]
    %{<iframe width="#{width}" height="#{height}" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=#{new_uri}&show_artwork=#{show_artwork}&show_comments=#{show_comments}&auto_play=#{auto_play}&color=#{color}&theme_color=#{theme_color}"></iframe>}
  end
end
