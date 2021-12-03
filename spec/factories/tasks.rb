FactoryBot.define do
  factory :task do
    trait :a do
      title { 'task_title_1' }
      content { 'task_content_1' }
    end

    trait :b do
      title { 'task_title_2' }
      content { 'task_content_2' } 
    end
    
    trait :c do
      title { 'task_title_3' }
      content { 'task_content_3' } 
    end
  end
end