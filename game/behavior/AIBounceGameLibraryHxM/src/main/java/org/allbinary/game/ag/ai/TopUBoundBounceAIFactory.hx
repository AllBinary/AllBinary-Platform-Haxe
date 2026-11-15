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

import org.allbinary.ai.ArtificialIntelligenceInterface;
import org.allbinary.bounds.TopULayerBounds;
import org.allbinary.game.ai.ArtificialIntelligenceInterfaceFactoryInterface;
import org.allbinary.game.input.GameInput;
import org.allbinary.game.physics.velocity.VelocityInterface;
import org.allbinary.game.physics.velocity.VelocityInterfaceCompositeInterface;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.util.ABHashtable;

class TopUBoundBounceAIFactory implements ArtificialIntelligenceInterfaceFactoryInterface {
    // throws Exception
    public function getInstance(hashtable : ABHashtable<Any, Any>, ownerLayerInterface : AllBinaryLayer, gameInput : GameInput) : ArtificialIntelligenceInterface {
        final velocityInterfaceCompositeInterface : VelocityInterfaceCompositeInterface = (cast ownerLayerInterface : VelocityInterfaceCompositeInterface);
        final velocityInterface : VelocityInterface = (cast velocityInterfaceCompositeInterface.getVelocityProperties() : VelocityInterface);
        final maxDistancePerTick : Int = (velocityInterface.getMaxForwardVelocity() >> velocityInterface.getVelocityXBasicDecimalP().getScaledFactor());
        final halfWidth : Int = ownerLayerInterface.getWidth() * 2 + maxDistancePerTick + 1;
        final halfHeight : Int = ownerLayerInterface.getHeight() * 2 + maxDistancePerTick + 1;
        final point : GPoint = PointFactory.getInstance().createXY(halfWidth, halfHeight + 60);
        final displayInfo : DisplayInfoSingleton = DisplayInfoSingleton.getInstance();
        final rectangle : Rectangle = new Rectangle(point, (displayInfo.getLastWidth() - halfWidth - point.getX()), (displayInfo.getLastHeight() - halfHeight - point.getY()));
        return new BoundBounceAI(ownerLayerInterface, gameInput, new TopULayerBounds(rectangle), new ReverseVelocityBoundsVisitor(ownerLayerInterface));
    }

    public function new() {
    }
}

