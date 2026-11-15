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
package org.allbinary.game.ag.layer.weapon.mine;

import org.allbinary.ag.weapon.media.audio.DropWeaponSound;
import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.game.layer.weapon.SimpleWeaponLayer;
import org.allbinary.game.multiplayer.layer.RemoteInfo;
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.Rectangle;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.media.audio.SecondaryPlayerQueueFactory;
import org.allbinary.physics.movement.NoMovementFactory;
import org.allbinary.view.ViewPositionBase;
import org.allbinary.view.event.ViewPositionEventHandler;

class MineLayer extends SimpleWeaponLayer {
    private static final NAME : String = "MineLayer";
    public function new(viewPosition : ViewPositionBase) {
        super(MineLayer.NAME, RemoteInfo.REMOTE_INFO, -1, NoMovementFactory.getInstance().getMovmentInstance(), FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance().get(MineWeaponResources.getInstance().RESOURCE).getInstance(0), SimpleWeaponLayer.createDestroyed(), new Rectangle(PointFactory.getInstance().ZERO_ZERO, 10, 10), viewPosition);
    }

    private final viewPositionEventHandler : ViewPositionEventHandler = ViewPositionEventHandler.getInstance();
    public override function initXYZ(x : Int, y : Int, z : Int) : Void {
        this.setPosition(x + 5, y + 5, z);
        this.viewPositionEventHandler.addListener((cast this : AllBinaryLayer));
        SecondaryPlayerQueueFactory.getInstance().add(DropWeaponSound.getInstance());
    }

    public override function damage(damage : Int, damageType : Int) : Void {
        this.totalDamage = this.getInitDamage() + 1;
    }

    public override function getDamage(damageType : Int) : Int {
        super.getDamage(damageType);
        return this.getInitDamage();
    }

    public override function setDestroyed(destroyed : Bool) : Void {
        super.setDestroyed(destroyed);
        if (this.isDestroyed()) {
            this.viewPositionEventHandler.removeListener(this);
        }
    }

}

