require 'Qt4'

module Lingvo
  module GUI
    class Widget < Qt::Widget
      slots :close, :update

      def initialize(parent = nil)
        super
        @conf = Config.gui
        @conf[:size_for_image] = 0

        setStyleSheet("* { background: #{@conf[:bg]}; margin: #{@conf[:margin]}px }");
        Qt::Shortcut.new Qt::KeySequence.new(Qt::Key_Q.to_i), self, SLOT(:close)
        Qt::Shortcut.new Qt::KeySequence.new(Qt::Key_N.to_i), self, SLOT(:update)

        if @conf[:image].present?
          pixmap = Qt::Pixmap.new(@conf[:image]).scaled(@conf[:image_size_y], @conf[:image_size_x])
          Qt::Label.new('',self).setPixmap pixmap
          @conf[:size_for_image] = @conf[:image_size_y] + 5 # with left space
        end

        @label = Qt::Label.new('', self)

        show
        update
      end

      def word
        word = Lingvo::Models::English.rand(1).first
        Console.no_word if word.nil?
        label = "<div style='font-size: #{@conf[:eng_size]}px; color: #{@conf[:eng_fg]}'>#{word.eng}</div>"
        label += "<div style='font-size: #{@conf[:transcr_size]}px; color: #{@conf[:transcr_fg]};'>#{word.transcr}</div>" if @conf[:transcr] == 'on'
        label += "<div style='font-size: #{@conf[:ru_size]}px; color: #{@conf[:ru_fg]}'>#{word.ru}</div>"
      end

      def update_word
        @label.setText(word)
        @label.setGeometry(@conf[:size_for_image], 0, @label.sizeHint.width, @label.sizeHint.height)
        setFixedSize(@label.sizeHint.width + @conf[:size_for_image], @label.sizeHint.height)
      end

      def update_position
        screen_w = Qt::Application::desktop.width.to_i
        screen_w -= 10                    # left space
        screen_w -= @label.sizeHint.width # base label
        screen_w -= @conf[:size_for_image]# image space

        move(screen_w, 20)
      end

      def update
        update_word
        update_position
      end

      def close
        Simple.app.quit
      end
    end

    class Simple
      class << self
        attr_accessor :app

        def run
          @app = Qt::Application.new ARGV
          Widget.new
          @app.exec
        end
      end
    end
  end
end
