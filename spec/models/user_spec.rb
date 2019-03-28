require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    user_1 = User.find_or_create_by(name: "Matt Weiss", password: "generic_password", email: "generic@email.com")

    it should{validate_presence_of :name}
    it should{validate_presence_of :email}
    it should{validate_presence_of :password}
    it should{validate_uniqueness_of(:email)}
  end

  describe 'methods' do
    it 'checks user authentication' do
      user_1 = User.find_or_create_by(name: "Matt Weiss", password: "generic_password", email: "generic@email.com")
      auth_attempt_1 = User.authenticate("generic@email.com", "generic_password")
      expect(auth_attempt_1.first.id).to eq(user_1.id)
      expect(User.authenticate("genericwrong@email.com", "generic_password").first).to eq(nil)
      expect(User.authenticate("generic@email.com", "wrong_password").first).to eq(nil)
    end
  end
end
