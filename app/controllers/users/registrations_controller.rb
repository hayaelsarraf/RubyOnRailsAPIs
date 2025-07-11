module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    def create
      build_resource(sign_up_params)

      if resource.save
        token = resource.generate_jwt
        render json: {
          status: { code: 200, message: 'Signed up successfully.' },
          data: UserSerializer.new(resource, {}).serializable_hash[:data][:attributes],
          token: token
        }
      else
        render json: {
          status: 422, message: resource.errors.full_messages.to_sentence
        }, status: :unprocessable_entity
      end
    end

    private

    def sign_up_params
      params.require(:user).permit(:email, :password, :name, :image)
    end
  end
end
