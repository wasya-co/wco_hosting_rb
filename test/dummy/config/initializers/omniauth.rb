
require 'omniauth-keycloak'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :keycloak_openid, 'my-client',
    client_options: {
      site: 'http://localhost:8010',
      realm: 'my-realm',
      base_url: '',
    },
    name: 'keycloak'
end
