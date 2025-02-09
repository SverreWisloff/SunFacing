import Toybox.System;
import Toybox.Position;
import Toybox.Math;
import Toybox.Lang;



// Reduces heading to range -180 to 180. heading=<-180.0, 180.0>
function reduseHeadingDeg(heading) {
    var returnHeading;
    heading = heading.toFloat();
    if(heading < -180.0) {
        returnHeading = heading + 360.0;
    } else if(heading >= 180.0) {
        returnHeading = heading - 360.0;
    } else {
        returnHeading = heading;
    }
    return returnHeading;
}


class Heading {

    private var _heading = 0.0 as Double; //Radians

    // Constructor
    function initialize() {
        // Initialization code here
        _heading = 0.0;
    }

    // Method to set the heading
    function setHeadingRad(heading as Double) {
        //TODO validate heading
        _heading = heading;
    }

    // Method to set the heading
    function setHeadingDeg(heading as Double) {
        //TODO validate heading
        _heading = heading * Math.PI / 180.0;
    }

    // Method to get the heading
    function getHeadingRad() as Double {
        return _heading;
    }

    // Method to get the heading
    function getHeadingDeg() as Double {
        return _heading * 180.0 / Math.PI;
    }

    // Method to get the SunFacing Index
    // TODO - define SunFacing Index algorithm
    function getSunFacingIndex() as Number {
        var SunFacingIndex;
        self.reduceHeading(true);
        var degHeading = self.getHeadingDeg();

        if (degHeading.abs() < 90.0) {
            SunFacingIndex = 100.0 - (degHeading/90.0 * 100.0).abs();
        }
        else  {
            SunFacingIndex = 0.0;
        }

        return SunFacingIndex.toNumber();
    }

    // Method to get the heading in radians as a Double
    function toDouble() as Double {
        return _heading;
    }
/*
    // Method to update the heading based on some input
    function updateHeading(newHeading as Double) {
        _heading = newHeading;
    }
*/
    // Method to get the heading as a string
    function getHeadingString() as Lang.String {
        return self.getHeadingDeg().toString() + "°";
    }

    // Overloading the + operator
    function add(other as Heading) as Heading {
        var newHeading = new Heading();
        newHeading.setHeadingRad((self._heading + other.getHeadingRad()));
        return newHeading;
    }

    // Overloading the - operator
    function subtract(other as Heading or Double) as Heading {
        var newHeading = new Heading();
        var otherRad = other.toDouble();
        newHeading.setHeadingRad(self._heading - otherRad);
        newHeading.reduceHeading(true);
        return newHeading;
    }

    // Method to reduce the heading to be within -180 to 180 degrees
    function reduceHeading(update as Boolean) as Double {

        var reducedHeadingDeg = reduseHeadingDeg(self.getHeadingDeg()); //heading=<-180.0, 180.0>

        if (update) {
            self.setHeadingDeg(reducedHeadingDeg);
        }
        return reducedHeadingDeg;
    }

    // self.Heading is the signal
    function lowpass(signal as Heading, dempning as Float) {
        //var returnHeading = new Heading();

        self.reduceHeading(true);           //signal=<-180.0, 180.0>
        signal.reduceHeading(true);    //last  =<-180.0, 180.0>

        var xSignal = Math.cos(signal.getHeadingRad());
        var ySignal = Math.sin(signal.getHeadingRad());

        var xLast = Math.cos(_heading);
        var yLast = Math.sin(_heading);

        var xFilteredSignal = (xSignal * dempning) + ( xLast * (1.0-dempning) );
        var yFilteredSignal = (ySignal * dempning) + ( yLast * (1.0-dempning) );

        var filteredHeading = Math.atan2(yFilteredSignal, xFilteredSignal);

        System.println("Signal=" + signal.getHeadingDeg() + " Last=" + self.getHeadingDeg() + " Filtered=" + filteredHeading * 180.0 / Math.PI);

        self.setHeadingRad(filteredHeading);

        return ;
    }

}