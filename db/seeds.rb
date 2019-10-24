# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'faker'
Doctor.destroy_all #détruit les BDD existantes
Patient.destroy_all
Appointment.destroy_all
Specialty.destroy_all
City.destroy_all
puts "tout a été détruit"

5.times do 
	City.create!(name: Faker::Address.city)
end
puts "ok ville"

10.times do #genere 5 patients et 5 doctors
	Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Address.zip_code, city_id: City.all.sample.id) #sans specialty
	Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,  city_id: City.all.sample.id)

end
puts "ok pour medecins et patients"

15.times do #en créer 10 
	Appointment.create!(date: Faker::Date.in_date_period, doctor_id: Doctor.all.sample.id,patient_id: Patient.all.sample.id, city_id: City.all.sample.id) #prend un parmis l'array all
end

puts "ok pour les rdv"
#pas de time, puisque c'est une liste de vrai spécialité
Specialty.create(name: "cardiologie")
Specialty.create(name: "chirurgie")
Specialty.create(name: "endocrinologie")
Specialty.create(name: "gyneco")
Specialty.create(name: "hématologue")
Specialty.create(name: "pediatrie")


puts "ok pour les specialités"

15.times do #en créer 10 
	JoinDoctorSpeciality.create!(specialty_id: Specialty.all.sample.id, doctor_id: Doctor.all.sample.id) #prend un parmis l'array all
end
puts "ok pour les docteurs/spec"
