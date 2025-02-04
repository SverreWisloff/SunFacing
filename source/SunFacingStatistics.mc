import Toybox.Lang;


class SunFacingStatistics{

	public var Front;
	public var Right;
	public var Left;
	public var Back;

	function initialize() {
		Front = new SimpleStats();
		Right = new SimpleStats();
		Left  = new SimpleStats();
		Back  = new SimpleStats();
	}
    
    function setSunFacingAngle(value) {

        var angle = reduseHeading(value); //angle = <-180.0, 180.0>

        if(angle >= -45 && angle < 45) {
            Front.setData(value);
        } else if(angle >= 45 && angle < 135) {
            Right.setData(value);
        } else if(angle < -45 && angle >= -135) {
            Left.setData(angle);
        } else {
            Back.setData(angle);
        }

		return self;
	}

    function count() {
        var totalCount = Front.count() + Right.count() + Left.count() + Back.count();
        return totalCount;
    }
    
    function SunFacingPst() { 

        if (self.count()<=0){
            return 0.0; //No data
        }
                        
        var SunFacingPst = Front.count().toDouble() / self.count().toFloat() * 100.0;

        return SunFacingPst; 
    }

    function reset() {
        Front.reset();
        Right.reset();
        Left.reset();
        Back.reset();
	}

    function printPst() as String {

        if (self.count()<=0){
            return "No data";
        }
        
        var FrontPst = Front.count().toDouble() / self.count() * 100.0;
        var RightPst = Right.count().toDouble() / self.count() * 100.0;
        var LeftPst  = Left.count().toDouble()  / self.count() * 100.0;
        var BackPst  = Back.count().toDouble()  / self.count() * 100.0;

        var returnString = "Front: " + FrontPst.toNumber() + "%, Right: " + RightPst.toNumber() + "%, Left: " + LeftPst.toNumber() + "%, Back: " + BackPst.toNumber() + "%";

        return returnString;
	}

}