package;

function main() {
	// trace(sys.thread.Thread.main()); // uncomment to fix
	final t = new java.lang.Thread(new Task());
	t.start();
	t.join();
}

class Task implements java.lang.Runnable {
	public function new() {}

	public function run() {
		#if haxe5
		haxe.EventLoop.main.run(() -> trace("run in main loop"));
		#else
		haxe.EntryPoint.runInMainThread(() -> {
			trace("run in main loop");
		});
		#end
	}
}
