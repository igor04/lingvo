require 'nokogiri'

module Lingvo
  module Parsers
    class Lingualeo
      def initialize(path, &block)
        resource = Nokogiri::HTML File.open(path)
        resource.xpath('//body/table/tbody/tr').each do |tr|
          tds = tr.css('td')

          next if tds[0].nil?

          eng     = tds[1].content.strip
          transcr = tds[2].content.strip
          ru      = tds[3].content.strip

          if eng.size < 20 && transcr.size < 20 && ru.size < 20
            block.call eng: eng, transcr: transcr, ru: ru
          end
        end
      end
    end
  end
end
