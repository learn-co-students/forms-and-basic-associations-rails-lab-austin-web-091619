class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  def artist_name=(n)
    self.artist = Artist.find_or_create_by(name: n)
    
  end
  def artist_name
    self.artist ? self.artist.name : nil
  end
  def genre_name=(n)
    self.genre = Genre.find_or_create_by(name: n)
  end
  def genre_name
    self.genre ? self.genre.name : nil
  end
  def note_contents=(array_notes)
    array_notes.each do |n_content|
      if !n_content.empty?
        note = Note.find_or_create_by(content: n_content)
        self.notes << note
      end
    end
  end

  def note_contents
    self.notes.map do |n|
      n.content
    end
  end

  



end
