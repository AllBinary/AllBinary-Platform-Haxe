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
package org.allbinary.game.layer.weapon;

import org.allbinary.animation.Animation;
import org.allbinary.game.multiplayer.layer.RemoteInfo;
import org.allbinary.graphics.Rectangle;
import org.allbinary.physics.movement.Movement;
import org.allbinary.view.ViewPositionBase;

class DamageWeaponLayer extends WeaponLayer {
    public function new(name : String, remoteInfo : RemoteInfo, movement : Movement, animationInterface : Animation, destroyedAnimationInterface : Animation, rectangle : Rectangle, viewPosition : ViewPositionBase, username : String, actorSessionId : Int, id : Int, multiPlayerType : Int) {
        super(name, remoteInfo, multiPlayerType, movement, animationInterface, destroyedAnimationInterface, rectangle, viewPosition);
        this.setCollidableInferface(new CollidableDamageWeaponBehavior(true));
    }

}

