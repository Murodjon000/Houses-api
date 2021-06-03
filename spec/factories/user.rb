FactoryBot.define do
    factory :user do
        sequence(:username) {|n| "John#{n}Hudson"}
        sequence(:email) {|n| "email#{n}@example.com"}
        password {'password'}
        password_confirmation {'password'}
    end
end