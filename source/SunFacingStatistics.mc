const MIN_VALUE = -0x7FFFFFFF;
const MAX_VALUE = 0x7FFFFFFF;

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

class SimpleStats{

	private var _last;
	private var _min;
	private var _max;
	private var _count;
	private var _total;

	function initialize() {
		reset();
	}

	function last() { return _last; }
	function min() { return _min; }
	function max() { return _max; }
	function avg() { return _total.toFloat() / ( _count > 0 ? _count : 1); }
	function count() { return _count; }
	function total() { return _total; }
    
    function setData(value) {
		_last = value;
		_min = value < _min ? value : _min;
		_max = value > _max ? value : _max;

		_total += value;
		_count++;

		return self;
	}
    function reset() {
		_last = null;
		_min = MAX_VALUE;
		_max = MIN_VALUE;
		_count = 0;
		_total = 0;
	}
}

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

    
    function setData(value) {

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