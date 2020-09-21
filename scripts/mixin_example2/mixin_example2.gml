///@func mixin_example()
function mixin_example2() {

	Mixin

	Function "foo" Begin
		show_error("This should not be called.", true);
	End

	Function "distFromCentre" Begin
		Return point_distance(x, y, room_width/2, room_height/2) AndOut;
	End

	EndMixin



}
