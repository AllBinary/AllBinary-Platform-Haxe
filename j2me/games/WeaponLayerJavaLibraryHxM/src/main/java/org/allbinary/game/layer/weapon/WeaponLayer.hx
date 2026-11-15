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

import javax.microedition.khronos.opengles.GL;
import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.Animation;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.animation.NullAnimationFactory;
import org.allbinary.game.collision.CollidableBaseBehavior;
import org.allbinary.game.combat.destroy.DestroyedLayerProcessor;
import org.allbinary.game.combat.weapon.WeaponProperties;
import org.allbinary.game.configuration.GameConfigurationUtil;
import org.allbinary.game.identification.BasicGroupFactory;
import org.allbinary.game.multiplayer.layer.MultiPlayerGameLayer;
import org.allbinary.game.multiplayer.layer.RemoteInfo;
import org.allbinary.game.score.NoScoreable;
import org.allbinary.game.score.ScoreableInterface;
import org.allbinary.game.tick.TickableInterface;
import org.allbinary.graphics.Rectangle;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.physics.movement.Movement;
import org.allbinary.view.ViewPosition;
import org.allbinary.view.ViewPositionBase;

class WeaponLayer extends MultiPlayerGameLayer implements TickableInterface {
    private var animationInterface : Animation = NullAnimationFactory.getFactoryInstance().getInstance(0);
    public var initAnimationInterface : Animation;
    private var destroyedAnimationInterface : Animation;
    private var sourceLayerInterface : AllBinaryLayer = AllBinaryLayer.NULL_ALLBINARY_LAYER;
    public var totalDamage : Int = 0;
    private var initDamage : Int = 0;
    private var destroyed : Bool = true;
    public var scoreableInterface : ScoreableInterface = NoScoreable.getInstance();
    private var movement : Movement;
    private var weaponProperties : WeaponProperties = WeaponProperties.NULL_WEAPON_PROPERTIES;
    private final multiPlayerType : Int;
    public function new(name : String, remoteInfo : RemoteInfo, multiPlayerType : Int, movement : Movement, animationInterface : Animation, destroyedAnimationInterface : Animation, rectangle : Rectangle, viewPosition : ViewPositionBase) {
        super(remoteInfo, BasicGroupFactory.getInstance().NONE_ARRAY, name, rectangle, viewPosition);
        this.initAnimationInterface = animationInterface;
        this.setAnimationInterface(animationInterface);
        this.destroyedAnimationInterface = destroyedAnimationInterface;
        this.movement = movement;
        this.multiPlayerType = multiPlayerType;
    }

    private var collidableWeaponBehavior : CollidableWeaponBehavior = CollidableWeaponBehavior.getNullInstance();
    public override function setCollidableInferface(collidableInferface : CollidableBaseBehavior) : Void {
        super.setCollidableInferface(collidableInferface);
        this.collidableWeaponBehavior = (cast this.getCollidableInferface() : CollidableWeaponBehavior);
    }

    // throws Exception
    public function initXYZ(x : Int, y : Int, z : Int) : Void {
        this.x = x;
        this.y = y;
        this.z = z;
    }

    // throws Exception
    public function init(sourceLayerInterface : AllBinaryLayer, angle : Int, otherAngle : Int, weaponProperties : WeaponProperties, scoreable : ScoreableInterface) : Void {
        this.setWeaponPropertiesP(weaponProperties);
        this.setReadyForExplosion(false);
        this.setAnimationInterface(this.getInitAnimationInterfaceP());
        this.setOwnerLayerInterface(sourceLayerInterface);
        this.collidableWeaponBehavior.init(sourceLayerInterface);
        this.setGroupInterfaces();
        if (scoreable != null) {
            this.scoreableInterface = scoreable;
        }
        this.totalDamage = 0;
        this.initDamage = weaponProperties.getDamage();
        this.setDestroyed(false);
        this.movement.init(weaponProperties.getSpeed(), angle, otherAngle);
    }

    public function setGroupInterfaces() : Void {
        final basicGroupFactory : BasicGroupFactory = BasicGroupFactory.getInstance();
        if (this.sourceLayerInterface.getGroupInterface()[0] == basicGroupFactory.ENEMY) {
            this.setGroupInterface(basicGroupFactory.ENEMY_ARRAY);
        } else {
            this.setGroupInterface(this.sourceLayerInterface.getGroupInterface());
        }
    }

    // throws Exception
    public override function processTick(allBinaryLayerManager : AllBinaryLayerManager) : Void {
        if (this.isExhausted() && !this.isDestroyed()) {
            if (this.isReadyForExplosion()) {
                var indexedAnimationInterface : IndexedAnimation = (cast this.getAnimationInterface() : IndexedAnimation);
                var currentFrame : Int = indexedAnimationInterface.getFrame();
                if (currentFrame < indexedAnimationInterface.getAnimationSize() - 1) {
                    indexedAnimationInterface.nextFrame();
                } else {
                    this.setDestroyed(true);
                }
            } else {
                final collidableWeaponBehavior : CollidableWeaponBehavior = (cast this.getCollidableInferface() : CollidableWeaponBehavior);
                if (collidableWeaponBehavior.isCollided()) {
                    this.setAnimationInterface(this.destroyedAnimationInterface);
                    this.getMovement().stop();
                    this.setReadyForExplosion(true);
                } else {
                    this.setDestroyed(true);
                }
            }
        }
        this.movement.process(this);
        this.totalDamage += this.weaponProperties.getDissipation();
    }

    public override function isDestroyed() : Bool {
        return this.destroyed;
    }

    public override function damage(damage : Int, damageType : Int) : Void {
        this.totalDamage += damage * damage;
    }

    public function givePoints(total : Int) : Void {
        this.scoreableInterface.addPoints(GameConfigurationUtil.getInstance().getCompetitionValue() * total);
    }

    public function isExhausted() : Bool {
        if (this.totalDamage > this.getInitDamage() || this.totalDamage < 0) {
            return true;
        } else {
            return false;
        }
    }

    public override function getDamage(damageType : Int) : Int {
        if (!this.isExhausted()) {
            var total : Int = this.getInitDamage() - this.totalDamage;
            this.givePoints(total);
            return total;
        }
        return 0;
    }

    public function setDestroyed(destroyed : Bool) : Void {
        this.destroyed = destroyed;
        if (this.isDestroyed()) {
            this.scoreableInterface = NoScoreable.getInstance();
            DestroyedLayerProcessor.getInstance().add(this);
        }
    }

    public function getInitDamage() : Int {
        return this.initDamage;
    }

    public function setAnimationInterface(animationInterface : Animation) : Void {
        this.animationInterface = animationInterface;
    }

    public function getAnimationInterface() : Animation {
        return this.animationInterface;
    }

    public function getInitAnimationInterfaceP() : Animation {
        return this.initAnimationInterface;
    }

    public function setInitAnimationInterfaceP(initAnimationInterface : Animation) : Void {
        this.initAnimationInterface = initAnimationInterface;
    }

    public function getDestroyedAnimationInterface() : Animation {
        return this.destroyedAnimationInterface;
    }

    public function getOwnerLayerInterface() : AllBinaryLayer {
        return this.sourceLayerInterface;
    }

    public function setOwnerLayerInterface(sourceLayerInterface : AllBinaryLayer) : Void {
        this.sourceLayerInterface = sourceLayerInterface;
    }

    public override function paint(graphics : Graphics) : Void {
        final viewPosition : ViewPositionBase = this.getViewPosition();
        this.animationInterface.paintXY(graphics, viewPosition.getX() - this.getHalfWidth(), viewPosition.getY() - this.getHalfHeight());
    }

    public override function paintThreed(graphics : Graphics) : Void {
        final viewPosition : ViewPositionBase = this.getViewPosition();
        this.animationInterface.paintThreedXYZ(graphics, viewPosition.getX() - this.getHalfWidth(), viewPosition.getY() - this.getHalfHeight(), viewPosition.getZ() - this.getHalfDepth());
    }

    public function getMovement() : Movement {
        return this.movement;
    }

    public function setMovement(movement : Movement) : Void {
        this.movement = movement;
    }

    public override function getType() : Int {
        return WeaponLayer.getStaticType();
    }

    public static function getStaticType() : Int {
        return 0;
    }

    public override function getMultiPlayerType() : Int {
        return this.multiPlayerType;
    }

    public function setWeaponPropertiesP(weaponProperties : WeaponProperties) : Void {
        this.weaponProperties = weaponProperties;
    }

    public function getWeaponPropertiesP() : WeaponProperties {
        return this.weaponProperties;
    }

    public override function implmentsTickableInterface() : Bool {
        return true;
    }

    // throws Exception
    public override function set(gl : GL) : Void {
        this.initAnimationInterface.set(gl);
    }

}

