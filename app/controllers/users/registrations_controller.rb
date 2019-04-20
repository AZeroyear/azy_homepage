class Users::RegistrationsController < Devise::RegistrationsController
    before_action :authenticate_user!
    def create
      p "test"
      #super
    end
end
