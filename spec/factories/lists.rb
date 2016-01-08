FactoryGirl.define do
  factory :list do
    name "MyString"
    public false
    user

    factory :public_list do
      public true
    end
  end
end
