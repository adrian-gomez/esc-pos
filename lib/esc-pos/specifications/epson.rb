require_relative 'base'

module ESC_POS
  module Specifications

    class Epson < Base

      set :special_encoding,                      'cp437'

      set :esc_code,                              "\x1B"
      set :gs_code,                               "\x1D"
      set :fs_code,                               "\x1C"

      set :reset_printer_code,                    '@'
      set :font_selector_code,                    'M'
      set :alignment_selector_code,               'a'
      set :color_selector_code,                   'r'
      set :international_character_selector_code, 'R'
      set :character_table_selector_code,         't'

      set :width,                                 42
      set :lines_to_cut_line,                     7
      set :spaces_to_end_page,                    0

      set :font_a,                                0
      set :font_b,                                1

      set :color_black,                           0
      set :color_red,                             1

      set :align_left,                            0
      set :align_center,                          1
      set :align_right,                           2

      set :usa_character_set,                     0
      set :france_character_set,                  1
      set :germany_character_set,                 2
      set :uk_character_set,                      3
      set :denmark_character_set,                 4
      set :sweden_character_set,                  5
      set :italy_character_set,                   6
      set :spain_character_set,                   7
      set :japan_character_set,                   8
      set :norway_character_set,                  9

      set :usa_character_table,                   0
      set :katana_character_table,                1
      set :multilingual_character_table,          2
      set :portuguese_character_table,            3
      set :french_character_table,                4
      set :nordic_character_table,                5
      set :cyrillic_character_table,              17
      set :latin_character_table,                 18
      set :euro_character_table,                  19

    end

  end
end