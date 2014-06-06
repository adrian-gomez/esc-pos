require_relative '../epson'

module ESC_POS
  module Specifications
    class Epson

      class TM_U220 < Base

        set :width,               40
        set :spaces_to_end_page,  5

      end

    end
  end
end