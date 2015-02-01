require 'active_record'

class Albums < ActiveRecord::Base
  def songs
    Songs.where({album_id: self.id })
  end
  def artists
    Artists.find({id: self.id})
  end
end
