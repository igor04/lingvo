module Lingvo
  module Console
    HELP = """
Lingvo #{VERSION}

Options:
  --parse file  - parse lingvoleo HTML file with words
  --rand count  - show 'n' random records
  --notify      - show `word - translation` with your notification
  --gui         - show words in simpe window
                  key:  n - show next word
                        q - close window

  --wc f1 [f2]  - parse text file(f1), and write statistic to file(f2)
                  or show in console if file(f2) isn't specify

  --size        - show words count
  -v            - show version
  -h            - show this help

Description:

  ○ Load words from lingualeo.ru and train with lingvo
    · go to lingualeo site
    · select words which you want
    · go to print page and save it (like: print.html)

    · $ lingvo --parse print.html
    · Well Done!!! Now You have all words in lingvo ;)

  ○ Parse document and build statistics
    · save your text like english.txt file

    · $ lingvo --wc english.txt
    · show your statistic immediatly in console

    · $ lingvo --wc english.txt statistics.txt
    · open statistics.txt and see your words amount

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
        Command.words_not_found
        exit
      end
    end

    class Command
      class << self
        def parse(path)
          return file_not_found unless File.exists? path
          Parsers::Lingualeo.new(path) { |word| Models::English.create word }
          size
        end

        def words_counter(from, to)
          return file_not_found unless File.exists? from
          Parsers::WordsCounter.new from, to
        end

        def rand(count)
          return words_not_found unless Models::English.any?
          Models::English.rand((count || 1).to_i).each do |word|
            printf "%-20s  %-20s  %s\n", word.eng, word.transcr, word.ru
          end
        end

        def size
          puts "\nYou have #{Models::English.count} words"
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

        def version
          puts "\n#{VERSION}"
        end

        def file_not_found
          puts "\nFile not found!"
        end

        def words_not_found
          puts "\nYou don't have any words"
        end
      end
    end
  end
end
