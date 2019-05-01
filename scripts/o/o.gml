///@function o(...)

// Macros
#region
#macro __FAKEOOP_EVENT__ ev_user15
#macro Mixin var __fakeoop_seeking__ = true, __fakeoop_mixin__ = true, __fakeoop_mixes__ = undefined; if (false) {}
#macro Class var __fakeoop_seeking__ = true, __fakeoop_mixin__ = false, __fakeoop_mixes__ = undefined; if (false) {}
#macro Mix else __fakeoop_mixes__ = 
#macro EndMixin if (!__fakeoop_seeking__) return false; if (is_array(__fakeoop_mixes__)) { for (var __fakeoop_i__ = array_length_1d(__fakeoop_mixes__)-1; __fakeoop_i__ >= 0 && __fakeoop_seeking__; __fakeoop_i__--) __fakeoop_seeking__ = script_execute(__fakeoop_mixes__[__fakeoop_i__]); } else if (!is_undefined(__fakeoop_mixes__)) { __fakeoop_seeking__ = script_execute(__fakeoop_mixes__) } return __fakeoop_seeking__;
#macro EndClass if (!__fakeoop_seeking__) exit; if (is_array(__fakeoop_mixes__)) { for (var __fakeoop_i__ = array_length_1d(__fakeoop_mixes__)-1; __fakeoop_i__ >= 0 && __fakeoop_seeking__; __fakeoop_i__--) __fakeoop_seeking__ = script_execute(__fakeoop_mixes__[__fakeoop_i__]); } else if (!is_undefined(__fakeoop_mixes__)) { __fakeoop_seeking__ = script_execute(__fakeoop_mixes__) } if (__fakeoop_seeking__) { if (object_get_parent(global.__fakeoop_obj__) >= 0) { global.__fakeoop_obj__ = object_get_parent(global.__fakeoop_obj__); event_perform_object(global.__fakeoop_obj__, ev_other, __FAKEOOP_EVENT__); }  else show_error("Cannot find method " + string(global.__fakeoop_name__) + ".", true); }
#macro Return { { global.__fakeoop_return__ = 
#macro AndOut } if (__fakeoop_mixin__) return false; exit; }
#macro Function else if global.__fakeoop_name__ == 
#macro Arg global.__fakeoop_args__
#macro Args array_length_1d(global.__fakeoop_args__)
#macro FromClass , 0+
#macro FromMixin , -1-1*
#macro Begin { __fakeoop_seeking__ = false;
#macro End }
#endregion

// Global initialization
gml_pragma("global", @'
	global.__fakeoop_name_stack__ = ds_stack_create();
	global.__fakeoop_args_stack__ = ds_stack_create();
	global.__fakeoop_obj_stack__ = ds_stack_create();
	global.__fakeoop_name__ = undefined;
	global.__fakeoop_args__ = undefined;
	global.__fakeoop_obj__ = undefined;
	global.__fakeoop_return__ = undefined;
');

// Capture arguments
#region
var subject, explicit_scope, method, argc, args;
switch (argument_count) {
	case 0:
		show_error("Expected at least 1 argument, got 0.", true);	
	break;
	case 1: //o([subject, method, <args>]) form
		var call_block = argument[0];
		if (is_array(argument[0])) {
			argc = array_length_1d(call_block)-2;
			if (argc >= 0) {
				subject = call_block[0];
				method = call_block[1];
				args = array_create(argc);
				array_copy(args, 0, call_block, 2, argc);
			} else {
				show_error("Invalid call to o(). Call array too short.", true);
			}
		} else {
			show_error("Invalid call to o(). Expected call array type, got " + typeof(argument[0]) + ".", true);
		}
	break;
	default: //o(subject, method, <args>) form
		subject = argument[0];
		method = argument[1];
		argc = argument_count-2;
		args = array_create(argc);
		for (var i = argc-1; i >= 0; i--) {
			args[i] = argument[i+2];
		}
	break;
}
if (is_array(method)) {
	if (array_length_1d(method) == 2) {
		explicit_scope = method[1];
		method = method[0];
	} else {
		show_error("Invalid call to o(). Malformed scoped method.", true);
	}
} else {
	explicit_scope = undefined;
}
#endregion

// Push virtual call stack
global.__fakeoop_return__ = undefined;
ds_stack_push(global.__fakeoop_name_stack__, global.__fakeoop_name__);
ds_stack_push(global.__fakeoop_args_stack__, global.__fakeoop_args__);
ds_stack_push(global.__fakeoop_obj_stack__, global.__fakeoop_obj__);
global.__fakeoop_name__ = method;
global.__fakeoop_args__ = args;
// Execute method
if (is_undefined(explicit_scope)) { //Default mode
	with (subject) {
		global.__fakeoop_obj__ = object_index;
		event_perform(ev_other, __FAKEOOP_EVENT__);
	}
} else if (explicit_scope >= 0) { //Explicit object mode
	global.__fakeoop_obj__ = explicit_scope;
	with (subject) {
		event_perform_object(explicit_scope, ev_other, __FAKEOOP_EVENT__);
	}
} else { //Explicit mixin mode
	var mixin_scope = -explicit_scope-1
	with (subject) {
		if (script_execute(mixin_scope)) {
			show_error("Cannot find method " + string(method) + " in mixin " + script_get_name(mixin_scope) + ".", true);
		}
	}
}
// Pop virtual call stack
global.__fakeoop_name__ = ds_stack_pop(global.__fakeoop_name_stack__);
global.__fakeoop_args__ = ds_stack_pop(global.__fakeoop_args_stack__);
global.__fakeoop_obj__ = ds_stack_pop(global.__fakeoop_obj_stack__);
// Return virtual return value
return global.__fakeoop_return__;
