// Generated Code Do Not Modify
package org.allbinary.game.input.analog;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class AnalogLocationInputFactory {
    private static final instance : AnalogLocationInputFactory = new AnalogLocationInputFactory();
    public static function getInstance() : AnalogLocationInputFactory {
        return AnalogLocationInputFactory.instance;
    }

    private final list : BasicArrayList = new BasicArrayListD();
    public function new() {
    }

    public function addPlayer(playerInputId : Int) : Void {
        var analogLocationInput : AnalogLocationInput = AnalogLocationInput.NULL_ANALOG_LOCATION_INPUT;
        if (playerInputId < this.list.size()) {
            analogLocationInput = (cast this.list.get(playerInputId) : AnalogLocationInput);
        }
        if (analogLocationInput == AnalogLocationInput.NULL_ANALOG_LOCATION_INPUT) {
            analogLocationInput = new AnalogLocationInput(playerInputId);
            this.list.add(analogLocationInput);
        }
    }

    public function getInstanceForPlayer(playerInputId : Int) : AnalogLocationInput {
        return (cast this.list.get(playerInputId) : AnalogLocationInput);
    }

    public function getList() : BasicArrayList {
        return this.list;
    }

}

