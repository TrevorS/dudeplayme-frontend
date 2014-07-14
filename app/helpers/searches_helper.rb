module SearchesHelper
  def popularity_stars(popularity)
    full_stars, half_star, empty_stars = get_number_of_stars(popularity)
    results = full_stars.times.map { fa_icon('star') }
    results << fa_icon('star-half-full') if half_star
    results << empty_stars.times.map { fa_icon('star-o') }
    results.join('').html_safe
  end

  def format_duration(ms)
    ss = ms / 1000
    mm, ss = ss.divmod(60)
    hh, mm = mm.divmod(60)
    __, hh = hh.divmod(24)
    results = ""
    results += "#{left_pad(hh)}:" if hh > 0
    results += "#{left_pad(mm)}:" if mm > 0
    results += "#{left_pad(ss)}" if ss > 0
  end

  def play_button(uri)
    link_to '#', class: 'pure-button search-command search-command-play' do
      fa_icon 'play', text: 'Play'
    end
  end

  def queue_button(uri)
    link_to '#', class: 'pure-button search-command search-command-queue' do
      fa_icon 'plus', text: 'Queue'
    end
  end

  def artist_image(images, name)
    if images.count >= 1
      image_tag images[1]['url'], alt: name, height: 300, width: 300, class: 'results-img'
    else
      fa_stacked_icon 'question', base: 'square-o', class: 'results-no-artist'
    end
  end

  private
  def get_number_of_stars(popularity)
    full_stars, remainder = popularity.divmod(20)
    half_star = true if remainder >= 10
    total_stars = 5
    empty_stars = total_stars - full_stars
    empty_stars -= 1 if half_star
    [full_stars, half_star, empty_stars]
  end

  def left_pad(number)
    number.to_s.rjust(2, "0")
  end
end
