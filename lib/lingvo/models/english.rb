module Lingvo
  module Models
    class English < ActiveRecord::Base
      self.table_name = 'english'

      validates :eng, :ru, presence: true, uniqueness: true

      scope :rand, -> (count) { order("RANDOM()").limit(count) }
    end
  end
end
