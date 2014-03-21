module Lingvo
  module GUI
    class Notify
      class << self
        def show(eng, ru)
          conf = Config.notify

          first = conf[:prefix] + (conf[:first] == 'eng' ? eng : ru)
          second = conf[:separate] + (conf[:first] == 'eng' ? ru : eng) + conf[:sufix]

          if Console.which('twmnc')
            command = 'twmnc'
            command += " -t '#{first}'"
            command += " -c '#{second}'"
            command += " --bg '#{conf[:twmnc_bg]}'"
            command += " --fg '#{conf[:twmnc_fg]}'"
            command += " -i '#{conf[:image]}'"
            command += " -d #{conf[:timeout].to_i}"

          elsif Console.which('notify-send')
            command = 'notify-send -u normal'
            command += " -t #{conf[:timeout].to_i}"
            command += " -i '#{conf[:image]}'"
            command += " '#{first}#{second}'"

          else
            puts 'Please install notify-send or twmn(twmnc) notification system'
            exit
          end

          system command
        end

        def run
          word = Lingvo::Models::English.rand(1).first
          Console.no_word if word.nil?
          show word.eng, word.ru
        end
      end
    end
  end
end
