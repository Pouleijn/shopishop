class Normalization::HumanNames

  def full_name(first_name, last_name)
    fname = format_first_name(first_name)
    lname = format_last_name(last_name)

    "#{fname} #{lname}"
  end

  protected

  def format_first_name(first_name)
    words = first_name.gsub(/\s+/, ' ').downcase.split(' ')
    fname = []

    words.each do |word|
      fname << word.capitalize
    end

    fname.join(' ')
  end

  def format_last_name(last_name)
    words = last_name.gsub(/ -/, '-').gsub(/- /, '-').gsub('  ', ' ').downcase.split(' ')

    lname = []

    words.each_with_index do |word, i|
      if word.include?("-")
        (i+1 == words.size) ? (lname << format_by_hyphen(word)) : (lname << format_by_hyphen(word, false))
      else
        (i+1 == words.size) ? (lname << word.capitalize) : (lname << word)
      end
    end
    lname.join(' ')
  end

  def format_by_hyphen(string, capitalize_all=true)
    result = []

    if capitalize_all
      string.split("-").each do |str|
        result << str.capitalize
      end
    else
      return string.capitalize
    end

    result.join('-')
  end
end