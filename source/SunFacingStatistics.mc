//import SimpleStats;


class SunFacingStatistics{

	public var Front;
	public var Right;
	public var Left;
	public var Back;

	function initialize() {
		Front = new SimpleStats();
		Right = new SimpleStats();
		Left = new SimpleStats();
		Back = new SimpleStats();
	}
    
    function setSunFacingAngle(value) {

        value = reduseHeading(value);

        if(value >= -45 && value < 45) {
            Front.setData(value);
        } else if(value >= 45 && value < 135) {
            Right.setData(value);
        } else if(value < -45 && value >= -135) {
            Left.setData(value);
        } else {
            Back.setData(value);
        }

		return self;
	}

    function count() {
        var totalCount = Front.count() + Right.count() + Left.count() + Back.count();
        return totalCount;
    }
    
    function SunFacingPst() { 

        var totalCount = self.count().toDouble();
        
        if (totalCount==0) {
            return 0;
        }
        
        var SunFacingPst = Front.count().toDouble() / totalCount * 100.0;

        return SunFacingPst; 
    }

    function reset() {
        Front.reset();
        Right.reset();
        Left.reset();
        Back.reset();
	}
}