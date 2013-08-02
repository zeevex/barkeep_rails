require "barkeep_rails/version"
require 'active_support/core_ext'

module BarkeepRails
  mattr_accessor :default_provider
  #
  # See http://www.barcodes4.me/apidocumentation
  #
  # There is one additional parameter not documented there:
  #   :secure => <Boolean> - If true, generate a HTTPS URL
  #
  def self.barcode_image_url(options)
    type      = options.delete(:type)
    value     = options.delete(:value)
    imagetype = options.delete(:imagetype) || "png"
    secure    = options.delete(:secure)    || false

    unless %w{c39 c128 c128a c128b c128c i2of5 qr ean8 ean13 upca upce}.include?(type.to_s)
      raise ArgumentError, "Cannot generate barcodes for type #{type}"
    end

    unless %w{gif png jpg}.include?(imagetype.to_s)
      raise ArgumentError, "Cannot generate barcodes for image type #{imagetype}"
    end

    raise ArgumentError, "Must provide value" unless value && !value.to_s.empty?

    provider = options.delete(:provider) || self.default_provider

    case provider.to_sym
      when :barcodes4me
        url = (secure ? "https" : "http") +
          "://barcodes4.me/barcode/#{type}/#{value}.#{imagetype}"
      when :barkeep
        url = (secure ? "https" : "http") +
          "://barkeep.zeevex.net/barcode/#{value}.#{imagetype}"
        # barkeep expects type as a query arg so put it back in the hash
        options[:type] = type
      else
        raise ArgumentError, "Unknown provider #{provider}"
    end

    unless options.empty?
      url = url + "?" + options.to_query
    end

    url
  end
end

BarkeepRails.default_provider = :barkeep

if defined?(Rails)
  require File.join(File.dirname(__FILE__), *%w[barkeep_rails barcode_helper])
  ActionView::Base.send :include, BarkeepRails::BarcodeHelper
end
