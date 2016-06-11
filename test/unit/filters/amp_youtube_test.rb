require File.expand_path('../../unit_test_helper', __FILE__)

class AMPYouTubeTest < Minitest::Test

  def test_transform
    result = auto_html('http://www.youtube.com/watch?v=BwNrmYRiX_o') { amp_youtube }
    assert_equal '<amp-youtube data-videoid="BwNrmYRiX_o" layout="responsive" width="420" height="315"></amp-youtube>', result
  end

  def test_transform2
    result = auto_html('http://www.youtube.com/watch?v=BwNrmYRiX_o&eurl=http%3A%2F%2Fvukajlija.com%2Fvideo%2Fklipovi%3Fstrana%3D6&feature=player_embedded') { amp_youtube }
    assert_equal '<amp-youtube data-videoid="BwNrmYRiX_o" layout="responsive" width="420" height="315"></amp-youtube>', result
  end

  def test_transform3
    result = auto_html('http://www.youtube.com/watch?v=BwNrmYRiX_o&feature=related') { amp_youtube }
    assert_equal '<amp-youtube data-videoid="BwNrmYRiX_o" layout="responsive" width="420" height="315"></amp-youtube>', result
  end

  def test_transform4
    result = auto_html('foo http://www.youtube.com/watch?v=fT1ahr81HLw<br>bar') { amp_youtube }
    assert_equal 'foo <amp-youtube data-videoid="fT1ahr81HLw" layout="responsive" width="420" height="315"></amp-youtube><br>bar', result
  end

  def test_transform_url_without_www
    result = auto_html('http://youtube.com/watch?v=BwNrmYRiX_o') { amp_youtube }
    assert_equal '<amp-youtube data-videoid="BwNrmYRiX_o" layout="responsive" width="420" height="315"></amp-youtube>', result
  end

  def test_transform_with_options
    result = auto_html('http://www.youtube.com/watch?v=BwNrmYRiX_o') { amp_youtube(:width => 300, :height => 255, :frameborder => 1, :wmode => 'window') }
    assert_equal '<amp-youtube data-videoid="BwNrmYRiX_o" layout="responsive" width="300" height="255"></amp-youtube>', result
  end

  def test_transform_with_short_url
    result = auto_html('http://www.youtu.be/BwNrmYRiX_o') { amp_youtube }
    assert_equal '<amp-youtube data-videoid="BwNrmYRiX_o" layout="responsive" width="420" height="315"></amp-youtube>', result
  end

  def test_transform_https
    result = auto_html("https://www.youtube.com/watch?v=t7NdBIA4zJg") { amp_youtube }
    assert_equal '<amp-youtube data-videoid="t7NdBIA4zJg" layout="responsive" width="420" height="315"></amp-youtube>', result
  end

  def test_short_with_params
    result = auto_html("http://youtu.be/t7NdBIA4zJg?t=1s&hd=1") { amp_youtube }
    assert_equal '<amp-youtube data-videoid="t7NdBIA4zJg" layout="responsive" width="420" height="315"></amp-youtube>', result
  end

  def test_transform_without_protocol
    result = auto_html("www.youtube.com/watch?v=t7NdBIA4zJg") { amp_youtube }
    assert_equal '<amp-youtube data-videoid="t7NdBIA4zJg" layout="responsive" width="420" height="315"></amp-youtube>', result
  end
end
