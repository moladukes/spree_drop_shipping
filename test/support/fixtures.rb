begin
  
  FactoryGirl.define do
  
    factory :supplier do
      name "Big Store"
      email { Faker::Internet.email }
      phone "800-555-5555"
      url "example.com"
      contact "Steve"
      contact_phone "555-555-5555"
    end
    
    factory :address do
      firstname "SUPPLIER"
      lastname "SUPPLIER"
      address1 "100 State St"
      city "Santa Barbara"
      phone "555-555-5555"
      zipcode "93101"
      state { State.find_by_name("California") }
      country { Country.find_by_name("United States") }
    end
    
    factory :user do
      email { Faker::Internet.email }
      password "spree123"
      password_confirmation "spree123"
    end
  
    factory :admin_user, :parent => :user do |u|
      u.roles { [Role.find_or_create_by_name("admin")] }
    end
  
  end
  
rescue FactoryGirl::DuplicateDefinitionError
  
  puts "factories are already defined..."
  
end