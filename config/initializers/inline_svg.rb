# frozen_string_literal: true

# Raises exception if icon file does not exists
InlineSvg.configure do |config|
  config.raise_on_file_not_found = true
end
