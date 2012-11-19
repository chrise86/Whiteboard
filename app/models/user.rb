class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :first_name, :last_name
  has_one :calendar_preferences
  has_many :categories
  has_many :user_responses
  has_many :gradebooks
  has_many :professor_events
  has_many :user_sections
  has_many :sections, :through => :user_sections

  def find_all_sections
    user_section = UserSection.where(:user_id => self.id)

    section = []
    user_section.each do |us|
      temp = Section.find_by_id(us.section_id)
      section << temp
    end
    section
  end

end
