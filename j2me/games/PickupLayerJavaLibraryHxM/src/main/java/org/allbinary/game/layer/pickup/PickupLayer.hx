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
package org.allbinary.game.layer.pickup;

import javax.microedition.khronos.opengles.GL;
import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.Animation;
import org.allbinary.animation.NullAnimationFactory;
import org.allbinary.game.collision.CollidableAlwaysPickupNeverCollideBehaviorFactory;
import org.allbinary.game.combat.destroy.DestroyedLayerProcessor;
import org.allbinary.game.identification.BasicGroupFactory;
import org.allbinary.game.multiplayer.layer.MultiPlayerGameLayer;
import org.allbinary.game.multiplayer.layer.RemoteInfo;
import org.allbinary.graphics.Rectangle;
import org.allbinary.image.opengles.OpenGLSurfaceChangedInterface;
import org.allbinary.view.ViewPositionBase;

class PickupLayer extends MultiPlayerGameLayer implements PickedUpLayerInterface implements PickupableInterface {
    private var pickedUpLayerInterfaceFactoryInterface : PickedUpLayerInterfaceFactoryInterface = CountedPickedUpLayerInterfaceFactory.NULL_COUNTED_PICKUP_LAYER_FACTORY;
    private var destroyed : Bool = false;
    private var animationInterface : Animation = NullAnimationFactory.getFactoryInstance().getInstance(0);
    public function new(name : String, remoteInfo : RemoteInfo, total : Int, pickedUpLayerInterfaceFactoryInterface : PickedUpLayerInterfaceFactoryInterface, animationInterface : Animation, rectangle : Rectangle, viewPosition : ViewPositionBase) {
        super(remoteInfo, BasicGroupFactory.getInstance().NONE_ARRAY, name, rectangle, viewPosition);
        this.setCollidableInferface(CollidableAlwaysPickupNeverCollideBehaviorFactory.getInstance().createBehavior());
        this.setLayerWidth(10);
        this.setLayerHeight(10);
        this.init(pickedUpLayerInterfaceFactoryInterface, animationInterface);
    }

    public function init(pickedUpLayerInterfaceFactoryInterface : PickedUpLayerInterfaceFactoryInterface, animationInterface : Animation) : Void {
        this.pickedUpLayerInterfaceFactoryInterface = pickedUpLayerInterfaceFactoryInterface;
        this.animationInterface = animationInterface;
        this.setDestroyed(false);
    }

    public function initXYZ(x : Int, y : Int, z : Int) : Void {
        this.setPosition(x, y, z);
    }

    public override function paint(graphics : Graphics) : Void {
        final viewPosition : ViewPositionBase = this.getViewPosition();
        final viewX : Int = viewPosition.getX();
        final viewY : Int = viewPosition.getY();
        this.animationInterface.paintXY(graphics, viewX, viewY);
    }

    public override function paintThreed(graphics : Graphics) : Void {
        final viewPosition : ViewPositionBase = this.getViewPosition();
        final viewX : Int = viewPosition.getX();
        final viewY : Int = viewPosition.getY();
        this.animationInterface.paintThreedXYZ(graphics, viewX, viewY, 3);
    }

    public override function getPickedUpLayerInterfaceFactoryInterface() : PickedUpLayerInterfaceFactoryInterface {
        return this.pickedUpLayerInterfaceFactoryInterface;
    }

    public override function setPickedUp() : Void {
        this.setDestroyed(true);
    }

    public override function isDestroyed() : Bool {
        return this.destroyed;
    }

    public function setDestroyed(destroyed : Bool) : Void {
        this.destroyed = destroyed;
        if (this.isDestroyed()) {
            DestroyedLayerProcessor.getInstance().add(this);
        }
    }

    public override function damage(damage : Int, damageType : Int) : Void {
    }

    public override function getDamage(damageType : Int) : Int {
        return 0;
    }

    // throws Exception
    public override function set(gl : GL) : Void {
        var openGLSurfaceChangedInterface : OpenGLSurfaceChangedInterface = (cast this.animationInterface : OpenGLSurfaceChangedInterface);
        openGLSurfaceChangedInterface.set(gl);
    }

}

