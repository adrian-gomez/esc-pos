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
        raise NoMethodError, 'This is just a base class, use it to create your own custom specifications.'
      end

      def text(txt, options = {})
        font_size = options.fetch(:font_size, :font_normal)
        font_color = options.fetch(:font_color, :color_black)

        formatted_text = ''
        formatted_text << set_font_size(font_size)
        formatted_text << set_alignment(options[:align_type]) if options[:align_type]
        formatted_text << set_font_color(font_color)
        formatted_text << txt if txt
      end

      def reset_printer
        "#{get_value(:esc_code)}@"
      end

      def feed_lines(lines)
        return '' if lines == 1

        "#{get_value(:esc_code)}\x64" << (lines - 1).chr
      end

      def render(options = {})
        template_filename = options.fetch(:template, self.class.to_s.gsub(/Report/, '').underscore)

        template = File.read(File.join(Settings.templates_path, "#{template_filename}.esc_pos.erb"))
        erb = ERB.new(template, 0)
        erb.result(binding)
      end

      def set_font_size(size)
        "#{get_value(:esc_code)}M#{get_value(size)}"
      end

      def set_alignment(alignment)
        "#{get_value(:esc_code)}a#{get_value(alignment)}"
      end

      def set_font_color(color)
        "#{get_value(:esc_code)}r#{get_value(color)}"
      end

      def split_line(char = '-')
        text(char * get_value(:width), :font_size => :font_normal)
      end

      def end_page(spaces_after = 0)
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

    end

  end
end