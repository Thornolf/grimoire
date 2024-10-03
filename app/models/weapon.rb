class Weapon < Item
    default_scope { where(type: "Weapon") }
end
