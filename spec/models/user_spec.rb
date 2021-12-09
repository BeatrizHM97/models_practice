require 'rails_helper'

RSpec.describe User, type: :model do
  context "valid attributes" do
    it "is valid with correct attributes" do
      user = User.new(name:'María', lastname:'Lopez', birth_date:'14/05/2001', email_address:'maria@gmail.com', password:'Hg27-Dt15')
      expect(user).to be_valid
    end

    it "is valid deactivate users" do
      user = User.new.instance_eval{ deactivate_users(6) }
      expect(user).to match(true)
    end

    it "is valid get a user age" do
      user = User.new.instance_eval{ get_age(1) }
      expect(user).to be > 0
    end
  end

  context "invalid attributes" do
    it "cannot have the same name and lastname" do
      user = User.new(name:'María', lastname:'María', birth_date:'14/05/2001', email_address:'maria@gmail.com', password:'Hg27-Dt15')
      expect(user).to be_invalid
    end 

    it "the birth date connot be greater than or equal to the current date" do
      user = User.new(name:'María', lastname:'Lopez', birth_date:Time.now.strftime("%d-%m-%Y").to_date, email_address:'maria@gmail.com', password:'Hg27-Dt15')
      expect(user).to be_invalid
    end

    it "cannot have less than 3 digits in the name" do
      user = User.new(name:'M', lastname:'Lopez', birth_date:'14/05/2001', email_address:'maria@gmail.com', password:'Hg27-Dt15')
      expect(user).to be_invalid
    end

    it "cannot have less than 6 digits" do
      user = User.new(name:'María', lastname:'Lopez', birth_date:'14/05/2001', email_address:'maria@gmail.com', password:'Hg-27')
      expect(user).to be_invalid
    end

    it "a password cannot have more than 20 digits" do
      user = User.new(name:'María', lastname:'Lopez', birth_date:'14/05/2001', email_address:'maria@gmail.com', password:'Hg2754bh87-ok65df16kn7')
      expect(user).to be_invalid
    end

    it "a password cannot have a format different than something@something.something" do
      user = User.new(name:'María', lastname:'Lopez', birth_date:'14/05/2001', email_address:'mariagmail', password:'Hg27-Dt15')
      expect(user).to be_invalid
    end

    it "email address must be unique" do
      user = User.new(name:'María', lastname:'Lopez', birth_date:'14/05/2001', email_address:'lucas@gmail.com', password:'Hg27-Dt15')      
      expect(user).to be_invalid
    end

  end
end