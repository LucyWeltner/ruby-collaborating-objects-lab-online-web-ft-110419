class MP3Importer 
  attr_accessor :path
  attr_reader :files
  def initialize(file_path)
    @path = file_path
  end
  def files 
    data = Dir.entries(@path).select {|f| !File.directory? f}
    data = data.select{|file1| file1.to_s[-4..-1] == ".mp3"}
    data.flatten!
    data
  end
  def import
    files.each do |song|
      Song.new_by_filename(song)
    end
  end
end