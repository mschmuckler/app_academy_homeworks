module TracksHelper
  include ERB::Util

  def ugly_lyrics(lyrics)
    para = lyrics.lines.map { |el| "🎵 " + el }.join
    "<pre>#{h(para)}</pre>".html_safe
  end

end
