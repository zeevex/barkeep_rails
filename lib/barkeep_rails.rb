require "barkeep_rails/version"
require 'active_support/core_ext'

module BarkeepRails
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

    unless %w{c39 c128a c128b c128c i2of5}.include?(type.to_s)
      raise ArgumentError, "Cannot generate barcodes for type #{type}"
    end

    unless %w{gif png jpg}.include?(imagetype.to_s)
      raise ArgumentError, "Cannot generate barcodes for image type #{imagetype}"
    end

    raise ArgumentError, "Must provide value" unless value && !value.to_s.empty?

    url = (secure ? "https" : "http") +
        "://barcodes4.me/barcode/#{type}/#{value}.#{imagetype}"

    unless options.empty?
      url = url + "?" + options.to_query
    end

    url
  end
end
