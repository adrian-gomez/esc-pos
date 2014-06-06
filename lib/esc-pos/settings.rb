module ESC_POS
  module Settings

    def self.add_option(name, default_value)
      define_singleton_method(name) do
        instance_variable_get("@#{name}") || default_value
      end

      define_singleton_method("#{name}=") do |value|
        instance_variable_set("@#{name}", value)
      end
    end

    add_option(:templates_path, 'views/esc_pos')

  end
end