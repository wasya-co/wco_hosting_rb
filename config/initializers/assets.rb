
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w(
  wco_models/application.js
  wco_models/application.css

  application.js
  application.css
);
