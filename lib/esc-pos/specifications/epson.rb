require_relative 'base'

module ESC_POS
  module Specifications

    class Epson < Base

      set :esc_code,            "\x1B"
      set :gs_code,             "\x1D"
      set :fs_code,             "\x1C"

      set :width,               42
      set :lines_to_cut_line,   7
      set :spaces_to_end_page,  0

      set :font_big,            0
      set :font_normal,         1

      set :color_black,         0
      set :color_red,           1

      set :align_left,          0
      set :align_center,        1
      set :align_right,         2

    end

  end
end