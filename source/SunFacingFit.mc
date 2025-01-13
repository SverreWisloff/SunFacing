
using Toybox.WatchUi;
using Toybox.FitContributor as Fit;


const SUN_FACING_FIELD_RECORD_ID = 0;
const SUN_FACE_NATIVE_NUM_RECORD_MESG = 3;
const SUN_FACE_UNITS = "degrees";


class SunFacingFit {

    hidden var mTimerRunning = false;
    hidden var mSunFacingRecordField;
    
    function initialize(dataField) {
        mSunFacingRecordField = dataField.createField("sun_facing", SUN_FACING_FIELD_RECORD_ID, Fit.DATA_TYPE_UINT8, { :nativeNum=>SUN_FACE_NATIVE_NUM_RECORD_MESG, :mesgType=>Fit.MESG_TYPE_RECORD, :units=>SUN_FACE_UNITS });
    }

    function setSunFacingData(SunFacing) {
        mSunFacingRecordField.setData(SunFacing);
    }

    function onNextMultisportLeg() {
    	//mSessionStats.reset();
    	//mLapStats.reset();
    }

    function onTimerLap() {
    	//mLapStats.reset();
    }
    
    function onTimerReset() {
    	//mSessionStats.reset();
    	//mLapStats.reset();
    }
    
    function onTimerPause() {
    	mTimerRunning = false;
    }
    
    function onTimerResume() {
        mTimerRunning = true;
    }
    
    function onTimerStart() {
        mTimerRunning = true;
    }

    function onTimerStop() {
        mTimerRunning = false;
    }    
}