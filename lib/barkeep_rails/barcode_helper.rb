# coding: utf-8
require 'barkeep_rails'

module Barkeep
  module BarcodeHelper

    #
    # See http://www.barcodes4.me/apidocumentation
    #
    def barcode_image_url(options)
      BarkeepRails.barcode_image_url options
    end

    def barcode_image_tag(barcode_options, tag_options = {})
      image_tag barcode_image_url(barcode_options), tag_options
    end

  end
end
