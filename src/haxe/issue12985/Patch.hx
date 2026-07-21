package haxe.issue12985;

#if macro
class Patch {
	public static function patch() {
		tink.SyntaxHub.transformMain.whenever(expr -> {
			if (haxe.macro.Context.defined("java")) {
				macro {
					static final __haxe12985_mainThread = sys.thread.Thread.current();
					$expr;
				};
			} else {
				expr;
			}
		});
	}
}
#else
#error
#end
