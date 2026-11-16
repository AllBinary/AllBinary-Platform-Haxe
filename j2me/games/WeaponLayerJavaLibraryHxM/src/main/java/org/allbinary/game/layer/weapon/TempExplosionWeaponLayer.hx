// Generated Code Do Not Modify
package org.allbinary.game.layer.weapon;

import org.allbinary.animation.Animation;
import org.allbinary.game.combat.weapon.WeaponProperties;
import org.allbinary.game.multiplayer.layer.RemoteInfo;
import org.allbinary.graphics.Rectangle;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.physics.movement.Movement;
import org.allbinary.time.GameTickTimeDelayHelperFactory;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.view.ViewPositionBase;

class TempExplosionWeaponLayer extends SimpleWeaponLayer {
    public final weaponProperties_TempExplosionWeaponLayer : WeaponProperties = new WeaponProperties(-haxe.Int64.ofInt(1), -haxe.Int64.ofInt(1), 0, 1000, 0);
    private final timeDelayHelper : TimeDelayHelper = new TimeDelayHelper(0);
    public function new(name : String, movement : Movement, animationInterface : Animation, rectangle : Rectangle, viewPosition : ViewPositionBase, timeDelay : Int) {
        super(name, RemoteInfo.REMOTE_INFO, -1, movement, animationInterface, SimpleWeaponLayer.createDestroyed(), rectangle, viewPosition);
        this.timeDelayHelper.delay = timeDelay;
    }

    // throws Exception
    public override function processTick(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        if (this.timeDelayHelper.isTime(GameTickTimeDelayHelperFactory.getInstance().startTime)) {
            this.getCollidableInferface().collide(this, this);
            this.totalDamage = this.getInitDamage() + 1;
        }
        super.processTick(allBinaryLayerManager);
    }

}

