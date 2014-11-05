class User < ActiveRecord::Base
  belongs_to :role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable

  before_create :set_defaults

  private
    def set_defaults      
      self.role ||= Role.find_by_name('registered')
      # self.locked_at = DateTime.now.to_date
      # self.failed_attempts = 100        
    end
end
