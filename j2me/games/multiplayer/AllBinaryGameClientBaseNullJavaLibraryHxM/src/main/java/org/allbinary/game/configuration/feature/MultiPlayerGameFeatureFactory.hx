// Generated Code Do Not Modify
package org.allbinary.game.configuration.feature;

import javax.microedition.lcdui.Canvas;
import org.allbinary.game.commands.GameCommandsFactory;

class MultiPlayerGameFeatureFactory {
    private static final instance : MultiPlayerGameFeatureFactory = new MultiPlayerGameFeatureFactory();
    public static function getInstance() : MultiPlayerGameFeatureFactory {
        return MultiPlayerGameFeatureFactory.instance;
    }

    public function new() {
    }

    public function addCommands(anyType : Any) : Void {
        final gameCommandsFactory : GameCommandsFactory = GameCommandsFactory.getInstance();
        final canvas : Canvas = (cast anyType : Canvas);
        canvas.addCommand(gameCommandsFactory.QUIT_COMMAND);
    }

}

