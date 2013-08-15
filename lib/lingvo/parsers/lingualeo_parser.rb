require 'nokogiri'

module Lingvo
  module Parsers
    class Lingualeo
      attr_reader :words

      def initialize(path)
        @words = []
        resource = Nokogiri::HTML(File.open(path))
        resource.xpath('//body/table/tbody/tr').each do |tr|
          tds = tr.css('td')

          next if tds[0].nil?
          @words << {
            eng: tds[1].content.strip,
            transcr: tds[2].content.strip,
            ru: tds[3].content.strip,
          }
        end
      end
    end
  end
end
