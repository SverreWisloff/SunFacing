# SunFacing
_The goal of this project is to create a Garmin data-field that compute SunFacing which shows how much of the activity where the sun was right in your face._

## Idea and motivation
How much of the activity is while the sun is up? 
How much is during sunrise/sunset? 
And not least - how much of the trip is with the sun in the middle of the face?
Can one create a variable that measures "SunFacing"? 
Can this variable be logged together with the activity? 
Can statics be calculated and presented?

### SunFacing metrics:
- **SunFacing-angle**: Relative angle-difference between the sun's azimuth and the direction/heading of the apparent activity.
- **SunFacing-index**: index that tells how directly towards the sun the activity is at any given time. Index=100 is directly towards the sun, =50 with the sun 45 degrees to the side, and =0 is 90 degrees to the side, and =0 90 and backwards. 
- **SunFacing-pst**: Percentage of session activity where the direction has had the sun at 45 degrees relative to the apparent direction. Both for the entire session, and for each lap.

## App-info
This data field app calculates the Sun-Facing Index, which measures how directly an activity is oriented toward the sun. The index is 100 when the activity is facing the sun directly and 0 when the sun is at a 90-degree angle to the side.

After the activity, the app provides statistics on how much of the time the sun was directly in front of you. Specifically, it calculates the percentage of the activity where the sun was within 45 degrees of your apparent direction.

## Screenshot
![screehot](https://github.com/SverreWisloff/SunFacing/blob/main/screenshot/gc-sunfacing-index.jpg?raw=true)


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

## Debug compiler-instructions
(:release)
const DEBUG = false;
(:debug)
const DEBUG = true;

## Unit testing
[Unit Testing](https://developer.garmin.com/connect-iq/core-topics/unit-testing/) docs.

An [example](https://github.com/ferranpujolcamins/GarminApps/tree/main/BarrelTests/tests/Shared_IQ_1_4_0). 

A nice [tutorial](https://starttorun.info/tutorial-create-connect-iq-unit-tests/).

# TODO
- [ ] Moving average on angles
- [ ] Simple moving average on SF-angle instedof SF-index
- [ ] Publisere på garmin connect
- [ ] Test-rammeverk i monkey-c? 
[Unit Testing](https://developer.garmin.com/connect-iq/core-topics/unit-testing/) docs. 
An [example](https://github.com/ferranpujolcamins/GarminApps/tree/main/BarrelTests/tests/Shared_IQ_1_4_0). 
A nice [tutorial](https://starttorun.info/tutorial-create-connect-iq-unit-tests/). 
- [x] Etablere prosjekt
- [x] Lagre "heading-deg" i FIT-fil
- [x] Lagre "heading-statistikk" for lap og sesion i FIT-fil
- [x] Beregne SunFacing-deg 
- [x] Lage Beta-versjon i app store for se og teste data på Garmin connect 
- [x] Se data på Garmin connect
- [x] Lagre statistikk    
- [x] Lagre "SunFacing" i FIT-fil
- [x] Heading hopper mye, implementere lowpass-filter
- [x] Vinkel vaskelig å forstå, bruke index isf
- [x] Filtrere vekk tidspunkt når sola er nede

