/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2006 AllBinary 
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
package org.allbinary.game.layer.geological.resources;

import org.allbinary.game.layer.SelectionHudPaintable;
import org.allbinary.game.layer.waypoint.WaypointLayer;
import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface;
import org.allbinary.game.identification.Group;
import org.allbinary.game.layer.PathFindingLayerInterface;
import org.allbinary.graphics.Rectangle;
import org.allbinary.game.multiplayer.layer.RemoteInfo;

class ResourceWaypointLayer extends WaypointLayer {
    public function new(remoteInfo : RemoteInfo, parentLayer : PathFindingLayerInterface, groupInterface : haxe.ds.Vector<Group>, rootName : String, name : String, animationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface : ProceduralAnimationInterfaceFactoryInterface, rectangle : Rectangle, x : Int, y : Int) {
        super(remoteInfo, parentLayer, groupInterface, rootName, name, animationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface, rectangle, x, y);
    }

    public override function createHudPaintable() : SelectionHudPaintable {
        var rtsLayerHudPaintable : GeologicalResourceInfoHudPaintable = GeologicalResourceInfoHudPaintableSingleton.getInstance();
        rtsLayerHudPaintable.setBasicColorP(this.allBinaryGameLayerManagerP.getForegroundBasicColor());
        rtsLayerHudPaintable.setRtsLayer(this);
        return rtsLayerHudPaintable;
    }

    public override function getHudPaintable() : SelectionHudPaintable {
        var rtsLayerHudPaintable : GeologicalResourceInfoHudPaintable = GeologicalResourceInfoHudPaintableSingleton.getInstance();
        return rtsLayerHudPaintable;
    }

}

