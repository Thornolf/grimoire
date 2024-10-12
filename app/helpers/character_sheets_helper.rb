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

  # Corrected humanize_stat_name method
  def humanize_stat_name(attribute)
    case attribute
    when :sanity
      "Sanity (SAN)"
    when :hit_points
      "Hit Points (HP)"
    when :willpower_points
      "Willpower Points (WP)"
    when :breaking_point
      "Breaking Point (BP)"
    when :luck
      "Luck (LUK)"
    else
      attribute.to_s.humanize  # Fallback to humanize the attribute name if not explicitly defined
    end
  end
end
