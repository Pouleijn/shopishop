class Normalization::Email
  def initialize(email)
    email.gsub(/[^a-zA-Z0-9 @.-]/, "").gsub(/[ ]+/, " ").gsub(/ /, ".").downcase
  end
end