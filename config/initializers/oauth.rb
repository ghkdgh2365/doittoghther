Rails.application.config.middleware.use OmniAuth::Builder do  
     
  provider :facebook,
           '251353515319428', 
           'a448d3ff13e0e9b00c084c12151923d0',
           scope: 'email',
           info_fields: 'email',
           auth_type: 'rerequest'
  configure do |config|
    config.path_prefix = '/users/auth'
  end
  
  on_failure do |env|
    #we need to setup env
    if env['omniauth.params'].present
      env["devise.mapping"] = Devise.mappings[:user]
    end
    Devise::OmniauthCallbacksController.action(:failure).call(env)
  end
end