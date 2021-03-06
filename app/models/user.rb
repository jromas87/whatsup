class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :attendences
	has_many :events, through: :attendences
	has_many :friendships
	has_many :friends, through: :friendships

	def attending(event)
		attendences.where(event_id: event.id).first
	end
end
