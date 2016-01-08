# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Instrument.create!(name: "Vocals")
Instrument.create!(name: "Drums / Percussion")
Instrument.create!(name: "Guitar")
Instrument.create!(name: "Bass guitar")
Instrument.create!(name: "Synth bass")
Instrument.create!(name: "Synth lead")
Instrument.create!(name: "Pads")
Instrument.create!(name: "Piano")
Instrument.create!(name: "Strings")
Instrument.create!(name: "Orchestral")
Instrument.create!(name: "FX")
Instrument.create!(name: "Other")

Category.create!(name: "Hits")
Category.create!(name: "Loops")
Category.create!(name: "Spoken")
Category.create!(name: "Stabs")
Category.create!(name: "Chords")
Category.create!(name: "Notes")
Category.create!(name: "Scratches")
Category.create!(name: "Textures & Atmospheres")
Category.create!(name: "Riffs & Licks")
Category.create!(name: "Other")

20.times do |n|
  @sound = Sound.new(title: "Sound")
  @sound.file = File.open("spec/support/test.wav")
  @sound.producer = Producer.create!(email: "this_#{n}@is.email", password: "password", password_confirmation: "password")
  @sound.tags << Tag.find_or_create_by(name: "tagname")
  @sound.save!
end
