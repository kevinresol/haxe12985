package;

function main() {
	// trace(sys.thread.Thread.main()); // uncomment to fix
	final t = new java.lang.Thread(() -> {
		trace(sys.thread.Thread.current() == sys.thread.Thread.main()); // prints true?! huh?
		trace(haxe.EventLoop.main.run(() -> trace("run in main loop")));
	});

	t.start();
	t.join();
}
