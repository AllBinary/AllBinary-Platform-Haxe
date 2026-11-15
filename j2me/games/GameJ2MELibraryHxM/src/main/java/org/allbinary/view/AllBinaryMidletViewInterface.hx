// Generated Code Do Not Modify
package org.allbinary.view;

import org.allbinary.game.configuration.event.GameInitializedListenerInterface;
import org.allbinary.game.midlet.DemoGameMidletEventListener;
import org.allbinary.midlet.MidletCompositeInterface;

interface AllBinaryMidletViewInterface extends MidletCompositeInterface extends EmulatorViewInterface extends DemoGameMidletEventListener extends GameInitializedListenerInterface {
    function onResume() : Void;

    function onPause() : Void;

    function onDestroy() : Void;

}

