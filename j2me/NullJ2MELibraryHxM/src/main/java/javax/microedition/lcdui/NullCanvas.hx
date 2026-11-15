// Generated Code Do Not Modify
package javax.microedition.lcdui;

import jre.util.Stack;

class NullCanvas extends Canvas {
    public static final NULL_CANVAS : NullCanvas = new NullCanvas();
    public function new() {
        super();
    }

    public override function setFullScreenMode(mode : Bool) : Void {
    }

    public override function sizeChanged(w : Int, h : Int) : Void {
    }

    public function getCommandStack() : Stack<Any> {
        throw new jre.lang.JavaException();
    }

    public function isCommand(command : Command) : Bool {
        throw new jre.lang.JavaException();
    }

    public override function addCommand(command : Command) : Void {
    }

    public override function removeCommand(command : Command) : Void {
    }

    public function removeAllCommands() : Void {
    }

    public override function setCommandListener(l : CommandListener) : Void {
    }

    public function getCustomCommandListener() : CommandListener {
        throw new jre.lang.JavaException();
    }

    public function isPaused() : Bool {
        throw new jre.lang.JavaException();
    }

    public function removePauseCommand() : Void {
    }

    public function pause() : Void {
    }

    public function unPause() : Void {
    }

    // throws Exception
    public function process() : Void {
    }

    public override function paint(graphics : Graphics) : Void {
    }

    public function destroy() : Void {
    }

    public function setPaused(isPaused : Bool) : Void {
        throw new jre.lang.JavaException();
    }

    public override function pointerDragged(x : Int, y : Int) : Void {
    }

    public override function pointerPressed(x : Int, y : Int) : Void {
    }

    public override function pointerReleased(x : Int, y : Int) : Void {
    }

}

