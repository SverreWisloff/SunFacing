# SunFacing

## Ide
Hvor stor del av turen er mens sola er oppe? Hvor stor del er i soloppgang/solnedgang? Og ikke minst - hvor stor del av turen er med sola midt i trynet?
Kan man lage en variabel som måler "SunFacing"? Kan denne variabelen logges sammen med aktiviteten? Kan statikk beregnes og presenteres?

metrics:
SunFacing-pst
SessionStats 
LapStats

Registrere alle datapiunkter med SunFacing?
eller telle opp pr kategori (kategori er vinkelsegmenter)

## TODO
- [x] Etablere prosjekt
- [ ] Lagre "heading" i FIT-fil
- [ ] Beregne statistikk    
- [ ] Lagre "SunFacing" i FIT-fil

## Arkitektur

SessionData
- setData(SunFacing)
- getCategory(cat)


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

