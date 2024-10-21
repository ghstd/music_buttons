module Control_buttons
  def init_buttons_coords
    @common_btn_y = height / 10
    @common_btn_size = width / 10

    @play_btn_x = width / 10
    @play_btn_color_on = Gosu::Color.argb(0xff_00ff00)
    @play_btn_color_off = Gosu::Color.argb(0x45_00ff00)
    @play_btn_active = true

    @stop_btn_x = (width / 10) * 2.5
    @stop_btn_color_on = Gosu::Color.argb(0xff_EB0ABF)
    @stop_btn_color_off = Gosu::Color.argb(0x45_EB0ABF)
    @stop_btn_active = false

    @volume_btn_x = (width / 10) * 4.5
    @volume_btn_color = Gosu::Color.argb(0xff_EB9C0E)

    @velocity_btn_x = (width / 10) * 7
    @velocity_btn_color = Gosu::Color.argb(0xff_EB9C0E)

    @sound_signal_btn_y = height / 4.5
    @sound_signal_btn_size = width / 20
    @sound_signal_btn_color_on = Gosu::Color.argb(0xff_00ff00)
    @sound_signal_btn_color_off = Gosu::Color.argb(0x45_00ff00)

    @sound_btn_x = (width / 10) * 3.5
    @signal_btn_x = (width / 10) * 5.5
  end

  def draw_play_btn
    if @play_btn_active
      draw_rect(@play_btn_x, @common_btn_y, @common_btn_size, @common_btn_size, @play_btn_color_on, z = 1, mode = :default)
    else
      draw_rect(@play_btn_x, @common_btn_y, @common_btn_size, @common_btn_size, @play_btn_color_off, z = 1, mode = :default)
    end

    text = 'play'
    text_x = (@play_btn_x + @common_btn_size / 2) - (@font.text_width(text) / 2)
    text_y = (@common_btn_y + @common_btn_size / 2) - (@font.height / 2)
    @font.draw_text(text, text_x, text_y, 2)

  end

  def draw_stop_btn
    if @stop_btn_active
      draw_rect(@stop_btn_x, @common_btn_y, @common_btn_size, @common_btn_size, @stop_btn_color_on, z = 1, mode = :default)
    else
      draw_rect(@stop_btn_x, @common_btn_y, @common_btn_size, @common_btn_size, @stop_btn_color_off, z = 1, mode = :default)
    end

    text = 'stop'
    text_x = (@stop_btn_x + @common_btn_size / 2) - (@font.text_width(text) / 2)
    text_y = (@common_btn_y + @common_btn_size / 2) - (@font.height / 2)
    @font.draw_text(text, text_x, text_y, 2)
  end

  def draw_volume_btn
    draw_rect(@volume_btn_x, @common_btn_y, @common_btn_size, @common_btn_size, @volume_btn_color, z = 1, mode = :default)
    volume = "volume: #{(@volume * 10).to_i}"
    x = (@volume_btn_x + @common_btn_size / 2) - (@font.text_width(volume) / 2)
    y = (@common_btn_y + @common_btn_size / 2) - (@font.height / 2)
    @font.draw_text(volume, x, y, 2)
  end

  def draw_velocity_btn
    draw_rect(@velocity_btn_x, @common_btn_y, @common_btn_size, @common_btn_size, @velocity_btn_color, z = 1, mode = :default)
    velocity = "velocity: #{(@velocity * 10).to_i}"
    x = (@velocity_btn_x + @common_btn_size / 2) - (@font.text_width(velocity) / 2)
    y = (@common_btn_y + @common_btn_size / 2) - (@font.height / 2)
    @font.draw_text(velocity, x, y, 2)
  end

  def draw_sound_btn
    color = @sound_on ? @sound_signal_btn_color_on : @sound_signal_btn_color_off
    draw_rect(@sound_btn_x, @sound_signal_btn_y, @sound_signal_btn_size, @sound_signal_btn_size, color, z = 1, mode = :default)
    text = 'sound'
    x = (@sound_btn_x + @sound_signal_btn_size / 2) - (@font.text_width(text) / 2)
    y = (@sound_signal_btn_y + @sound_signal_btn_size / 2) - (@font.height / 2)
    @font.draw_text(text, x, y, 2)
  end

  def draw_signal_btn
    color = @signal_on ? @sound_signal_btn_color_on : @sound_signal_btn_color_off
    draw_rect(@signal_btn_x, @sound_signal_btn_y, @sound_signal_btn_size, @sound_signal_btn_size, color, z = 1, mode = :default)
    text = 'signal'
    x = (@signal_btn_x + @sound_signal_btn_size / 2) - (@font.text_width(text) / 2)
    y = (@sound_signal_btn_y + @sound_signal_btn_size / 2) - (@font.height / 2)
    @font.draw_text(text, x, y, 2)
  end

  def check_buttons_clicks(mx, my)
    if (my > @common_btn_y) && (my < @common_btn_y + @common_btn_size)
      if (mx > @play_btn_x) && (mx < @play_btn_x + @common_btn_size)
        start_playing
        return
      end

      if (mx > @stop_btn_x) && (mx < @stop_btn_x + @common_btn_size)
        stop_playing
        return
      end

      if (mx > @volume_btn_x) && (mx < @volume_btn_x + @common_btn_size)
        change_volume
        return
      end

      if (mx > @velocity_btn_x) && (mx < @velocity_btn_x + @common_btn_size)
        change_velocity
        return
      end
    end
  end

  def check_sound_signal_btn_clicks(mx, my)
    if (my > @sound_signal_btn_y) && (my < @sound_signal_btn_y + @sound_signal_btn_size)
      if (mx > @sound_btn_x) && (mx < @sound_btn_x + @sound_signal_btn_size)
        change_sound
        return
      end

      if (mx > @signal_btn_x) && (mx < @signal_btn_x + @sound_signal_btn_size)
        change_signal
        return
      end
    end
  end
end
