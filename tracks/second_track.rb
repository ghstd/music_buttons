module Second_track
  TITLE = 'He is a pirate'

  DURATION_1 = 240
  DURATION_2 = DURATION_1 / 2
  DURATION_4 = DURATION_1 / 4
  DURATION_6 = (DURATION_1 / 4) + (DURATION_1 / 8)
  DURATION_8 = DURATION_1 / 8

  def self.get_notes
    {
      piano: [
        Gosu::Sample.new("assets/sounds/pirates/piano/A1.mp3"),
        Gosu::Sample.new("assets/sounds/pirates/piano/C.mp3"),
        Gosu::Sample.new("assets/sounds/pirates/piano/D.mp3"),
        Gosu::Sample.new("assets/sounds/pirates/piano/E.mp3"),
        Gosu::Sample.new("assets/sounds/pirates/piano/F.mp3"),
        Gosu::Sample.new("assets/sounds/pirates/piano/G.mp3"),
        Gosu::Sample.new("assets/sounds/pirates/piano/A2.mp3"),
        Gosu::Sample.new("assets/sounds/pirates/piano/B2_bemol.mp3")
      ]
    }
  end

  def self.get_melody
    [
      {duration: DURATION_4, note: 2},
      {duration: DURATION_8, note: 2},
      {duration: DURATION_4, note: 2},
      {duration: DURATION_8, note: 2},
      {duration: DURATION_4, note: 2},
      {duration: DURATION_8, note: 2},
      {duration: DURATION_8, note: 2},
      {duration: DURATION_8, note: 2},
      {duration: DURATION_8, note: 2},
      {duration: DURATION_4, note: 2},
      {duration: DURATION_8, note: 2},
      {duration: DURATION_4, note: 2},
      {duration: DURATION_8, note: 2},
      {duration: DURATION_4, note: 2},
      {duration: DURATION_8, note: 2},
      {duration: DURATION_8, note: 2},
      {duration: DURATION_8, note: 2},
      {duration: DURATION_8, note: 2},
      {duration: DURATION_4, note: 2},
      {duration: DURATION_8, note: 2},
      {duration: DURATION_4, note: 2},
      {duration: DURATION_8, note: 2},
      {duration: DURATION_4, note: 2},
      {duration: DURATION_8, note: 2},
      {duration: DURATION_8, note: 2},

      {duration: DURATION_8, note: 0},
      {duration: DURATION_8, note: 1},
      {duration: DURATION_4, note: 2},
      {duration: DURATION_4, note: 2},
      {duration: DURATION_8, note: 2},
      {duration: DURATION_8, note: 3},
      {duration: DURATION_4, note: 4},
      {duration: DURATION_4, note: 4},
      {duration: DURATION_8, note: 4},
      {duration: DURATION_8, note: 5},
      {duration: DURATION_4, note: 3},
      {duration: DURATION_4, note: 3},
      {duration: DURATION_8, note: 2},
      {duration: DURATION_8, note: 1},
      {duration: DURATION_8, note: 1},
      {duration: DURATION_6, note: 2},

      {duration: DURATION_8, note: 0},
      {duration: DURATION_8, note: 1},
      {duration: DURATION_4, note: 2},
      {duration: DURATION_4, note: 2},
      {duration: DURATION_8, note: 2},
      {duration: DURATION_8, note: 3},
      {duration: DURATION_4, note: 4},
      {duration: DURATION_4, note: 4},
      {duration: DURATION_8, note: 4},
      {duration: DURATION_8, note: 5},
      {duration: DURATION_4, note: 3},
      {duration: DURATION_4, note: 3},
      {duration: DURATION_8, note: 2},
      {duration: DURATION_8, note: 1},
      {duration: DURATION_2, note: 2},

      {duration: DURATION_8, note: 0},
      {duration: DURATION_8, note: 1},
      {duration: DURATION_4, note: 2},
      {duration: DURATION_4, note: 2},
      {duration: DURATION_8, note: 2},
      {duration: DURATION_8, note: 4},
      {duration: DURATION_4, note: 5},
      {duration: DURATION_4, note: 5},
      {duration: DURATION_8, note: 5},
      {duration: DURATION_8, note: 6},
      {duration: DURATION_4, note: 7},
      {duration: DURATION_4, note: 7},
      {duration: DURATION_8, note: 6},
      {duration: DURATION_8, note: 5},
      {duration: DURATION_8, note: 6},
      {duration: DURATION_6, note: 2},

      {duration: DURATION_8, note: 2},
      {duration: DURATION_8, note: 3},
      {duration: DURATION_4, note: 4},
      {duration: DURATION_4, note: 4},
      {duration: DURATION_4, note: 5},
      {duration: DURATION_8, note: 6},
      {duration: DURATION_6, note: 2},
      {duration: DURATION_8, note: 2},
      {duration: DURATION_8, note: 4},
      {duration: DURATION_4, note: 3},
      {duration: DURATION_4, note: 3},
      {duration: DURATION_8, note: 4},
      {duration: DURATION_8, note: 2},
      {duration: DURATION_2, note: 3},
    ]
  end

end
