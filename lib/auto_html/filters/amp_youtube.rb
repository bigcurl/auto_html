AutoHtml.add_filter(:amp_youtube).with(:width => 420, :height => 315) do |text, options|
  regex = /(https?:\/\/)?(www.)?(youtube\.com\/watch\?v=|youtu\.be\/|youtube\.com\/watch\?feature=player_embedded&v=)([A-Za-z0-9_-]*)(\&\S+)?(\?\S+)?/
  text.gsub(regex) do
    youtube_id = $4
    width = options[:width]
    height = options[:height]

    %{<amp-youtube data-videoid="#{youtube_id}" layout="responsive" width="#{width}" height="#{height}"></amp-youtube>}
  end
end
