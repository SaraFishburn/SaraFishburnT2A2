# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Filament.destroy_all
Printer.destroy_all
Review.destroy_all

User.create(
  [
    {
      first_name: 'Sara',
      last_name: 'Fishburn',
      nickname: 'sazza',
      password: 'Password',
      password_confirmation: 'Password',
      email: 'a@b.com',
      address: 'Coder Academy, Adelaide Street, Brisbane City QLD, Australia',
      latitude: -27.468298,
      longitude: 153.0247838
    },
    {
      first_name: 'Nicolas',
      last_name: 'Jensen',
      nickname: 'Nic',
      password: 'Password',
      password_confirmation: 'Password',
      email: 'foo@bar.com',
      address: 'Coder Academy, Adelaide Street, Brisbane City QLD, Australia',
      latitude: -27.468298,
      longitude: 153.0247838
    },
    {
      first_name: 'Alex',
      last_name: 'Leybourne',
      nickname: 'Lamebourne',
      password: 'Password',
      password_confirmation: 'Password',
      email: 'a@c.com',
      address: 'Coder Academy, Adelaide Street, Brisbane City QLD, Australia',
      latitude: -27.468298,
      longitude: 153.0247838
    },
    {
      first_name: 'Jye',
      last_name: 'Bussa',
      nickname: "I'm Going Sober",
      password: 'Password',
      password_confirmation: 'Password',
      email: 'a@d.com'
    }
  ]
)

Printer.create(
  [
    {
      printer_brand: 'Ender',
      printer_model: 'i3 Mega',
      printer_type: 'SLA'
    },
    {
      printer_brand: 'Anycubic',
      printer_model: '3 Pro',
      printer_type: 'SLA'
    },
    {
      printer_brand: 'Anycubic',
      printer_model: 'Mars',
      printer_type: 'FDM'
    }
  ]
)

Filament.create(
  [
    {
      filament_brand: 'Sunlu',
      filament_color: 'Yellow',
      filament_type: 'Wood'
    },
    {
      filament_brand: '3D Solutech',
      filament_color: 'Brown',
      filament_type: 'Silk PLA'
    },
    {
      filament_brand: 'Elegoo',
      filament_color: 'Orange',
      filament_type: 'Resin'
    }
  ]
)

3.times do |i|
  user = User.offset(i).first
  user.printers << Printer.offset(i).first
  user.filaments << Filament.offset(i).first
  user.add_role :owner
  User.all.sample([1, 2, 3, 4].sample).each do |reviewer|
    Review.create(
      user: user,
      reviewer: reviewer,
      content: [
        '5/7 Perfect Score!',
        'Worst product ever, would strongly recommend',
        'In 1998, The Undertaker threw Mankind off Hell In A Cell, and plummeted 16 ft through an announcer’s table.',
        'I like that boulder. That is a Niice boulder'
      ].sample,
      rating: [0, 1, 2, 3, 4, 5].sample
    )
  end
end
