module Lingvo
  module Console
    HELP = """
Lingvo #{VERSION}

Options:
  --parse file  - parse lingovleo HTML file with words
  --rand count  - show 'n' random records
  --nitify      - send show word - translation with your notification
  --gui         - show words in simpe window
                  key:  n - show next word
                        q - close window

  --size        - show words count
  -h            - show this help

"""

    class << self
      def which(cmd)
        exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
        ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
          exts.each do |ext|
            exe = File.join(path, "#{cmd}#{ext}")
            return exe if File.executable? exe
          end
        end
        nil
      end

      def no_word
        puts "You don't have any words"
        exit
      end
    end

    class Command
      class << self
        def parse(path)
          if File.exists? path
            parser = Parsers::Lingualeo.new path
            Models::English.create parser.words
            size
          else
            puts "File not found!"
            help
          end
        end

        def rand(count)
          count = (count || 1).to_i

          words = Models::English.rand count
          words.each do |word|
            puts "#{word.eng} - #{word.transcr} - #{word.ru}"
          end
        end

        def size
          puts "You have #{Models::English.count} words"
        end

        def notify
          GUI::Notify.run
        end

        def gui
          GUI::Simple.run
        end

        def help
          puts HELP
        end
      end
    end
  end
end
