module ControllerMacros
  # deviseでログイン用のmodule作成
  def login_admin(admin)
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in admin
  end

  def login_customer(customer)
    allow(controller).to receive(:authenticate_customer!).and_return(customer)
    @request.env["devise.mapping"] = Devise.mappings[:customer]
    sign_in customer
  end
end
