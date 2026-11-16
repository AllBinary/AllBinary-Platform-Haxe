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

import org.allbinary.animation.IndexedAnimation;
import org.allbinary.animation.RotationAnimationInterface;
import org.allbinary.animation.RotationAnimationInterfaceCompositeInterface;
import org.allbinary.game.ag.ai.tactical.LurchAI;
import org.allbinary.game.input.GameInput;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.math.AngleIncrementInfo;

class LurchRotationAI extends LurchAI {
    private var rotationAnimationInterface : IndexedAnimation;
    public function new(ownerLayerInterface : AllBinaryLayer, gameInput : GameInput) {
        super(ownerLayerInterface, gameInput);
        final rotationAnimationInterfaceCompositeInterface : RotationAnimationInterfaceCompositeInterface = (cast this.getOwnerLayerInterface() : RotationAnimationInterfaceCompositeInterface);
        this.rotationAnimationInterface = rotationAnimationInterfaceCompositeInterface.getRotationAnimationInterface();
        this.update();
    }

    public override function reverse() : Void {
        super.reverse();
        this.update();
    }

    private function update() : Void {
        if (this.currentRelativeAngle == 0) {
            final rotationAnimationInterface : RotationAnimationInterface = (cast this.rotationAnimationInterface : RotationAnimationInterface);
            final angleIncrementInfo : AngleIncrementInfo = rotationAnimationInterface.getAngleInfoP().getAngleIncrementInfo();
            final rotationAnimationInterfaceCompositeInterface : RotationAnimationInterfaceCompositeInterface = (cast this.getOwnerLayerInterface() : RotationAnimationInterfaceCompositeInterface);
            rotationAnimationInterfaceCompositeInterface.setFrame(jre.lang.JavaObject.intValue(angleIncrementInfo.RIGHT_FRAME));
        } else if (this.currentRelativeAngle == 180) {
            final rotationAnimationInterface : RotationAnimationInterface = (cast this.rotationAnimationInterface : RotationAnimationInterface);
            final angleIncrementInfo : AngleIncrementInfo = rotationAnimationInterface.getAngleInfoP().getAngleIncrementInfo();
            final rotationAnimationInterfaceCompositeInterface : RotationAnimationInterfaceCompositeInterface = (cast this.getOwnerLayerInterface() : RotationAnimationInterfaceCompositeInterface);
            rotationAnimationInterfaceCompositeInterface.setFrame(jre.lang.JavaObject.intValue(angleIncrementInfo.LEFT_FRAME));
        }
    }

}

