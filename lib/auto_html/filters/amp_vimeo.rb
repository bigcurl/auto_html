AutoHtml.add_filter(:amp_vimeo).with(:width => 440, :height => 248) do |text, options|
  text.gsub(/https?:\/\/(www.)?vimeo\.com\/([A-Za-z0-9._%-]*)((\?|#)\S+)?/) do
    vimeo_id = $2
    width  = options[:width]
    height = options[:height]

    %{<amp-vimeo data-videoid="#{vimeo_id}" layout="responsive" width="#{width}" height="#{height}"></amp-vimeo>}
  end
end
