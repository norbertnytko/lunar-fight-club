puts 'Seeding...'

martial_arts = Skill.create!(name: 'Martial Arts', level: 5)
physical_condition = Skill.create!(name: 'Enhanced Physical Condition', level: 3)

Fighter.create!(
  first_name: 'Bruce',
  last_name: 'Wayne',
  description: "He's the hero Gotham deserves, but not the one it needs right now.",
  skills: [
    Skill.create!(name: 'Martial Arts', level: 5),
    Skill.create!(name: "Kicking Superman's Ass", level: 5)
    ],
  avatar_file_name: 'batman.png',
  avatar_content_type: 'image/png'
)

Fighter.create!(
  first_name: 'Joker',
  description: 'Psychotic gunmen no longer seem to have any motive beyond a general anger',
  skills: [
    Skill.create!(name: 'Being Crazy', level: 5),
    Skill.create!(name: 'Hurting realy, realy bad!', level: 1)
  ],
  avatar_file_name: 'joker.jpg',
  avatar_content_type: 'image/jpeg'

)

Fighter.create!(
  first_name: 'Clark',
  last_name: 'Kent',
  description: "It is a remarkable dichotomy. In many ways, Clark is the most human of us all. " \
    "Then... he shoots fire from the skies and it is difficult not to think of him as a god. " \
    "And how fortunate we all are that it does not occur to him",

  skills: [
    Skill.create!(name: 'Heat vision', level: 5),
    Skill.create!(name: 'Flight', level: 2),
    ],
  avatar_file_name: 'superman.jpg',
  avatar_content_type: 'image/jpeg'
)

Fighter.create!(
  first_name: 'Slade',
  last_name: 'Wilson',
  description: "The world's greatest assassin.",
  skills: [
    Skill.create!(name: 'Martial Arts', level: 5),
    Skill.create!(name:'Fencing', level: 4)
  ],
  avatar_file_name: 'deathstroke.jpg',
  avatar_content_type: 'image/jpeg'


)

Fighter.create!(
  first_name: 'Tony',
  last_name: 'Stark',
  description: 'Genius billionaire playboy philanthropist.',
  skills: [
    Skill.create!(name: 'Genius-Level Intellect', level: 5),
    Skill.create!(name: 'Iron Man suit', level: 3)
  ],
  avatar_file_name: 'ironman.jpg',
  avatar_content_type: 'image/jpeg'
)

Fighter.create!(
  first_name: 'Steven',
  last_name: 'Rogers',
  description: 'The first Avenger!',
  skills: [physical_condition, martial_arts],
  avatar_file_name: 'captainamerica.jpg',
  avatar_content_type: 'image/jpeg'
)
