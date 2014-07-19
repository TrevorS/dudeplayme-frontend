module SearchesHelper

  def artist_image(images, name)
    if images.count >= 1
      image_tag images[1]['url'], alt: name, height: 300, width: 300, class: 'results-img'
    else
      fa_stacked_icon 'question', base: 'square-o', class: 'results-no-artist'
    end
  end
end
