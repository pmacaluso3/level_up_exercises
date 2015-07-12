require 'pry'
require 'csv'
require 'json'
require_relative 'dinosaur.rb'
require_relative 'dinoparser.rb'
require_relative 'dinocontroller.rb'
require_relative 'dinoviewer.rb'

@messages = ""
@dinodex = DinoParser.new(['./dinodex.csv', './african_dinosaur_export.csv'])
@dinodex.load_dinosaurs
view_home
