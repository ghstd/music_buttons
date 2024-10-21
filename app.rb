require 'gosu'
require_relative 'tracks/first_track'
require_relative 'tracks/second_track'
require_relative 'music_player'
require_relative 'control_buttons'
require_relative 'piano_buttons'
require_relative 'tracks_and_instruments_buttons'

class App < Gosu::Window
  include Music_player
  include Control_buttons
  include Piano_buttons
  include Tracks_and_instruments_buttons

  def initialize
    super 800, 800
    self.caption = "Music Game"

    @background_image = Gosu::Image.new("assets/images/music_background.jpg", :tileable => true)
    @font = Gosu::Font.new(30, retro: true)

    @tracks = [First_track, Second_track]
    @active_track = 0
    @melody = @tracks[@active_track].get_melody

    @instruments = @tracks[@active_track].get_notes.keys
    @active_instrument = 0
    @notes = @tracks[@active_track].get_notes[@instruments[@active_instrument]]

    @start_time = 60
    @velocity = 1.8
    @volume = 0.1

    @time = 0
    @can_play = false

    @sound_on = true
    @signal_on = true

    init_buttons_coords
    init_piano_buttons_coords
    init_tracks_and_instruments_buttons_coords
  end

  def draw_background_image
    scale_x = width.to_f / @background_image.width.to_f
    scale_y = height.to_f / @background_image.height.to_f
    @background_image.draw(0, 0, 0, scale_x, scale_y, Gosu::Color.argb(0x50_ffffff))
  end

  def button_up(id)
    if id == Gosu::MS_LEFT
      @button_down = false
    end

    @notes.each_with_index do |_, index|
      button = Gosu.const_get("KB_#{index + 1}")
      if id == button
        @button_down = false
      end
    end
  end

  def change_volume
    result = (@volume + 0.1).floor(1)
    if result > 0.5
      @volume = 0.1
    else
      @volume = result
    end
  end

  def change_velocity
    stop_playing

    result = (@velocity + 0.1).floor(1)
    if result > 3
      @velocity = 1
    else
      @velocity = result
    end
  end

  def change_sound
    stop_playing

    @sound_on = !@sound_on
  end

  def change_signal
    stop_playing

    @signal_on = !@signal_on
  end

  def update
  end

  def draw
    play_song(@velocity, sound: @sound_on, signal: @signal_on) if @can_play
    draw_background_image
    draw_play_btn
    draw_stop_btn
    draw_volume_btn
    draw_velocity_btn
    draw_sound_btn
    draw_signal_btn
    draw_piano_buttons
    draw_instruments_buttons
    draw_track_buttons

    if (Gosu.button_down? Gosu::MS_LEFT) && !@button_down
      @button_down = true

      check_buttons_clicks(mouse_x, mouse_y)
      check_sound_signal_btn_clicks(mouse_x, mouse_y)
      check_piano_buttons_clicks(mouse_x, mouse_y)
      check_instruments_buttons_clicks(mouse_x, mouse_y)
      check_track_buttons_clicks(mouse_x, mouse_y)
    end

    @notes.each_with_index do |_, index|
      button = Gosu.const_get("KB_#{index + 1}")
      if (Gosu.button_down? button) && !@button_down
        @button_down = true
        @active_index = index
        @active_index_timer = Gosu.milliseconds
        @notes[index].play(@volume)
      end
    end
  end
end

App.new.show
