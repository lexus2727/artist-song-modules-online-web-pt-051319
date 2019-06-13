require 'pry'
require_relative './concerns/memorable.rb'

class Artist
  extend Memorable::ClassMethods
  extend Findable::ClassMethodsMethods
  include Memorable::InstanceMethods 
  include Paramable::InstanceMethods
  attr_accessor :name
  attr_reader :songs

  @@artists = []

  def initialize  
    super
    @songs = []
  end

  

  def self.all
    @@artists
  end

 
  def add_song(song)
    @songs << song
    song.artist = self unless song.artist
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

 
end
