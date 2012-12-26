module PeopleHelper
  def options_for_blood_type
    [
      [t('people.blood_type.1'), 1],
      [t('people.blood_type.2'), 2],
      [t('people.blood_type.3'), 3],
      [t('people.blood_type.4'), 4]
    ]
  end

  def options_for_gender
    [
      [t('people.gender.male'), true],
      [t('people.gender.female'), false]
    ]
  end

  def options_for_rh_factor
    [
      ['+', true],
      ['-', false]
    ]
  end

  def text_for_age(age)
    if age % 10 == 1
      t('people.age.year_1')
    elsif (2..4).include? age % 10
      t('people.age.year_2-4')
    else
      t('people.age.year_other')
    end
  end
end
