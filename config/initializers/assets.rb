# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w( homes.* )
Rails.application.config.assets.precompile += %w( sessions.* )
Rails.application.config.assets.precompile += %w( users.* )
Rails.application.config.assets.precompile += %w( dashboards.* )
Rails.application.config.assets.precompile += %w( addresses.* )
Rails.application.config.assets.precompile += %w( donors_dashboards.* )
Rails.application.config.assets.precompile += %w( cards.* )
Rails.application.config.assets.precompile += %w( wishlists.* )
Rails.application.config.assets.precompile += %w( non_profits.* )
Rails.application.config.assets.precompile += %w( non_profits_dashboard.* )
Rails.application.config.assets.precompile += %w( categories.* )
