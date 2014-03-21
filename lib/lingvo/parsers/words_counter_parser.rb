module Lingvo
  module Parsers
    class WordsCounter
      def initialize(from, to=nil)
        @words = read from

        if to
          write to
        else
          show
        end
      end

      def count
        counter = {}
        @words.each { |word| counter[word] = counter[word].to_i + 1 }
        counter.sort_by { |word, count| count }.reverse
      end

      def show
        count.each { |data| puts "#{data[1]} : #{data[0]}" }
      end

      def read from
        file = File.open(from).read
        file.downcase.scan(/([a-z']+)/).flatten
      end

      def write(to)
        File.open to, 'w' do |file|
          count.each { |data| file.write "#{data[1]} : #{data[0]}\n" }
        end
      end
    end
  end
end
