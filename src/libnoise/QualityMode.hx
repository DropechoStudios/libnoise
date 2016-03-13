package libnoise;

//Dirty hack to expose enum in js
#if js

enum QualityMode {
	LOW;
	MEDIUM;
	HIGH;
}

@:expose("libnoise.QualityMode")
class E_QualityMode {
    public static var LOW   : QualityMode = QualityMode.LOW;
    public static var MEDIUM: QualityMode = QualityMode.MEDIUM;
    public static var HIGH  : QualityMode = QualityMode.HIGH;
}

#else

enum QualityMode {
	LOW;
	MEDIUM;
	HIGH;
}

#end
