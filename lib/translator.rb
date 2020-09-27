 # require modules here
require 'yaml'
require 'pry'

def load_library(file_path)                             # accepts one argument, the file path
  final_hash = {}
  YAML.load_file(file_path).each do |key, value|
    final_hash[key] = {}                                # each key points to an inner hash
    final_hash[key][:english] = value[0]                # the keys inside each inner hash are :english and :japanese
    final_hash[key][:japanese] = value[1]               # the :japanese key and :english key in each inner hash 
  end                                                   # points to the respective Japanese/English emoticon, respectively
  final_hash                                            # returns a hash
end

def get_english_meaning(file_path, emoticon)            # accepts two arguments, the YAML file path and the emoticon
  load_library(file_path).each do |key, value|          # calls on #load_library and gives it the argument of the file path
    if value[:japanese] == emoticon                     # returns the English meaning of the Japanese emoticon
      return key
    end
  end
  return "Sorry, that emoticon was not found"           # returns an apology message if the argument emoticon
end                                                     # is not a known

def get_japanese_emoticon(file_path, emoticon)          # accepts two arguments, the YAML file path and the emoticon
  load_library(file_path).each do |key, value|          # calls on #load_library and gives it the argument of the file path
    if value[:english] == emoticon                      # returns the Japanese equivalent of an English
      return value[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"           # returns an apology message if the argument is not known 
end

