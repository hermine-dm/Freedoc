class Specialty < ApplicationRecord
	has_many :join_doctor_specialities
	has_many :doctors, through: :join_doctor_specialities
	
end
