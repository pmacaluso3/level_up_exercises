require 'pry'
require 'csv'
require 'json'
require_relative 'dinosaur.rb'
require_relative 'dinoparser.rb'


@dinodex = DinoParser.new(['./dinodex.csv', './african_dinosaur_export.csv'])
@dinodex.load_dinosaurs
