Drone Tracking System with extensive features such as separate roles for Admin, Operator and Manager using Custom Authentication Service via session storage. Live drone tracking via Google Maps API. Geofencing using coordinates and an option to disable drone and make it return to homebase.
This is done using .Net 7, Blazor and ado.net SQL.
In order for the google maps to work correctly enter your API KEY in _Host.cshtml file in the Pages folder in the project directory.

Modify the
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOURAPIKEYHERE"></script> 

with your API KEY.
