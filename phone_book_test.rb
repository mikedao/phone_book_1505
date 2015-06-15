require 'minitest/autorun'
require 'minitest/pride'
require './phone_book'

class PhonebookTest < MiniTest::Test

  def test_person_sanitizes_first_name
    row = {id: "1",
            first_name: "taylor",
            last_name: "swift",
            phone_number: "6175555555",
            age: "25"}

    person = Person.new(row)

    assert_equal "Taylor", person.first_name
  end

  def test_person_sanitizes_last_name
    row = {id: "1",
            first_name: "taylor",
            last_name: "swift",
            phone_number: "6175555555",
            age: "25"}

    person = Person.new(row)

    assert_equal "Swift", person.last_name
  end

  def test_person_sanitizes_age
    row = {id: "1",
            first_name: "taylor",
            last_name: "swift",
            phone_number: "6175555555",
            age: "25"}

    person = Person.new(row)

    assert_equal 25, person.age
  end

  def test_it_can_load_all_people
    pb = PhoneBook.new

    pb.load

    assert_equal 3, pb.contacts.count
  end

  def test_first_person_has_a_name
    pb = PhoneBook.new
    pb.load

    result = pb.contacts.first.first_name

    assert_equal "Taylor", result
  end

  def test_tswifts_age_is_25
    pb = PhoneBook.new

    pb.load
    result = pb.contacts.first.age

    assert_equal 25, result
  end

  def test_it_has_other_people
    pb = PhoneBook.new

    pb.load
    person = pb.contacts[1]

    assert_equal 35, person.age
    assert_equal "Jeff", person.first_name
    assert_equal "Wan", person.last_name
    assert_equal "2122222222", person.phone_number
  end

  def test_contacts_is_full_of_people
    pb = PhoneBook.new

    pb.load
    pb.contacts.each do |person|
      assert_equal Person, person.class
    end
  end
end
