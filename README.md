# SunFacing

## Idea and motivation
How much of the activity is while the sun is up? 
How much is during sunrise/sunset? 
And not least - how much of the trip is with the sun in the middle of the face?
Can one create a variable that measures "SunFacing"? 
Can this variable be logged together with the activity? 
Can statics be calculated and presented?

metrics:
- SunFacing-pst
- SessionStats 
- LapStats

Register all data points with SunFacing?
or count per category (category is angle segments)

## TODO
- [x] Etablere prosjekt
- [x] Lagre "heading" i FIT-fil
- [x] Beregne statistikk
- [ ] Lagre statistikk    
- [ ] Lagre "SunFacing" i FIT-fil

## Arkitektur

xxx

## Implementing datafield in FIT-recording

Add a new metric - SunSeeker - to the app. This metric tell how much a activities direction towards the sun (into a single value). To do this we need the Toybox.FitContributor module, which allows to add new metrics to a FIT recording and display it on Garmin Connect.
1)  enable the ´FitContributor´ permission in the manifest
2)  add your field definitions in your resources using the ´fitContributions´ block
3)  define metadata to display our chart to Garmin Connect via ´fitField´
4)  create our Field in the code by using the ´Session.createField()´ method of the ´Session´ object within your source.
More info: https://developer.garmin.com/connect-iq/core-topics/activity-recording/


A sample "Data Field"-project that uses barrels, app settings, on-device app settings, FIT Developer Fields, and unit tests: https://github.com/garmin/connectiq-apps/tree/master/datafields/GenericAntPlusHeartRateField


# Notes to self while coding

https://www.fitfileviewer.com/

