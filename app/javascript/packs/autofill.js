document.addEventListener('DOMContentLoaded', function() {
  window.initAutocomplete = function() {
  
    // Create the search box and link it to the UI element.
    const inputs = document.getElementsByClassName("google-autofill");
  
    for (let i = 0; i < inputs.length; i++) {
      const searchBox = new google.maps.places.Autocomplete(inputs[i]);

      searchBox.addListener("place_changed", () => {
        const place = searchBox.getPlace();
        inputs[i].dispatchEvent(new CustomEvent('place_changed', { detail: place }))
      })
    }
  }
})
