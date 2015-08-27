package libnoise.operator;

/**
 * Provides a noise module that caches the last output value generated by a source
 * module. [OPERATOR]
 */
class Cache extends ModuleBase {

	var value : Float;
	var cached : Bool;
	var cx : Float;
	var cy : Float;
	var cz : Float;

	/**
	 *	Initializes a new instance of Cache.
     *  @param "input" The input module
	 */
	public function new(input : ModuleBase) {
		super(1);
		set(0,input);
	}

	override public function getValue(x : Float, y : Float, z : Float){
		if (!(cached && cx == x && cy == y && cz == z))
		{
			value = get(0).getValue(x, y, z);
			cx = x;
			cy = y;
			cz = z;
		}
		cached = true;
		return value;
	}
}
