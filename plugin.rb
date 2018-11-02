# name: TrustLevelGroups
# about:
# version: 0.1
# authors: rener172846
# url: https://github.com/rener172846


register_asset "stylesheets/common/trust-level-groups.scss"


enabled_site_setting :trust_level_groups_enabled

PLUGIN_NAME ||= "TrustLevelGroups".freeze

after_initialize do
  
  # see lib/plugin/instance.rb for the methods available in this context
  

  module ::TrustLevelGroups
    class Engine < ::Rails::Engine
      engine_name PLUGIN_NAME
      isolate_namespace TrustLevelGroups
    end
  end

  
  require File.expand_path("../jobs/scheduled/check_trust_level_groups.rb", __FILE__)
  

  
  require_dependency "application_controller"
  class TrustLevelGroups::ActionsController < ::ApplicationController
    requires_plugin PLUGIN_NAME

    before_action :ensure_logged_in

    def list
      render json: success_json
    end
  end

  TrustLevelGroups::Engine.routes.draw do
    get "/list" => "actions#list"
  end

  Discourse::Application.routes.append do
    mount ::TrustLevelGroups::Engine, at: "/trust-level-groups"
  end
  
end
