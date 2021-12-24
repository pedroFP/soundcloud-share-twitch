# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
SOUND_CLOUD_URL = 'https://soundcloud.com/nekoluver/nekoluv-melanie-download-link-in-my-discription'.freeze

Viewer.destroy_all
Track.destroy_all
Stream.destroy_all
Admin.destroy_all

viewer = Viewer.create(
  email: 'pedro.araya.labra@gmail.com',
  twitch_id: 60_792_750,
  twitch_login: 'solamente_pedro',
  twitch_display_name: 'solamente_pedro',
  profile_image_url: 'https://static-cdn.jtvnw.net/user-default-pictures-uv/75305d54-c7cc-40d1-bb9c-91fbe85943c7-profile_image-300x300.png',
  skip_password_validation: true
)

admin = Admin.create(
  email: '123@123.com',
  password: '123123',
  password_confirmation: '123123'
)

stream = Stream.new(
  title: 'Forero nights',
  admin: admin,
  receiving_tracks: true,
  aired_at: Time.now + 1.day
)

20.times do
  Track.create viewer: viewer, soundcloud_url: SOUND_CLOUD_URL, stream: stream
end
