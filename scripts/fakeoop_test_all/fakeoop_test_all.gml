///@func fakeoop_test_all()

// Start of tests
var time0 = current_time;

// Tests
#region

// Basic class with methods and mixin
var fixture = instance_create_depth(room_width/2+5, room_height/2, 0, obj_example);
assert_equal(o(fixture, "factorial", 5), 120, "Simple factorial test failed!");
assert_equal(o(fixture, "myName"), "EXAMPLE", "Simple myName test failed!");
assert_equal(o(fixture, "distanceFromCentre"), 5, "Simple mixin function test failed!");
assert_equal(o(fixture, ["distFromCentre" FromMixin mixin_example2]), 5, "Simple mixin reach-in test failed!");
assert_equal(o([fixture, "factorial", 5]), 120, "Simple factorial test failed! (call array)");
assert_equal(o([fixture, "myName"]), "EXAMPLE", "Simple myName test failed! (call array)");
assert_equal(o([fixture, "distanceFromCentre"]), 5, "Simple mixin function test failed! (call array)");
assert_equal(o([fixture, ["distFromCentre" FromMixin mixin_example2]]), 5, "Simple mixin reach-in test failed! (call array)");
instance_destroy(fixture);

// Basic inherited class with methods and mixin
var fixture = instance_create_depth(room_width/2+5, room_height/2, 0, obj_example_child);
assert_equal(o(fixture, "factorial", 6), 720, "Child factorial test failed!");
assert_equal(o(fixture, "myName"), "EXAMPLE CHILD", "Child myName test failed!");
assert_equal(o(fixture, "distanceFromCentre"), 5, "Child mixin function test failed!");
assert_equal(o(fixture, ["distFromCentre" FromMixin mixin_example2]), 5, "Child mixin reach-in test failed!");
assert_equal(o(fixture, ["myName" FromClass obj_example]), "EXAMPLE", "Child inherited function test failed!");
assert_equal(o([fixture, "factorial", 6]), 720, "Child factorial test failed! (call array)");
assert_equal(o([fixture, "myName"]), "EXAMPLE CHILD", "Child myName test failed! (call array)");
assert_equal(o([fixture, "distanceFromCentre"]), 5, "Child mixin function test failed! (call array)");
assert_equal(o([fixture, ["distFromCentre" FromMixin mixin_example2]]), 5, "Child mixin reach-in test failed! (call array)");
assert_equal(o([fixture, ["myName" FromClass obj_example]]), "EXAMPLE", "Child inherited function test failed! (call array)");
instance_destroy(fixture);

#endregion

// End of tests
var time1 = current_time;
show_debug_message("Fake OOP tests completed in " + string(time1-time0) + "ms.");
