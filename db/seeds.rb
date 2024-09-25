

User.create!(email: "gamemaster@example.com", password: "password", password_confirmation: "password", username: "gamemaster", role: :game_master)
User.create!(email: "player@example.com", password: "password", password_confirmation: "password", username: "player", role: :player)

Skill.create([
  { name: "Accounting", base_percentage: 10, category: "Knowledge", default: true },
  { name: "Alertness", base_percentage: 20, category: "Perception", default: true },
  { name: "Artillery", base_percentage: 20, category: "Combat", default: true },
  { name: "Athletics", base_percentage: 30, category: "Physical", default: true },
  { name: "Bureaucracy", base_percentage: 10, category: "Knowledge", default: true },
  { name: "Criminology", base_percentage: 10, category: "Knowledge", default: true },
  { name: "Demolitions", base_percentage: 40, category: "Combat", default: true },
  { name: "Disguise", base_percentage: 10, category: "Deception", default: true },
  { name: "Dodge", base_percentage: 50, category: "Combat", default: true },
  { name: "Drive", base_percentage: 20, category: "Physical", default: true },
  { name: "Firearms", base_percentage: 20, category: "Combat", default: true },
  { name: "First Aid", base_percentage: 10, category: "Medical", default: true },
  { name: "Forensics", base_percentage: 30, category: "Medical", default: true },
  { name: "Heavy Machinery", base_percentage: 10, category: "Technical", default: true },
  { name: "History", base_percentage: 10, category: "Knowledge", default: true },
  { name: "Melee Weapons", base_percentage: 30, category: "Combat", default: true },
  { name: "Navigate", base_percentage: 10, category: "Survival", default: true },
  { name: "Occult", base_percentage: 10, category: "Knowledge", default: true },
  { name: "Persuade", base_percentage: 20, category: "Social", default: true },
  { name: "Psychotherapy", base_percentage: 10, category: "Medical", default: true },
  { name: "Ride", base_percentage: 10, category: "Physical", default: true },
  { name: "Search", base_percentage: 20, category: "Perception", default: true },
  { name: "Stealth", base_percentage: 10, category: "Combat", default: true },
  { name: "Survival", base_percentage: 10, category: "Survival", default: true },
  { name: "Swim", base_percentage: 20, category: "Physical", default: true },
  { name: "Unarmed Combat", base_percentage: 40, category: "Combat", default: true }
])
