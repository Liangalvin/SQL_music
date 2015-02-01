require 'active_record'

class Artists < ActiveRecord::Base
  def albums
    Albums.where({artist_id: self.id})
  end
end
