import Toybox.Activity;
import Toybox.Lang;
import Toybox.Time;
import Toybox.WatchUi;
import Toybox.Math;

class SunFacingView extends WatchUi.SimpleDataField {

    hidden var mSunFacingFit;

    // Set the label of the data field here.
    function initialize() {
        SimpleDataField.initialize();
        label = "SunFacing";

        mSunFacingFit = new SunFacingFit(self);
    }

    // The given info object contains all the current workout
    // information. Calculate a value and return it in this method.
    // Note that compute() and onUpdate() are asynchronous, and there is no
    // guarantee that compute() will be called before onUpdate().
    function compute(info as Activity.Info) as Numeric or Duration or String or Null {
        // See Activity.Info in the documentation for available information.
        
        var SunFacingHeading = info.currentHeading/Math.PI*180;

        mSunFacingFit.setSunFacingData(SunFacingHeading);

        return SunFacingHeading;
    }


    function onNextMultisportLeg() {
    	mSunFacingFit.onNextMultisportLeg();
    }
    
    function onTimerLap() {
    	mSunFacingFit.onTimerLap();
    }
    
    function onTimerReset() {
    	mSunFacingFit.onTimerReset();
    }
    
    function onTimerPause() {
    	mSunFacingFit.onTimerPause();
    }
    
    function onTimerResume() {
    	mSunFacingFit.onTimerResume();
    }
    
    function onTimerStart() {
    	mSunFacingFit.onTimerStart();
    }
    
    function onTimerStop() {
    	mSunFacingFit.onTimerStop();
    }

}