//import SimpleStats;


class SunFacingStatistics{

	public var Nort;
	public var East;
	public var West;
	public var Sout;

	function initialize() {
		Nort = new SimpleStats();
		East = new SimpleStats();
		West = new SimpleStats();
		Sout = new SimpleStats();
	}
    
    function setSunFacingAngle(value) {

        value = reduseHeading(value);

        if(value >= -45 && value < 45) {
            Nort.setData(value);
        } else if(value >= 45 && value < 135) {
            East.setData(value);
        } else if(value < -45 && value >= -135) {
            West.setData(value);
        } else {
            Sout.setData(value);
        }

		return self;
	}

    function count() {
        var totalCount = Nort.count() + East.count() + West.count() + Sout.count();
        return totalCount;
    }
    
    function SunFacingPst() { 

        var totalCount = self.count().toDouble();
        
        if (totalCount==0) {
            return 0;
        }
        
        var SunFacingPst = Nort.count().toDouble() / totalCount * 100.0;

        return SunFacingPst; 
    }

    function reset() {
        Nort.reset();
        East.reset();
        West.reset();
        Sout.reset();
	}
}