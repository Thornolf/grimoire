module CharacterSheetsHelper
  def display_top_stats(character_sheet)
    stats = {
      strength: character_sheet.strength,
      constitution: character_sheet.constitution,
      dexterity: character_sheet.dexterity,
      intelligence: character_sheet.intelligence,
      power: character_sheet.power,
      charisma: character_sheet.charisma
    }

    # Sort the stats by value and pick the top 3
    top_stats = stats.sort_by { |_key, value| -value }.first(3)

    # Format the output to display "Stat Name: Value"
    top_stats.map { |stat_name, value| "#{stat_name.capitalize}: #{value}" }.join(", ")
  end
end
