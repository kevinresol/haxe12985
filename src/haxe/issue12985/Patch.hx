package haxe.issue12985;

#if macro
class Patch {
	public static function patch() {
		tink.SyntaxHub.transformMain.whenever(expr -> {
			if (haxe.macro.Context.defined("java")) {
				macro {
					static var __haxe12985:Dynamic;
					inline function foo(v:Dynamic)
						__haxe12985 = v;

					#if haxe5
					foo(sys.thread.Thread.current());
					#else
					foo(@:privateAccess haxe.EntryPoint.mainThread);
					#end
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
