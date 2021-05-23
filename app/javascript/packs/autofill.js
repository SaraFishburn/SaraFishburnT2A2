document.addEventListener('DOMContentLoaded', function() {
  window.initAutocomplete = function() {
  
    // Create the search box and link it to the UI element.
    const inputs = document.getElementsByClassName("google-autofill");
  
    for (let i = 0; i < inputs.length; i++) {
      const searchBox = new google.maps.places.Autocomplete(inputs[i]);
  
      // Listen for the event fired when the user selects a prediction and retrieve
      // more details for that place.
      searchBox.addListener("places_changed", () => {
        const places = searchBox.getPlaces();
  
        if (places.length == 0) {
          return;
        }
      })
    }
  }
})
