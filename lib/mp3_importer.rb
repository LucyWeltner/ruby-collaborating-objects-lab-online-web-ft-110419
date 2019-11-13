class MP3Importer 
  attr_accessor :path
  attr_reader :files
  def initialize(file_path)
    @path = file_path
  end
  def files 
    @files = Dir.entries(@path).select {|f| !File.directory? f}
    @files = @files.select{|file1| file1.to_s[-4..-1] == ".mp3"}
    @files = mp3s.flatten
  end
  def import 
    @files.each do |song|
      Song.new_by_filename(song)
    end
  end
end