require 'pry'

class Song
  
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    self.save
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create 
    Song.new
  end

  def self.new_by_name(song)
    t = self.create
    t.name = song
    t
  end

  def self.create_by_name(song)
    self.new_by_name(song)
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
      if self.find_by_name(song_name) == nil
        then self.create_by_name(song_name)
      else self.find_by_name(song_name)
      end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    arr1 = filename.split(' - ')
    art = arr1[0]
    arr2 = arr1[1].split('.')
    name = arr2[0]
    song = self.create_by_name(name)
    song.artist_name = art
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

end
