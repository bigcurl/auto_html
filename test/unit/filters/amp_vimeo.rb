require File.expand_path('../../unit_test_helper', __FILE__)

class AMPVimeoTest < Minitest::Test

  def test_transform_url_with_www
    result = auto_html('http://www.vimeo.com/3300155') { amp_vimeo }
    assert_equal '<amp-vimeo data-videoid="3300155" layout="responsive" width="440" height="246"></amp-vimeo>', result
  end

  def test_transform_url_without_www
    result = auto_html('http://vimeo.com/3300155') { amp_vimeo }
    assert_equal '<amp-vimeo data-videoid="3300155" layout="responsive" width="440" height="246"></amp-vimeo>', result
  end

  def test_transform_url_with_params
    result = auto_html('http://vimeo.com/3300155?pg=embed&sec=') { amp_vimeo }
    assert_equal '<amp-vimeo data-videoid="3300155" layout="responsive" width="440" height="246"></amp-vimeo>', result
  end

  def test_transform_url_with_anchor
    result = auto_html('http://vimeo.com/3300155#skirt') { amp_vimeo }
    assert_equal '<amp-vimeo data-videoid="3300155" layout="responsive" width="440" height="246"></amp-vimeo>', result
  end

  def test_transform_with_options
    result = auto_html("http://www.vimeo.com/3300155") { amp_vimeo(:width => 300, :height => 250) }
    assert_equal '<amp-vimeo data-videoid="3300155" layout="responsive" width="300" height="250"></amp-vimeo>', result
  end

  def test_transform_with_title
    result = auto_html("http://www.vimeo.com/3300155") { amp_vimeo(:width => 300, :height => 250, :show_title => true) }
    assert_equal '<amp-vimeo data-videoid="3300155" layout="responsive" width="300" height="250"></amp-vimeo>', result
  end

  def test_transform_with_byline
    result = auto_html("http://www.vimeo.com/3300155") { amp_vimeo(:width => 300, :height => 250, :show_byline => true) }
    assert_equal '<amp-vimeo data-videoid="3300155" layout="responsive" width="300" height="250"></amp-vimeo>', result
  end

  def test_transform_with_portrait
    result = auto_html("http://www.vimeo.com/3300155") { amp_vimeo(:width => 300, :height => 250, :show_portrait => true) }
    assert_equal '<amp-vimeo data-videoid="3300155" layout="responsive" width="300" height="250"></amp-vimeo>', result
  end

  def test_transform_url_with_https
    result = auto_html('https://vimeo.com/3300155') { amp_vimeo }
    assert_equal '<amp-vimeo data-videoid="3300155" layout="responsive" width="300" height="250"></amp-vimeo>', result
  end
end
