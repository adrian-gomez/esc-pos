esc-pos
==============
Simple esc-pos template compiler.

Installing
==============
Add this to your Gemfile:
```ruby
gem 'esc-pos'
```

Usage
==============
```ruby
specification = ESC_POS::Specifications::Epson::TM_U220.new
specification.render(template: 'payment_ticket')
```

Templates
==============

Encoding
==============
All the specifications that inherit from ESC_POS::Specifications::Epson use cp437 to encode the text
you can change this:
```ruby
class PrinterTestPage < ESC_POS::Specifications::Epson::TM_U220
  set :special_encoding, 'utf-8'
end
```
or disable re-encoding:
```ruby
class PrinterTestPage < ESC_POS::Specifications::Epson::TM_U220
  set :special_encoding, nil
end
```

Note: usage of this encoding was needed to print spanish character, ex: á, ñ, etc.

Contributing
==============

- Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
- Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
- Fork the project.
- Start a feature/bugfix branch.
- Commit and push until you are happy with your contribution.
- Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
- Please try not to mess with the version, or history. If you want to have your own version, or is
  otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
==============

Copyright © 2014 Adrian Gomez. See LICENSE.txt for further details.