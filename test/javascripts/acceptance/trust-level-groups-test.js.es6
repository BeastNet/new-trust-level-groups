import { acceptance } from "helpers/qunit-helpers";

acceptance("TrustLevelGroups", { loggedIn: true });

test("TrustLevelGroups works", async assert => {
  await visit("/admin/plugins/trust-level-groups");

  assert.ok(false, "it shows the TrustLevelGroups button");
});
