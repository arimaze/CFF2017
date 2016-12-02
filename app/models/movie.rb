class Movie < ActiveRecord::Base
def initialize(params = {})
  file = params.delete(:file)
  super
  if file
    self.filename = sanitize_filename(file.original_filename)
    self.content_type = file.content_type
    self.binary_data = file.read
  end
end
def update(params = {})
  file = params.delete(:file)
  if file
    self.filename = sanitize_filename(file.original_filename)
    self.content_type = file.content_type
    self.binary_data = file.read
  end
  super
end
private
  def sanitize_filename(filename)
    # Get only the filename, not the whole path (for IE)
    # Thanks to this article I just found for the tip: http://mattberther.com/2007/10/19/uploading-files-to-a-database-using-rails
    return File.basename(filename)
  end
end