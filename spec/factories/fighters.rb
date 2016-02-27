FactoryGirl.define do
  factory :fighter do
    first_name 'Bruce'
    last_name 'Wayne'
    description 'No one knows that he is the Batman'

    transient { skills_count 5 }

    after(:create) do |fighter, evaluator|
      create_list(:skill, evaluator.skills_count, fighter: fighter)
    end
  end
end
