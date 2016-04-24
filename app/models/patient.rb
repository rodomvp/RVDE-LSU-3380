class Patient < ActiveRecord::Base
  belongs_to :owner
  has_many :stays
  has_many :notes
  belongs_to :feed_list
  validates :name, 
    presence: true, 
    length: { maximum: 50 }, 
    uniqueness: {case_sensitive: false}
  mount_uploader :image, ImageUploader
  def current_stay
    return stays.last if has_current_stay? 
  end

  def current_runn
    return current_stay.runn if has_current_stay? 
  end

  def self.search(search)
    if search
      where('name ILIKE ?', "%#{search}%")
    else
      all
    end
  end



end
