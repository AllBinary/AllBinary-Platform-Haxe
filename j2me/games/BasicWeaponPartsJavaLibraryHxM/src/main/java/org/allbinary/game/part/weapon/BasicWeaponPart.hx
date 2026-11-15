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
package org.allbinary.game.part.weapon;

import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.Animation;
import org.allbinary.animation.NullAnimationFactory;
import org.allbinary.game.combat.weapon.WeaponProperties;
import org.allbinary.game.part.PartInterface;
import org.allbinary.game.score.NoScoreable;
import org.allbinary.game.score.ScoreableInterface;
import org.allbinary.graphics.RelativeRelationship;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.string.CommonStrings;
import org.allbinary.view.ViewPositionBase;

class BasicWeaponPart implements PartInterface implements SalvoInterface {
    public static function createBasicWeaponPart(animationInterface : Animation) : BasicWeaponPart {
        return new BasicWeaponPart(animationInterface, AllBinaryLayer.NULL_ALLBINARY_LAYER, WeaponProperties.NULL_WEAPON_PROPERTIES, NoScoreable.getInstance(), RelativeRelationship.NULL_RELATIVE_RELATIONSHIP);
    }

    public static final NULL_BASIC_WEAPON_PART : BasicWeaponPart = BasicWeaponPart.createBasicWeaponPart(NullAnimationFactory.getFactoryInstance().getInstance(0));
    private var animationInterface : Animation = NullAnimationFactory.getFactoryInstance().getInstance(0);
    private var ownerLayerInterface : AllBinaryLayer = AllBinaryLayer.NULL_ALLBINARY_LAYER;
    private var weaponProperties : WeaponProperties = WeaponProperties.NULL_WEAPON_PROPERTIES;
    private var scoreableInterface : ScoreableInterface = NoScoreable.getInstance();
    public var relativeRelationship : RelativeRelationship = RelativeRelationship.NULL_RELATIVE_RELATIONSHIP;
    public function new(animationInterface : Animation, sourceLayerInterface : AllBinaryLayer, weaponProperties : WeaponProperties, scoreableInterface : ScoreableInterface, relativeRelationship : RelativeRelationship) {
        this.init(sourceLayerInterface, weaponProperties, scoreableInterface, relativeRelationship);
        this.setAnimationInterface(animationInterface);
    }

    public function init(sourceLayerInterface : AllBinaryLayer, weaponProperties : WeaponProperties, scoreableInterface : ScoreableInterface, relativeRelationship : RelativeRelationship) : Void {
        this.setOwnerLayerInterface(sourceLayerInterface);
        this.setWeaponProperties(weaponProperties);
        this.scoreableInterface = scoreableInterface;
        this.relativeRelationship = relativeRelationship;
    }

    // throws Exception
    public function process(allbinaryLayerManager : AllBinaryLayerManager, angle : Int, otherAngle : Int) : Void {
        this.processScore(allbinaryLayerManager, angle, otherAngle, this.getWeaponProperties(), this.scoreableInterface);
    }

    // throws Exception
    public function processScore(allbinaryLayerManager : AllBinaryLayerManager, angle : Int, otherAngle : Int, weaponProperties : WeaponProperties, scoreableInterface : ScoreableInterface) : Void {
        throw new jre.lang.JavaException(CommonStrings.getInstance().NOT_IMPLEMENTED);
    }

    public function getOwnerLayerInterface() : AllBinaryLayer {
        return this.ownerLayerInterface;
    }

    public function setOwnerLayerInterface(ownerLayerInterface : AllBinaryLayer) : Void {
        this.ownerLayerInterface = ownerLayerInterface;
    }

    public function getAnimationInterface() : Animation {
        return this.animationInterface;
    }

    public function setAnimationInterface(animationInterface : Animation) : Void {
        this.animationInterface = animationInterface;
    }

    public function paint(graphics : Graphics) : Void {
        final viewPosition : ViewPositionBase = this.getOwnerLayerInterface().getViewPosition();
        final viewX : Int = viewPosition.getX();
        final viewY : Int = viewPosition.getY();
        this.animationInterface.paintXY(graphics, viewX, viewY);
    }

    public function paintThreed(graphics : Graphics) : Void {
    }

    public function getWeaponProperties() : WeaponProperties {
        return this.weaponProperties;
    }

    public function setWeaponProperties(weaponProperties : WeaponProperties) : Void {
        this.weaponProperties = weaponProperties;
    }

}

