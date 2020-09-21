///@func mixin_example()
function mixin_example() {

	Mixin

	Function "distanceFromCentre" Begin
		Return point_distance(x, y, room_width/2, room_height/2) AndOut;
	End

	Function "foo" Begin
		show_error("This should not be called.", true);
	End

	EndMixin



}
