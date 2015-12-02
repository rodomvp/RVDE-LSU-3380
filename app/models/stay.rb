class Stay < ActiveRecord::Base
  belongs_to :patient
  belongs_to :runn
  has_many :feeding_events
  has_many :ud_events
  has_many :misc_stay_events

  after_create :update
  private
  	def update
  		self.check_in_dt = Time.new
    	self.is_current = true
  	end
end
