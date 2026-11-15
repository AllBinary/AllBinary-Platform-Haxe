/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2011 AllBinary
 * 
 * By agreeing to this license you and any business entity you represent are
 * legally bound to the AllBinary Open License Version 1 legal agreement.
 * 
 * You may obtain the AllBinary Open License Version 1 legal agreement from
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository.
 * 
 * Created By: Travis Berthelot
 *   
 */
// Generated Code Do Not Modify
package org.allbinary.android.input.motion;

import org.allbinary.game.input.analog.AnalogLocationInput;
import org.allbinary.game.input.analog.AnalogLocationInputFactory;
import org.allbinary.layer.AllBinaryLayerManager;

class SingleAnalogControllerVisitor extends AnalogControllerVisitor {
    private final playerInputId : Int;
    public function new(playerInputId : Int) {
        super();
        this.playerInputId = playerInputId;
    }

    public override function process(allbinaryLayerManager : AllBinaryLayerManager, analogLocationInputProcessor : AnalogLocationInputProcessor) : Void {
        final analogLocationInput : AnalogLocationInput = AnalogLocationInputFactory.getInstance().getInstanceForPlayer(this.playerInputId);
        analogLocationInputProcessor.process(allbinaryLayerManager, analogLocationInput);
    }

}

