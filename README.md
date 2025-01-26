# SunFacing

## Idea and motivation
How much of the activity is while the sun is up? 
How much is during sunrise/sunset? 
And not least - how much of the trip is with the sun in the middle of the face?
Can one create a variable that measures "SunFacing"? 
Can this variable be logged together with the activity? 
Can statics be calculated and presented?

### possible metrics:
- SunFacing-deg: Relative angle-difference between the sun's azimuth and the direction/heading of the apparent activity 
- SunFacing-pst: Percentage of session activity where the direction has had the sun at 45 degrees relative to the apparent direction. Both for the entire session, and for each lap

# Notes to self while coding

## Implementing datafield in FIT-recording

Add a new metric - SunSeeker - to the app. This metric tell how much a activities direction towards the sun (into a single value). To do this we need the Toybox.FitContributor module, which allows to add new metrics to a FIT recording and display it on Garmin Connect.
1)  enable the ´FitContributor´ permission in the manifest
2)  add your field definitions in your resources using the ´fitContributions´ block
3)  define metadata to display our chart to Garmin Connect via ´fitField´
4)  create our Field in the code by using the ´Session.createField()´ method of the ´Session´ object within your source.
More info: https://developer.garmin.com/connect-iq/core-topics/activity-recording/

## A good sample project

A sample "Data Field"-project that uses barrels, app settings, on-device app settings, FIT Developer Fields, and unit tests: https://github.com/garmin/connectiq-apps/tree/master/datafields/GenericAntPlusHeartRateField

## Importent

To see the data in Garmin Connect, you have to have installed the app from the app store (you can make it a beta app so only you can download it while testing)

## Viewing fit-file

https://www.fitfileviewer.com/


# TODO
- [x] Etablere prosjekt
- [x] Lagre "heading" i FIT-fil
- [x] Beregne statistikk
- [ ] Se data på Garmin connect
- [ ] Lagre statistikk    
- [ ] Lagre "SunFacing" i FIT-fil

