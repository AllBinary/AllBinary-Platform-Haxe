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
package org.allbinary.game.ag.ai;

import org.allbinary.game.ai.BasicAI;
import org.allbinary.game.input.GameInput;
import org.allbinary.game.physics.velocity.BasicVelocityProperties;
import org.allbinary.game.physics.velocity.VelocityInterfaceCompositeInterface;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.logic.math.BasicDecimal;

class UpDownVectorAI extends BasicAI {
    private final velocityInterface : BasicVelocityProperties;
    private var index : Int = 0;
    public function new(ownerLayerInterface : AllBinaryLayer, gameInput : GameInput) {
        super(ownerLayerInterface, gameInput);
        final velocityInterfaceCompositeInterface : VelocityInterfaceCompositeInterface = (cast this.getOwnerLayerInterface() : VelocityInterfaceCompositeInterface);
        this.velocityInterface = velocityInterfaceCompositeInterface.getVelocityProperties();
        this.velocityInterface.getVelocityYBasicDecimalP().setint(0);
    }

    // throws Exception
    public override function processAI(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        final y : Int = this.getOwnerLayerInterface().getHeight() * 270;
        if (this.index < 5) {
            final basicDecimal : BasicDecimal = this.velocityInterface.getVelocityYBasicDecimalP();
            basicDecimal.setint(0);
            basicDecimal.addint(y);
            this.index++;
        } else if (this.index < 10) {
            final basicDecimal : BasicDecimal = this.velocityInterface.getVelocityYBasicDecimalP();
            basicDecimal.setint(0);
            basicDecimal.subtractint(y);
            this.index++;
        } else {
            this.index = 0;
            this.processAI(allBinaryLayerManager);
        }
    }

}

