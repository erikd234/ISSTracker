# ISSTracker
 Mobile applicaiton that locates the international space station on a map.

 The app uses the Google Maps iOS SDK, and api.open-notify.org's ISS tracker API.
 
 App structure: 
 
 View -> contains the Googe Maps view as well as a Google Maps controller to change views.
      -> View also contains a controllers in the MVC pattern for fetching Data from the ISS tracker API

 Controller -> Ths is called from the view and runs commands on a model, the Controller also pulls any data to
            -> display on the UI in the form of Latitude and Longatude for the Map view.

 Model -> Handles the network request to the API, aswell as storing what data is to be displayed on the screen.
       -> The Model interacts with the controller.
