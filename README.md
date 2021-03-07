# ISSTracker
 Mobile applicaiton that locates the international space station on a map.

 The app uses the Google Maps iOS SDK, and api.open-notify.org's ISS tracker API.
 
 This is the veiw of the application it is a Map with a single buttons that find the international space station.
 App structure: 
 View -> contains the GoogeMaps view aswell as a google maps controller to change views
      -> View also contains a controllers for fetching Data from the ISS tracker API

 Controller -> Is called from the view and runs commands on a model, the Controller also pulls any data to
            -> display on the UI in the form of Latitude and Longatude for the Map view

 Model -> Handles the Network request to the API, aswell as storing what data is to be displayed on the screen
       -> Interacts with the controller.