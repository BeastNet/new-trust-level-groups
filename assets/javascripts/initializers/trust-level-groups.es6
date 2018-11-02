import { withPluginApi } from "discourse/lib/plugin-api";

function initializeTrustLevelGroup(api) {
  
  // see app/assets/javascripts/discourse/lib/plugin-api
  // for the functions available via the api object
  
}

export default {
  name: "trust-level-groups",

  initialize() {
    withPluginApi("0.8.24", initializeTrustLevelGroup);
  }
};
