class Photo < ActiveRecord::Base
  belongs_to :user
  attr_accessible :url, :user_id , :id
  validates :url , presence: true
  
  def saving(upload)
    directory = "public/data"
    # create the file path
    if upload['url'].nil? == true
      self.url = nil
      return nil
    end  
    self.url = upload['url'].original_filename
    unless upload['url'] and upload['url'].content_type =~ /^image\/(jpeg|pjpeg|gif|png|bmp)$/
      self.url = nil
      return nil
    end
    path =  File.join(directory, self.user_id.to_s+"_te.jpeg") 
    File.open(path, "wb") { |f| f.write(upload['url'].read) }
    return path
 end
end
