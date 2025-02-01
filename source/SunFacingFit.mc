
using Toybox.WatchUi;
using Toybox.FitContributor as Fit;


const SUN_FACING_FIELD_RECORD_ID = 0;
const SUN_FACING_FIELD_SESSION_PST_ID = 1;
const SUN_FACING_FIELD_LAP_PST_ID = 2;

//const SUN_FACING_NATIVE_NUM_RECORD_MESG = 3;

//const SUN_FACING_NATIVE_NUM_LAP_MIN_MESG = 63;
//const SUN_FACING_NATIVE_NUM_SESSION_RATE_MESG = 64;

const SUN_FACING_UNITS = "index";
const SUN_FACING_PST_UNITS = "pst";


class SunFacingFit {

    hidden var mSunFacingRecordField;
    hidden var mSunFacingRateSessionField;
    hidden var mSunFacingRateLapField;

    hidden var mTimerRunning = false;

	hidden var mSessionStats;
	hidden var mLapStats;

    function initialize(dataField) {
        var sunFacingIndexLabel = Application.loadResource(Rez.Strings.sunfacing_index_label);
//        mSunFacingRecordField = dataField.createField(sunFacingDegLabel, SUN_FACING_FIELD_RECORD_ID, Fit.DATA_TYPE_FLOAT, { :nativeNum=>SUN_FACING_NATIVE_NUM_RECORD_MESG, :mesgType=>Fit.MESG_TYPE_RECORD, :units=>SUN_FACING_UNITS });
        mSunFacingRecordField = dataField.createField(sunFacingIndexLabel, SUN_FACING_FIELD_RECORD_ID, Fit.DATA_TYPE_UINT8, {                                                :mesgType=>Fit.MESG_TYPE_RECORD, :units=>SUN_FACING_UNITS });
		
        var sunFacingSummaryPstLabel = Application.loadResource(Rez.Strings.sunfacing_summary_pst_label);
//        mSunFacingRateSessionField = dataField.createField(sunFacingSummaryPstLabel, SUN_FACING_FIELD_SESSION_PST_ID, Fit.DATA_TYPE_FLOAT, { :nativeNum=>SUN_FACING_NATIVE_NUM_SESSION_RATE_MESG, :mesgType=>Fit.MESG_TYPE_SESSION, :units=>SUN_FACING_PST_UNITS });
        mSunFacingRateSessionField = dataField.createField(sunFacingSummaryPstLabel, SUN_FACING_FIELD_SESSION_PST_ID, Fit.DATA_TYPE_FLOAT, {                                                      :mesgType=>Fit.MESG_TYPE_SESSION, :units=>SUN_FACING_PST_UNITS });
       
        var sunFacingLapsPstLabel = Application.loadResource(Rez.Strings.sunfacing_laps_pst_label);
//        mSunFacingRateLapField = dataField.createField(sunFacingLapsPstLabel, SUN_FACING_FIELD_LAP_PST_ID, Fit.DATA_TYPE_FLOAT, { :nativeNum=>SUN_FACING_NATIVE_NUM_LAP_MIN_MESG, :mesgType=>Fit.MESG_TYPE_LAP, :units=>SUN_FACING_PST_UNITS });
        mSunFacingRateLapField = dataField.createField(sunFacingLapsPstLabel, SUN_FACING_FIELD_LAP_PST_ID, Fit.DATA_TYPE_FLOAT, {                                               :mesgType=>Fit.MESG_TYPE_LAP, :units=>SUN_FACING_PST_UNITS });

        mSessionStats = new SunFacingStatistics();
		mLapStats = new SunFacingStatistics();    
    }

    function setSunFacingData(SunFacingHeading) {
        mSunFacingRecordField.setData(SunFacingHeading);

        if(mTimerRunning) {
            mSessionStats.setData(SunFacingHeading);
            mLapStats.setData(SunFacingHeading);

       		mSunFacingRateSessionField.setData(mSessionStats.SunFacingPst());
            mSunFacingRateLapField.setData(mLapStats.SunFacingPst());
    	}
    }

    function onNextMultisportLeg() {
    	mSessionStats.reset();
    	mLapStats.reset();
        System.println("Session reset AND Lap reset");
    }

    function onTimerLap() {
    	mLapStats.reset();
        System.println("Lap reset");
    }
    
    function onTimerReset() {
    	mSessionStats.reset();
    	mLapStats.reset();
        System.println("Session reset AND Lap reset");
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