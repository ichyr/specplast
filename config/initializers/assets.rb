# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '0.7'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( registries_angular.js registries_angular/* )
Rails.application.config.assets.precompile += %w( registries_angular.css registries_angular/* )
Rails.application.config.assets.precompile += %w( progressbar.gif loading.gif )