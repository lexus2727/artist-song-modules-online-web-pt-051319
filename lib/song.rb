require 'pry'
require_relative './concerns/memorable.rb'

class Song
  extend Memorable::ClassMethods
  extend Findable::InstanceMethods
  include Memorable::InstanceMethods
  include Paramable::InstanceMethods
  
  attr_accessor :name
  attr_reader :artist

  @@songs = []

 def self.all
    @@songs
  end

 
  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless
    artist.songs.include(self)
  end

 
end
