# coding: utf-8
require File.join(File.dirname(__FILE__), *%w[.. lib barkeep_rails])
require File.join(File.dirname(__FILE__), *%w[.. lib barkeep_rails barcode_helper])
ActionView::Base.send :include, Barkeep::BarcodeHelper

