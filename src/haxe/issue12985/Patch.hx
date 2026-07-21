package haxe.issue12985;

import haxe.macro.Expr;
import haxe.macro.Context;

using Lambda;

class Patch {
	#if macro
	public static function patch() {
		var fields = Context.getBuildFields();

		fields = fields.concat((macro class {
			static var __haxe12985_mainThread:sys.thread.Thread;
		}).fields);

		switch fields.find(f -> f.name == 'init') {
			case {kind: FFun(body = {expr: {expr: EBlock(exprs)}})}:
				exprs.push(macro __haxe12985_mainThread = sys.thread.Thread.current());
			case _:
				Context.error('init function not found', Context.currentPos());
		}

		return fields;
	}
	#end
}
