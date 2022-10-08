# frozen_string_literal: true

require_relative '../lib/exchange'
require 'webmock/rspec'

RSpec.configure do |config|
  config.define_derived_metadata(file_path: /exchange\/utils/) do |meta|
    meta[:fast] = true
  end

  config.filter_run_excluding :fast if RUBY_PLATFORM.match?(/asdf/)
end
