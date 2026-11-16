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

import javax.microedition.lcdui.Canvas;
import org.allbinary.ai.ArtificialIntelligence;
import org.allbinary.ai.ArtificialIntelligenceTransitionInterface;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.animation.RotationAnimationInterface;
import org.allbinary.animation.RotationAnimationInterfaceCompositeInterface;
import org.allbinary.game.ai.BasicAI;
import org.allbinary.game.input.GameInput;
import org.allbinary.game.physics.velocity.BasicVelocityProperties;
import org.allbinary.game.physics.velocity.VelocityInterface;
import org.allbinary.game.physics.velocity.VelocityInterfaceCompositeInterface;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.math.AngleIncrementInfo;
import org.allbinary.util.CircularIndexUtil;

class HorizontaRotationManeuverAI extends BasicAI implements ArtificialIntelligenceTransitionInterface {
    private final circularIndexUtil : CircularIndexUtil = CircularIndexUtil.createInstanceAt(10, Integer.MAX_VALUE);
    private var currentSpeedDivisor : Int = 5;
    private final rotationAnimationInterface : IndexedAnimation;
    private final baseVelocityInterface : BasicVelocityProperties;
    private final velocityInterface : VelocityInterface;
    public function new(ownerLayerInterface : AllBinaryLayer, gameInput : GameInput) {
        super(ownerLayerInterface, gameInput);
        final rotationAnimationInterfaceCompositeInterface : RotationAnimationInterfaceCompositeInterface = (cast this.getOwnerLayerInterface() : RotationAnimationInterfaceCompositeInterface);
        this.rotationAnimationInterface = rotationAnimationInterfaceCompositeInterface.getRotationAnimationInterface();
        var velocityInterfaceCompositeInterface : VelocityInterfaceCompositeInterface = (cast this.getOwnerLayerInterface() : VelocityInterfaceCompositeInterface);
        this.baseVelocityInterface = velocityInterfaceCompositeInterface.getVelocityProperties();
        this.velocityInterface = (cast this.baseVelocityInterface : VelocityInterface);
        final rotationAnimationInterface : RotationAnimationInterface = (cast this.rotationAnimationInterface : RotationAnimationInterface);
        final angleIncrementInfo : AngleIncrementInfo = rotationAnimationInterface.getAngleInfoP().getAngleIncrementInfo();
        rotationAnimationInterfaceCompositeInterface.setFrame(jre.lang.JavaObject.intValue(angleIncrementInfo.RIGHT_FRAME));
    }

    public function transition() : Void {
        final rotationAnimationInterface : RotationAnimationInterface = (cast this.rotationAnimationInterface : RotationAnimationInterface);
        final angleIncrementInfo : AngleIncrementInfo = rotationAnimationInterface.getAngleInfoP().getAngleIncrementInfo();
        final rotationAnimationInterfaceCompositeInterface : RotationAnimationInterfaceCompositeInterface = (cast this.getOwnerLayerInterface() : RotationAnimationInterfaceCompositeInterface);
        rotationAnimationInterfaceCompositeInterface.setFrame(jre.lang.JavaObject.intValue(angleIncrementInfo.RIGHT_FRAME));
        var allbinaryLayer : AllBinaryLayer = this.getOwnerLayerInterface();
        allbinaryLayer.setPosition(allbinaryLayer.getXP(), 1, allbinaryLayer.getZP());
    }

    // throws Exception
    public override function processAI(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        final rotationAnimationInterface : RotationAnimationInterface = ((cast this.rotationAnimationInterface : RotationAnimationInterface));
        final angleIncrementInfo : AngleIncrementInfo = rotationAnimationInterface.getAngleInfoP().getAngleIncrementInfo();
        final frame : Int = this.rotationAnimationInterface.getFrame();
        final ownerLayerInterface : AllBinaryLayer = this.getOwnerLayerInterface();
        if (ownerLayerInterface.getXP() - ownerLayerInterface.getWidth() <= 0 && frame == jre.lang.JavaObject.intValue(angleIncrementInfo.LEFT_FRAME)) {
            this.reverse();
            this.drop();
        }
        final displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
        if (ownerLayerInterface.getX2() + ownerLayerInterface.getWidth() > displayInfo.getLastWidth() && frame == jre.lang.JavaObject.intValue(angleIncrementInfo.RIGHT_FRAME)) {
            this.reverse();
            this.accelerate();
            this.drop();
        }
        final index : Int = this.circularIndexUtil.getIndex();
        if (index % this.currentSpeedDivisor == 0 && index % 2 == 0) {
            super.processKeyAI(Canvas.UP);
            this.velocityInterface.limitMaxXYVelocity(jre.lang.JavaNumber.divide(this.velocityInterface.getMaxForwardVelocity(), this.currentSpeedDivisor));
        }
        this.circularIndexUtil.next();
        if (frame == jre.lang.JavaObject.intValue(angleIncrementInfo.LEFT_FRAME)) {
            super.processKeyAI(Canvas.KEY_NUM0);
        } else if (frame == jre.lang.JavaObject.intValue(angleIncrementInfo.RIGHT_FRAME)) {
            super.processKeyAI(Canvas.KEY_POUND);
        }
    }

    public function reverse() : Void {
        final rotationAnimationInterface : RotationAnimationInterface = (cast this.rotationAnimationInterface : RotationAnimationInterface);
        final angleIncrementInfo : AngleIncrementInfo = rotationAnimationInterface.getAngleInfoP().getAngleIncrementInfo();
        final frame : Int = this.rotationAnimationInterface.getFrame();
        if (frame == jre.lang.JavaObject.intValue(angleIncrementInfo.LEFT_FRAME)) {
            final rotationAnimationInterfaceCompositeInterface : RotationAnimationInterfaceCompositeInterface = (cast this.getOwnerLayerInterface() : RotationAnimationInterfaceCompositeInterface);
            rotationAnimationInterfaceCompositeInterface.setFrame(jre.lang.JavaObject.intValue(angleIncrementInfo.RIGHT_FRAME));
            this.baseVelocityInterface.zero();
        } else if (frame == jre.lang.JavaObject.intValue(angleIncrementInfo.RIGHT_FRAME)) {
            final rotationAnimationInterfaceCompositeInterface : RotationAnimationInterfaceCompositeInterface = (cast this.getOwnerLayerInterface() : RotationAnimationInterfaceCompositeInterface);
            rotationAnimationInterfaceCompositeInterface.setFrame(jre.lang.JavaObject.intValue(angleIncrementInfo.LEFT_FRAME));
            this.baseVelocityInterface.zero();
        }
    }

    private function accelerate() : Void {
        if (this.currentSpeedDivisor > 1) {
            this.currentSpeedDivisor--;
        }
    }

    private function drop() : Void {
        final displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
        final ownerLayerInterface : AllBinaryLayer = this.getOwnerLayerInterface();
        var y : Int = ownerLayerInterface.getYP();
        if (ownerLayerInterface.getY2() + ownerLayerInterface.getHeight() > displayInfo.getLastHeight()) {
            y = 0;
        } else {
            y += ownerLayerInterface.getHeight() + 1;
        }
        ownerLayerInterface.setPosition(ownerLayerInterface.getXP(), y, ownerLayerInterface.getZP());
    }

    public override function getId() : Int {
        return ArtificialIntelligence.AI_ID;
    }

}

