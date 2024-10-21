module Tracks_and_instruments_buttons
  def init_tracks_and_instruments_buttons_coords
    @instruments_buttons_start_x = 80
    @instruments_buttons_start_y = height / 10 * 4
    @instruments_buttons_offset = 70
    @instruments_buttons_size = 50
    @instruments_buttons_color = Gosu::Color.argb(0xff_1492FA)
    @instruments_buttons_color_active = Gosu::Color.argb(0xff_33ff99)

    @tracks_buttons_start_x = 80
    @tracks_buttons_start_y = height / 10 * 3
    @tracks_buttons_offset = 250
    @tracks_buttons_size = 50
    @tracks_buttons_color = Gosu::Color.argb(0xff_689CEB)
    @tracks_buttons_color_active = Gosu::Color.argb(0xff_33ff99)
  end

  def draw_instruments_buttons
    @instruments.each_with_index do |instrument, index|
      color = index == @active_instrument ? @instruments_buttons_color_active : @instruments_buttons_color
      x = @instruments_buttons_start_x + (@instruments_buttons_size + @instruments_buttons_offset) * index
      draw_rect(x, @instruments_buttons_start_y, @instruments_buttons_size, @instruments_buttons_size, color, z = 1, mode = :default)

      text = @instruments[index].to_s
      text_x = (x + @instruments_buttons_size / 2) - (@font.text_width(text) / 2)
      text_y = (@instruments_buttons_start_y + @instruments_buttons_size / 2) - (@font.height / 2)
      @font.draw_text(text, text_x, text_y, 2)
    end
  end

  def check_instruments_buttons_clicks(mx, my)
    if (my > @instruments_buttons_start_y) && (my < @instruments_buttons_start_y + @instruments_buttons_size)
      index = ((mx - @instruments_buttons_start_x) / (@instruments_buttons_size + @instruments_buttons_offset)).to_i
      stop_playing
      @active_instrument = index
      @notes = @tracks[@active_track].get_notes[@instruments[@active_instrument]]
    end
  end

  def draw_track_buttons
    @tracks.each_with_index do |track, index|
      color = index == @active_track ? @tracks_buttons_color_active : @tracks_buttons_color
      x = @tracks_buttons_start_x + (@tracks_buttons_size + @tracks_buttons_offset) * index
      draw_rect(x, @tracks_buttons_start_y, @tracks_buttons_size, @tracks_buttons_size, color, z = 1, mode = :default)

      text = @tracks[index]::TITLE
      text_x = (x + @tracks_buttons_size / 2) - (@font.text_width(text) / 2)
      text_y = (@tracks_buttons_start_y + @tracks_buttons_size / 2) - (@font.height / 2)
      @font.draw_text(text, text_x, text_y, 2)
    end
  end

  def check_track_buttons_clicks(mx, my)
    if (my > @tracks_buttons_start_y) && (my < @tracks_buttons_start_y + @tracks_buttons_size)
      index = ((mx - @tracks_buttons_start_x) / (@tracks_buttons_size + @tracks_buttons_offset)).to_i
      stop_playing
      @active_track = index
      @instruments = @tracks[@active_track].get_notes.keys
      @melody = @tracks[@active_track].get_melody
      @active_instrument = 0
      @notes = @tracks[@active_track].get_notes[@instruments[@active_instrument]]
      @piano_buttons_size = ((width - (2 * @piano_buttons_start_x)) / @notes.size) - @piano_buttons_offset
    end
  end
end
