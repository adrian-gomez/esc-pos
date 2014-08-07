require 'erb'

module ESC_POS
  module Specifications
    class Base

      def self.specifications
        @@specifications ||= {}
      end

      def self.set(name, value)
        specifications[name] = value
      end

      def initialize
        raise NoMethodError, 'This is just a base class, use it to create custom specifications.'
      end

      def text(txt, options = {})
        font = options.fetch(:font, :font_b)
        color = options.fetch(:color, :color_black)

        formatted_text = ''
        formatted_text << set_font(font)
        formatted_text << set_alignment(options[:align_type]) if options[:align_type]
        formatted_text << set_color(color)

        if txt
          formatted_text << re_encode_text(txt)
        end

        formatted_text
      end

      def reset_printer
        "#{get_value(:esc_code)}#{get_value(:reset_printer_code)}"
      end

      def feed_lines(lines)
        return '' if lines == 1

        "#{get_value(:esc_code)}\x64" << (lines - 1).chr
      end

      def render(options = {})
        template_filename = options.fetch(:template, self.class.to_s.underscore)

        template = File.read(File.join(Settings.templates_path, "#{template_filename}.esc_pos.erb"))
        erb = ERB.new(template, 0, '%<>-')
        erb.result(binding)
      end

      def set_font(font)
        "#{get_value(:esc_code)}#{get_value(:font_selector_code)}#{get_value(font)}"
      end

      def set_alignment(alignment)
        "#{get_value(:esc_code)}#{get_value(:alignment_selector_code)}#{get_value(alignment)}"
      end

      def set_color(color)
        "#{get_value(:esc_code)}#{get_value(:color_selector_code)}#{get_value(color)}"
      end

      def set_international_character_set(character_set)
        "#{get_value(:esc_code)}#{get_value(:international_character_selector_code)}#{get_value(character_set).chr}"
      end

      def set_character_code_table(character_code)
        "#{get_value(:esc_code)}#{get_value(:character_table_selector_code)}#{get_value(character_code).chr}"
      end

      def split_line(char = '-')
        text(char * get_value(:width), :font => :font_b)
      end

      def go_to_cut
        feed_lines(get_value(:lines_to_cut_line))
      end

      def go_to_cut_and_cut(spaces_after = 0)
        "#{get_value(:gs_code)}V#{65.chr}#{spaces_after}\r"
      end

      def cut_paper(partial_cut = false)
        if partial_cut
          "#{get_value(:esc_code)}m"
        else
          "#{get_value(:esc_code)}i"
        end
      end

      def get_value(key)
        self.class.specifications[key]
      end

      def re_encode_text(txt)
        return txt unless get_value(:special_encoding)

        txt.encode(get_value(:special_encoding))
      rescue Encoding::UndefinedConversionError
        txt.force_encoding(get_value(:special_encoding))
      end

    end
  end
end
