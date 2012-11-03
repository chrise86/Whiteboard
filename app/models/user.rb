class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :token_authenticatable, :confirmable,
	# :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable

	# Setup accessible (or protected) attributes for your model
	attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :first_name, :last_name
	# attr_accessible :title, :body

	has_many :professor_events
	has_many :user_sections
	has_many :user_responses
	has_many :gradebooks
	has_many :categories # e.g. Professor has categories for Events ("Chapter 1", "Chapter 2", etc.)
	
	has_one :calendar_preferences
end
