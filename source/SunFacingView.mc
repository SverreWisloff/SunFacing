import Toybox.Activity;
import Toybox.Lang;
import Toybox.Time;
import Toybox.WatchUi;
import Toybox.Math;
import Toybox.Position;
import SunCalcModule;


class SunFacingView extends WatchUi.SimpleDataField {

    hidden var mSunFacingFit;
    private var _sc;
    public var _sunAltitude;
    public var _sunAzimuth as Heading;
    public var _lastSunAzimuth = null as Time.Moment;
    private var lastSunFaceIndex;


    // Set the label of the data field here.
    function initialize() {
        SimpleDataField.initialize();
        label = "SunFacing";
        lastSunFaceIndex=0;

        mSunFacingFit = new SunFacingFit(self);
        
        _sc = new sunCalc();
        _sunAzimuth = new Heading();
        _sunAltitude = -1.0;

        initialize_SunCalc();
    }

    function initialize_SunCalc(){
		var locationInfo = Position.getInfo();
		if (locationInfo == null || locationInfo.position == null) {
			return;
		}
		var location = locationInfo.position.toDegrees();
		if ((Math.round(location[0]) == 0 && Math.round(location[1]) == 0) ||
			Math.round(location[0]) == 180 && Math.round(location[1]) == 180) {
			return;
		}

        var now = Time.now();
        var momentNow = new Time.Moment(now.value() );            

        if (location != null) {
            var latitude = location[0].toDouble();
            var longitude = location[1].toDouble();
            _sc.setPosition(latitude, longitude);
            _sc.setDate(momentNow.value());
            var sunCoordLocal = _sc.getSunPosition();

            _sunAzimuth.setHeadingDeg(sunCoordLocal.azimuth-180.0);
            _sunAltitude = sunCoordLocal.altitude;
            _lastSunAzimuth = momentNow;

            //DEBUG
            //System.println( _sc.PrintTime(momentNow.value(), "initialize_SunCalc") + " latitude=" + latitude + " longitude=" + longitude + " sunAzimuth=" + _sunAzimuth.reduceHeading(false));
		}

        return;
    }

    // The given info object contains all the current workout
    // information. Calculate a value and return it in this method.
    // Note that compute() and onUpdate() are asynchronous, and there is no
    // guarantee that compute() will be called before onUpdate().
    function compute(info as Activity.Info) as Numeric or Duration or String or Null {
        // See Activity.Info in the documentation for available information. 

        if (_sc.getKnownPosition()==false){
            initialize_SunCalc();
        }

        //Compute time difference between now and last sun azimuth calculation
        if (_lastSunAzimuth!=null) {
            var now = Time.now();
            var momentNow = new Time.Moment(now.value() );
            var timeDiffSeconds = momentNow.compare(_lastSunAzimuth);
            if (timeDiffSeconds > 60) {
                //Recalculate sun azimuth every 1 minutes
                initialize_SunCalc();
            }
        }
        
        //Track is the direction of travel in radians based on GPS movement. If supported by the device, this provides compass orientation when stopped.
        var SunFacingAngle;
        var SunFacingIndex=0;
        var heading = 0.0;

        if (info.track>=0.00001 || info.track<=-0.00001) {
            heading = info.track;
        }
        else {
            heading = info.currentHeading;
        }

        SunFacingAngle = _sunAzimuth.subtract(heading.toDouble());

        //DEBUG
        //TODO
        _sunAltitude=1.0;
        
        if (_sunAltitude>=0.0){
            SunFacingIndex = SunFacingAngle.getSunFacingIndex();

            //Simple moving average
            var dempning = 0.8;
            SunFacingIndex = lastSunFaceIndex*dempning + SunFacingIndex*(1.0-dempning);
            lastSunFaceIndex=SunFacingIndex;

            SunFacingIndex = SunFacingIndex.toNumber();

            //DEBUG
            //System.println("sunAzimuth=" + _sunAzimuth.toDouble() + " heading=" + heading.toDouble() + " SunFacingAngle=" + SunFacingAngle.getHeading() + " SunFacingIndex=" + SunFacingIndex);

            mSunFacingFit.setSunFacingData(SunFacingAngle.getHeadingDeg(), SunFacingIndex);
        }
        return SunFacingIndex;
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