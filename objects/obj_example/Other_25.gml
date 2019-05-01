/// @description Fake OOP event

Class

Function "factorial" Begin
	var n = Arg[0];
	if (n <= 1) {
		Return n AndOut;
	}
	else {
		Return n*o(self, "factorial", n-1) AndOut;
	}
End

Function "myName" Begin
	Return "EXAMPLE" AndOut;
End

Mix mixin_example;

EndClass
