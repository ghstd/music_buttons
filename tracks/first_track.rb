module First_track
  TITLE = 'Take on me'

  DURATION_1 = 240
  DURATION_2 = DURATION_1 / 2
  DURATION_4 = DURATION_1 / 4
  DURATION_8 = DURATION_1 / 8

  def self.get_notes
    {
      piano: [
        Gosu::Sample.new("assets/sounds/aha/piano/piano_B1.mp3"),
        Gosu::Sample.new("assets/sounds/aha/piano/piano_D.mp3"),
        Gosu::Sample.new("assets/sounds/aha/piano/piano_E.mp3"),
        Gosu::Sample.new("assets/sounds/aha/piano/piano_F#.mp3"),
        Gosu::Sample.new("assets/sounds/aha/piano/piano_G#.mp3"),
        Gosu::Sample.new("assets/sounds/aha/piano/piano_A.mp3"),
        Gosu::Sample.new("assets/sounds/aha/piano/piano_B2.mp3")
      ],
      guitar: [
        Gosu::Sample.new("assets/sounds/aha/guitar/guitar_B1.mp3"),
        Gosu::Sample.new("assets/sounds/aha/guitar/guitar_D.mp3"),
        Gosu::Sample.new("assets/sounds/aha/guitar/guitar_E.mp3"),
        Gosu::Sample.new("assets/sounds/aha/guitar/guitar_F#.mp3"),
        Gosu::Sample.new("assets/sounds/aha/guitar/guitar_G#.mp3"),
        Gosu::Sample.new("assets/sounds/aha/guitar/guitar_A.mp3"),
        Gosu::Sample.new("assets/sounds/aha/guitar/guitar_B2.mp3")
      ],
      clarinet: [
        Gosu::Sample.new("assets/sounds/aha/clarinet/clarinet_B1.mp3"),
        Gosu::Sample.new("assets/sounds/aha/clarinet/clarinet_D.mp3"),
        Gosu::Sample.new("assets/sounds/aha/clarinet/clarinet_E.mp3"),
        Gosu::Sample.new("assets/sounds/aha/clarinet/clarinet_F#.mp3"),
        Gosu::Sample.new("assets/sounds/aha/clarinet/clarinet_G#.mp3"),
        Gosu::Sample.new("assets/sounds/aha/clarinet/clarinet_A.mp3"),
        Gosu::Sample.new("assets/sounds/aha/clarinet/clarinet_B2.mp3")
      ]
    }
  end

  def self.get_melody
    [
      {duration: DURATION_8, note: 3},
      {duration: DURATION_8, note: 3},
      {duration: DURATION_8, note: 1},
      {duration: DURATION_4, note: 0},
      {duration: DURATION_4, note: 0},
      {duration: DURATION_4, note: 2},
      {duration: DURATION_4, note: 2},
      {duration: DURATION_8, note: 2},
      {duration: DURATION_8, note: 4},
      {duration: DURATION_8, note: 4},
      {duration: DURATION_8, note: 5},
      {duration: DURATION_8, note: 6},
      {duration: DURATION_8, note: 5},
      {duration: DURATION_8, note: 5},
      {duration: DURATION_8, note: 5},
      {duration: DURATION_4, note: 2},
      {duration: DURATION_4, note: 1},
      {duration: DURATION_4, note: 3},
      {duration: DURATION_4, note: 3},
      {duration: DURATION_8, note: 3},
      {duration: DURATION_8, note: 2},
      {duration: DURATION_8, note: 2},
      {duration: DURATION_8, note: 3},
      {duration: DURATION_8, note: 2},
    ]
  end

end
