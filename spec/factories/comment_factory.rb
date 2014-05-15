FactoryGirl.define do
  factory :comment do
		sequence(:author) { |n| "Bugs Bunny#{n}" }
    sequence(:content) { |n|  "That's all folks!#{n}" }
   end
end
