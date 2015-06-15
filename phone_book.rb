require 'csv'

class PhoneBook
  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def load
    CSV.foreach('contacts.csv', headers: true, header_converters: :symbol) do |row|
      @contacts << Person.new(row)
    end
  end
end

class Person
  attr_reader   :id,
                :first_name,
                :last_name,
                :phone_number,
                :age

  def initialize(row)
    @id           = row[:id].to_i
    @first_name   = row[:first_name].capitalize
    @last_name    = row[:last_name].capitalize
    @phone_number = sanitize_phone_number(row[:phone_number])
    @age          = row[:age].to_i
  end

  private

  def sanitize_phone_number(phone_number)
    "(" + phone_number[0..2] + ")" + " " + phone_number[3..5] + "-" + phone_number[6..9]
  end

end
