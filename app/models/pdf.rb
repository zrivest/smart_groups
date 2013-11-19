require 'open-uri'

class Pdf

  def self.import(file, course)
    reader = PDF::Reader.new(file.tempfile)

  end

end
