module Music_player
  SIGNAL_RECT_DISPLAYING_TIME = 15

  def play_sound(current_time, options)
    note = options[:note]

    if @time == (current_time / @velocity).ceil
      @notes[note].play(@volume)
    end
  end

  def draw_signal_rect(current_time, options)
    note = options[:note]
    display_time = options[:display_time] || SIGNAL_RECT_DISPLAYING_TIME

    if (@time > (current_time / @velocity).ceil) && (@time < ((current_time + display_time) / @velocity).ceil)
      x = @piano_buttons_start_x + (@piano_buttons_size + @piano_buttons_offset) * note
      draw_rect(x, @signal_rect_start_y, @piano_buttons_size, @piano_buttons_size, Gosu::Color.argb(0xff_ffffff), z = 1, mode = :default)
    end
  end

  def start_playing
    @can_play = true
    @play_btn_active = false
    @stop_btn_active = true
  end

  def stop_playing
    @time = 0
    @can_play = false
    @play_btn_active = true
    @stop_btn_active = false
  end

  def play_song(velocity, **options)
    sound_on = options[:sound]
    signal_on = options[:signal]
    @time += 1

    end_time = @melody.reduce(@start_time) do |akk, value|
      play_sound(akk, value) if sound_on
      draw_signal_rect(akk, value) if signal_on
      akk + value[:duration]
    end

    if @time >= end_time / @velocity
      stop_playing
    end
  end
end
