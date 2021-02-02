require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create 
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new 
    song.name = song_name 
    song 
  end

  def self.create_by_name(song_name)
    song = self.new 
    song.name = song_name 
    @@all << song 
    song
  end

  def self.find_by_name(song_name)
    @@all.find{|object| object.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)==nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(song_file)
    split = song_file.split(" - ")
    artist_name = split[0]
    song_mp3 = split[1]
    song_name = song_mp3.delete_suffix(".mp3")
    song = self.new 
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(song_file)
    split = song_file.split(" - ")
    artist_name = split[0]
    song_mp3 = split[1]
    song_name = song_mp3.delete_suffix(".mp3")
    song = self.new 
    song.name = song_name
    song.artist_name = artist_name
    @@all << song 
    song
  end

  def self.destroy_all
    @@all = []
  end

end
