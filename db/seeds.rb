# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Instrument.find_or_create_by(name: "Vocals")
Instrument.find_or_create_by(name: "Drums / Percussion")
Instrument.find_or_create_by(name: "Guitar")
Instrument.find_or_create_by(name: "Bass guitar")
Instrument.find_or_create_by(name: "Synth bass")
Instrument.find_or_create_by(name: "Synth lead")
Instrument.find_or_create_by(name: "Pads")
Instrument.find_or_create_by(name: "Piano")
Instrument.find_or_create_by(name: "Strings")
Instrument.find_or_create_by(name: "Orchestral")
Instrument.find_or_create_by(name: "FX")
Instrument.find_or_create_by(name: "Other")

Category.find_or_create_by(name: "Hits")
Category.find_or_create_by(name: "Loops")
Category.find_or_create_by(name: "Spoken")
Category.find_or_create_by(name: "Stabs")
Category.find_or_create_by(name: "Chords")
Category.find_or_create_by(name: "Notes")
Category.find_or_create_by(name: "Scratches")
Category.find_or_create_by(name: "Textures & Atmospheres")
Category.find_or_create_by(name: "Riffs & Licks")
Category.find_or_create_by(name: "Other")

20.times do |n|
  @sound = Sound.new(title: "Sound")
  @sound.file = File.open("spec/support/test.wav")
  @sound.producer = Producer.create!(email: "this_#{n}@is.email", password: "password", password_confirmation: "password")
  @sound.tags << Tag.find_or_create_by(name: "tagname")
  @sound.save!
end
