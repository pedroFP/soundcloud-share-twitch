# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
SOUND_CLOUD_URL = '<iframe width="100%" height="166" scrolling="no" frameborder="no" allow="autoplay" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/1153842502&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"></iframe><div style="font-size: 10px; color: #cccccc;line-break: anywhere;word-break: normal;overflow: hidden;white-space: nowrap;text-overflow: ellipsis; font-family: Interstate,Lucida Grande,Lucida Sans Unicode,Lucida Sans,Garuda,Verdana,Tahoma,sans-serif;font-weight: 100;"><a href="https://soundcloud.com/sheepnmusic" title="Sheepn" target="_blank" style="color: #cccccc; text-decoration: none;">Sheepn</a> · <a href="https://soundcloud.com/sheepnmusic/no-longer-together" title="No Longer Together (with TATiANNA)" target="_blank" style="color: #cccccc; text-decoration: none;">No Longer Together (with TATiANNA)</a></div>'.freeze

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
