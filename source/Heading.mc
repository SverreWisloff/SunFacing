import Toybox.System;
import Toybox.Position;
import Toybox.Math;
import Toybox.Lang;



// Reduces heading to range -180 to 180
function reduseHeading(heading) {
    var returnHeading;
    if(heading < -180) {
        returnHeading = heading + 360;
    } else if(heading >= 180) {
        returnHeading = heading - 360;
    } else {
        returnHeading = heading;
    }
    return returnHeading;
}


class Heading {

    private var _heading = 0.0 as Double;

    // Constructor
    function initialize() {
        // Initialization code here
        _heading = 0.0;
    }

    // Method to set the heading
    function setHeading(heading as Double) {
        _heading = heading;
    }

    // Method to get the heading
    function getHeading() as Double {
        return _heading;
    }

    // Method to get the heading
    function getSunFacingPst() as Double {
        var SunFacingPst=0.0 as Double;
        self.reduceHeading(true);
        if (_heading.abs() < 90.0) {
            SunFacingPst = 100.0 - (_heading/90.0 * 100.0).abs();
        }
        else  {
            SunFacingPst = 0.0;
        }
        return SunFacingPst;
    }

    // Method to get the heading as a Double
    function toDouble() as Double {
        return _heading;
    }

    // Method to update the heading based on some input
    function updateHeading(newHeading as Double) {
        _heading = newHeading;
    }

    // Method to get the heading as a string
    function getHeadingString() as Lang.String {
        return _heading.toString() + "°";
    }

    // Overloading the + operator
    function add(other as Heading) as Heading {
        var newHeading = new Heading();
        newHeading.setHeading((self._heading + other.getHeading()) % 360);
        return newHeading;
    }

    // Overloading the - operator
    function subtract(other as Heading or Double) as Heading {
        var newHeading = new Heading();
        var otherDeg = other.toDouble();
        newHeading.setHeading(self._heading - otherDeg);
        newHeading.reduceHeading(true);
        return newHeading;
    }

    // Method to reduce the heading to be within -180 to 180 degrees
    function reduceHeading(update as Boolean) as Double {
        var reducedHeading = _heading;
        if (reducedHeading > 180.0) {
            reducedHeading -= 360.0;
        } else if (reducedHeading < -180.0) {
            reducedHeading += 360.0;
        }
        if (update) {
            _heading = reducedHeading;
        }
        return reducedHeading;
    }
}