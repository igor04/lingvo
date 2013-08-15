# create config directory
base_dir = File.join Dir.home, '.lingvo'
unless File.exists? base_dir
  Dir.mkdir base_dir, 0700
end


require "lingvo/version"

require 'lingvo/db/connection'
require 'lingvo/models/english'
# word = EnglishWord.create(title: 'world', transcription: '[]')

require 'lingvo/parsers/lingvo_leo_parser'



# require 'Qt4'
# 
# module Lingvo
#   class Area < Qt::Widget
#     slots :close
# 
#     def initialize(parent = nil)
#       super
#       setFixedSize(200, 120)
# 
#       Qt::Shortcut.new(
#         Qt::KeySequence.new(Qt::Key_Q.to_i),
#         self,
#         SLOT(:close)
#       )
# 
#       Qt::Label.new('x', self).show()
# 
#       show
#       move(1000,10)
#     end
# 
#     def close()
#       Simple.app.quit
#     end
#   end
# 
#   class Simple
#     class << self
#       attr_accessor :app
# 
#       def run
#         @app = Qt::Application.new(ARGV)
# 
#         Area.new
# 
#         @app.exec()
#       end
#     end
#   end
# end
