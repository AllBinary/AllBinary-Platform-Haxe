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
package org.allbinary.game.layer.waypoint;

//import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface;
import org.allbinary.game.health.Health;
import org.allbinary.game.identification.Group;
import org.allbinary.game.input.form.NullRTSFormInputFactory;
import org.allbinary.game.layer.AdvancedRTSGameLayer;
import org.allbinary.game.layer.AdvancedRTSProperties;
import org.allbinary.game.layer.PathFindingLayerInterface;
import org.allbinary.game.view.TileLayerPositionIntoViewPosition;
import org.allbinary.graphics.Rectangle;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.game.layer.RTSPlayerLayerInterface;
import org.allbinary.game.multiplayer.layer.RemoteInfo;
import org.allbinary.media.audio.AttackSound;

class WaypointLayer extends AdvancedRTSGameLayer {
    public function new(remoteInfo : RemoteInfo, parentLayer : PathFindingLayerInterface, groupInterface : haxe.ds.Vector<Group>, rootName : String, name : String, animationInterfaceFactoryInterface : AnimationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface : ProceduralAnimationInterfaceFactoryInterface, rectangle : Rectangle, x : Int, y : Int) {
        super(remoteInfo, parentLayer, AdvancedRTSProperties.createProperties(), groupInterface, rootName, name, new Health(1000), NullRTSFormInputFactory.getInstance(), animationInterfaceFactoryInterface, animationInterfaceFactoryInterface, animationInterfaceFactoryInterface, animationInterfaceFactoryInterface, animationInterfaceFactoryInterface, proceduralAnimationInterfaceFactoryInterface, rectangle, x, y, new TileLayerPositionIntoViewPosition());
        this.setCollidableInferface(new CollidableWaypointBehavior(true));
        this.getWaypointBehavior().setWaypoint(new Waypoint(this, AttackSound.getInstance()));
        this.setAnimationInterface(this.indexedButShouldBeRotationAnimationInterface);
    }

    public override function construct(rtsPlayerLayerInterface : RTSPlayerLayerInterface) : Void {
        this.percentCompleteP = 100;
        this.initVisibility(rtsPlayerLayerInterface);
    }

    public override function paint(graphics : Graphics) : Void {
        if (this.isVisible()) {
            super.paint(graphics);
        }
    }

    public override function processTick(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        try {
            this.indexedButShouldBeRotationAnimationInterface.nextFrame();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "processTick", e);
        }
    }

    public override function damage(damage : Int, damageType : Int) : Void {
    }

    // throws Exception
    public override function getDamage(damageType : Int) : Int {
        return 0;
    }

    // throws Exception
    public override function setDestroyed(destroyed : Bool) : Void {
        super.setDestroyed(destroyed);
        if (this.isDestroyed()) {
            WaypointCellPositionHistory.getInstance().removeLayer(this);
        }
    }

    public override function getType() : Int {
        return WaypointLayer.getStaticType();
    }

    public static function getStaticType() : Int {
        return 4;
    }

    public override function isSelfUpgradeable() : Bool {
        return false;
    }

}

