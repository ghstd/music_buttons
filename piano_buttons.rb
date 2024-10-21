module Piano_buttons
  def init_piano_buttons_coords
    @piano_buttons_start_x = 30
    @piano_buttons_start_y = height / 10 * 7
    @piano_buttons_offset = ((width - (2 * @piano_buttons_start_x)) / @notes.size) / 10
    @piano_buttons_size = ((width - (2 * @piano_buttons_start_x)) / @notes.size) - @piano_buttons_offset
    @piano_buttons_color = Gosu::Color.argb(0xff_00ffff)
    @piano_buttons_color_active = Gosu::Color.argb(0xff_000000)
    @signal_rect_start_y = @piano_buttons_start_y - @piano_buttons_size - 30
    @active_index = nil
    @active_index_timer = nil
    @active_index_timer_interval = 100
  end

  def draw_piano_buttons
    @notes.each_with_index do |note, index|
      x = @piano_buttons_start_x + (@piano_buttons_size + @piano_buttons_offset) * index
      color = index == @active_index ? @piano_buttons_color_active : @piano_buttons_color
      draw_rect(x, @piano_buttons_start_y, @piano_buttons_size, @piano_buttons_size, color, z = 1, mode = :default)

      text = (index + 1).to_s
      text_x = (x + @piano_buttons_size / 2) - (@font.text_width(text) / 2)
      text_y = (@piano_buttons_start_y + @piano_buttons_size / 2) - (@font.height / 2)
      @font.draw_text(text, text_x, text_y, 2)
    end

    if @active_index_timer && (Gosu.milliseconds - @active_index_timer) > @active_index_timer_interval
      @active_index = nil
      @active_index_timer = nil
    end
  end

  def check_piano_buttons_clicks(mx, my)
    if (my > @piano_buttons_start_y) && (my < @piano_buttons_start_y + @piano_buttons_size)
      index = ((mx - @piano_buttons_start_x) / (@piano_buttons_size + @piano_buttons_offset)).to_i
      @active_index = index
      @active_index_timer = Gosu.milliseconds
      @notes[index].play(@volume)
    end
  end
end
