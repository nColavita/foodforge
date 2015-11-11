$(document).ready(function(){

// ------- Version 1 of Selecting ingredients to Text ------- //
// ------- User Selects all of the ingredients they do not have to be texted to themselves ------- //

	// On Click Event of unique checkbox ID
	// Grab the .val() of the sister label for='item'
	// Push the value of that 'items data-type' into an empty array
	// At the end of all click events you will have an array of strings which are each ingredient

	// Each Recipe now has a unique data-type associated with it
	// I need the click event to know which data-type number its under

		var result = [];

		$('.item').on('click', function(){
			// get the value of the data-type, remove the _ and replace with spaces, 
			//then push into empty array as a single string
			string = $(this).attr('data-type');
			string = string.replace(/_/g, ' ');
			result.push(string + ".");
				console.log(result);
		})

})