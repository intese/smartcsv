require 'csv'
require 'cmess/guess_encoding'
require "smartcsv/version"
require "smartcsv/parser"

module Smartcsv
  def self.read(file)
    Parser.read(file)
  end
end
