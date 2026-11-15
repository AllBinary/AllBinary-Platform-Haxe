// Generated Code Do Not Modify
package org.allbinary.business.advertisement;

import org.allbinary.game.GameAdState;
import org.allbinary.logic.system.SoftwareInformation;

class GameAdStateFactory implements GameAdStateFactoryInterface {
    private static final instance : GameAdStateFactory = new GameAdStateFactory();
    public static function getInstance() : GameAdStateFactory {
        return GameAdStateFactory.instance;
    }

    private final gameAdStateArray : haxe.ds.Vector<GameAdState> = haxe.ds.Vector.fromArrayCopy([new GameAdState(new AppNameLicensingAdConfiguration())]);
    private var gameAdState : GameAdState;
    public function getCurrentInstance() : GameAdState {
        return this.gameAdState;
    }

    // throws Exception
    public function getInstanceForApp(softwareInformation : SoftwareInformation) : GameAdStateBase {
        this.gameAdState = this.gameAdStateArray[0];
        return this.gameAdStateArray[0];
    }

    public function isEnabled() : Bool {
        return false;
    }

    public function new() {
        this.gameAdState = this.gameAdStateArray[0];
    }
}

