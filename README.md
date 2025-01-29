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

## App-info

_The goal of this project is to create a Garmin data-field that compute SunFacing which shows the angle the sun is in relation to the direction of activity. And how much of the activity where the sun was right in your face._

This datafield app compute SunFacing which is the angle the sun is in relation to the direction of activity. 

For example, 0 degrees means that we are moving directly towards the sun. 180 degrees means that the sun is directly behind us. 

After the activity, some statistics are calculated. The app calculates how much of the activity, and the lap, where the sun was within 45 degrees. That is, how much of the activity where the sun was right in your face.

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

## Important

To see the data in Garmin Connect, you have to have installed the app from the app store (you can make it a beta app so only you can download it while testing)

## Viewing fit-file

https://www.fitfileviewer.com/

## Unit testing
[Unit Testing](https://developer.garmin.com/connect-iq/core-topics/unit-testing/) docs.

An [example](https://github.com/ferranpujolcamins/GarminApps/tree/main/BarrelTests/tests/Shared_IQ_1_4_0). 

A nice [tutorial](https://starttorun.info/tutorial-create-connect-iq-unit-tests/).



# TODO
- [ ] Filtrere vekk tidspunkt når sola er nede
- [ ] Test-rammeverk i monkey-c? 
[Unit Testing](https://developer.garmin.com/connect-iq/core-topics/unit-testing/) docs. 
An [example](https://github.com/ferranpujolcamins/GarminApps/tree/main/BarrelTests/tests/Shared_IQ_1_4_0). 
A nice [tutorial](https://starttorun.info/tutorial-create-connect-iq-unit-tests/). 
- [ ] Publisere på garmin connect
- [x] Etablere prosjekt
- [x] Lagre "heading-deg" i FIT-fil
- [x] Lagre "heading-statistikk" for lap og sesion i FIT-fil
- [x] Beregne SunFacing-deg 
- [x] Lage Beta-versjon i app store for se og teste data på Garmin connect 
- [x] Se data på Garmin connect
- [x] Lagre statistikk    
- [x] Lagre "SunFacing" i FIT-fil

