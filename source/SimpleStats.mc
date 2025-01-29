const MIN_VALUE = -0x7FFFFFFF;
const MAX_VALUE = 0x7FFFFFFF;

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
