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
package org.allbinary.game.layer.special;

import javax.microedition.lcdui.Graphics;
import org.allbinary.game.collision.CollidableNeverCollideBehaviorFactory;
import org.allbinary.game.combat.damage.DamageableInterface;
import org.allbinary.game.combat.destroy.DestroyableInterface;
import org.allbinary.game.combat.destroy.event.DestroyedEvent;
import org.allbinary.game.identification.BasicGroupFactory;
import org.allbinary.game.identification.Group;
import org.allbinary.game.input.event.GameKeyEvent;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.layer.CollidableCompositeLayer;
import org.allbinary.game.layer.pickup.PickedUpLayerInterfaceFactoryInterface;
import org.allbinary.game.layer.pickup.PickupBehavior;
import org.allbinary.game.layer.pickup.PickupCompositeInterface;
import org.allbinary.game.part.PartInterface;
import org.allbinary.game.part.PartInterfaceUtil;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.RectangleFactory;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.math.PositionStrings;
import org.allbinary.string.CommonSeps;
import org.allbinary.view.ViewPositionBase;

class CollidableDestroyableDamageableLayer extends CollidableCompositeLayer implements DestroyableInterface implements DamageableInterface implements PickupCompositeInterface implements SpecialGameInputInterface {
    private static var NULL_COLLIDABLE_DESTROYABLE_DAMAGE_LAYER : Any = NullUtil.getInstance().NULL_OBJECT;
    public static function getNullInstance() : CollidableDestroyableDamageableLayer {
        if (CollidableDestroyableDamageableLayer.NULL_COLLIDABLE_DESTROYABLE_DAMAGE_LAYER == NullUtil.getInstance().NULL_OBJECT) {
            CollidableDestroyableDamageableLayer.NULL_COLLIDABLE_DESTROYABLE_DAMAGE_LAYER = new CollidableDestroyableDamageableLayer(BasicGroupFactory.getInstance().NONE_ARRAY, StringUtil.getInstance().EMPTY_STRING, RectangleFactory.SINGLETON, ViewPositionBase.NULL_VIEW_POSITION);
        }
        return (cast CollidableDestroyableDamageableLayer.NULL_COLLIDABLE_DESTROYABLE_DAMAGE_LAYER : CollidableDestroyableDamageableLayer);
    }

    private var groupInterface : haxe.ds.Vector<Group>;
    private var readyForExplosion : Bool = false;
    private var initWidth : Int;
    private var initHeight : Int;
    private var initX : Int = 0;
    private var initY : Int = 0;
    private var initZ : Int = 0;
    public var partInterfaceArrayP : haxe.ds.Vector<PartInterface> = PartInterfaceUtil.getZeroArray();
    private var pickupBehavior : PickupBehavior;
    public var allBinaryGameLayerManagerP : AllBinaryGameLayerManager = AllBinaryGameLayerManager.getNullInstance();
    public var isDraggable : Bool = false;
    public var isDragged : Bool = false;
    public var isDropped : Bool = false;
    public function new(groupInterface : haxe.ds.Vector<Group>, name : String, layerInfo : Rectangle, viewPosition : ViewPositionBase) {
        super(name, layerInfo, viewPosition, CollidableNeverCollideBehaviorFactory.getInstance());
        this.initWidth = layerInfo.getWidth();
        this.initHeight = layerInfo.getHeight();
        this.groupInterface = groupInterface;
        this.pickupBehavior = PickupBehavior.getNullInstance();
    }

    // throws Exception
    public function initPosition() : Void {
        this.setPosition(this.initX, this.initY, this.initZ);
    }

    // throws Exception
    public function initPositionXYZ(x : Int, y : Int, z : Int) : Void {
        this.initX = x;
        this.initY = y;
        this.initZ = z;
    }

    public override function paint(graphics : Graphics) : Void {
        super.paint(graphics);
    }

    // throws Exception
    public function damage(damage : Int, damageType : Int) : Void {
        throw new jre.lang.JavaException(this.commonStrings.NOT_IMPLEMENTED);
    }

    // throws Exception
    public function getDamage(damageType : Int) : Int {
        throw new jre.lang.JavaException(this.commonStrings.NOT_IMPLEMENTED);
    }

    // throws Exception
    public function isDestroyed() : Bool {
        throw new jre.lang.JavaException(this.commonStrings.NOT_IMPLEMENTED);
    }

    public override function getGroupInterface() : haxe.ds.Vector<Group> {
        return this.groupInterface;
    }

    public function setGroupInterface(teamInterface : haxe.ds.Vector<Group>) : Void {
        this.groupInterface = teamInterface;
    }

    // throws Exception
    public function setAllBinaryGameLayerManager(allBinaryGameLayerManager : AllBinaryGameLayerManager) : Void {
        this.allBinaryGameLayerManagerP = allBinaryGameLayerManager;
        if (this.allBinaryGameLayerManagerP == null) {
            throw new jre.lang.JavaException();
        }
    }

    public function isReadyForExplosion() : Bool {
        return this.readyForExplosion;
    }

    public function setReadyForExplosion(isReadyForExplosion : Bool) : Void {
        this.readyForExplosion = isReadyForExplosion;
    }

    public function getInitWidth() : Int {
        return this.initWidth;
    }

    public function getInitHeight() : Int {
        return this.initHeight;
    }

    public function getInitX() : Int {
        return this.initX;
    }

    public function getInitY() : Int {
        return this.initY;
    }

    // throws Exception
    public function up() : Void {
    }

    // throws Exception
    public function down() : Void {
    }

    // throws Exception
    public function right() : Void {
    }

    // throws Exception
    public function left() : Void {
    }

    // throws Exception
    public function strafeLeft() : Void {
    }

    // throws Exception
    public function strafeRight() : Void {
    }

    // throws Exception
    public function fire(layerManager : AllBinaryLayerManager, gameKeyEvent : GameKeyEvent) : Void {
    }

    // throws Exception
    public function special1(layerManager : AllBinaryLayerManager, gameKeyEvent : GameKeyEvent) : Void {
    }

    // throws Exception
    public function special2(layerManager : AllBinaryLayerManager, gameKeyEvent : GameKeyEvent) : Void {
    }

    // throws Exception
    public function special3(layerManager : AllBinaryLayerManager, gameKeyEvent : GameKeyEvent) : Void {
    }

    // throws Exception
    public function special4(layerManager : AllBinaryLayerManager, gameKeyEvent : GameKeyEvent) : Void {
    }

    // throws Exception
    public function special5(layerManager : AllBinaryLayerManager, gameKeyEvent : GameKeyEvent) : Void {
    }

    // throws Exception
    public function upAnalog(yAnalogValue : Int) : Void {
    }

    // throws Exception
    public function downAnalog(yAnalogValue : Int) : Void {
    }

    // throws Exception
    public function rightAnalog(xAnalogValue : Int) : Void {
    }

    // throws Exception
    public function leftAnalog(xAnalogValue : Int) : Void {
    }

    // throws Exception
    public function rightTrigger(layerManager : AllBinaryLayerManager, gameKeyEvent : GameKeyEvent, xAnalogValue : Int) : Void {
    }

    // throws Exception
    public function leftTrigger(layerManager : AllBinaryLayerManager, gameKeyEvent : GameKeyEvent, xAnalogValue : Int) : Void {
    }

    public function onDestroyed(destroyedEvent : DestroyedEvent) : Void {
    }

    public function getPickupBehavior() : PickupBehavior {
        return this.pickupBehavior;
    }

    public function setPickupBehavior(pickupBehavior : PickupBehavior) : Void {
        this.pickupBehavior = pickupBehavior;
    }

    // throws Exception
    public function addPart(pickedUpLayerInterfaceFactoryInterface : PickedUpLayerInterfaceFactoryInterface) : Void {
    }

    public function setPartInterfaceArray(partInterfaceArray : haxe.ds.Vector<PartInterface>) : Void {
        this.partInterfaceArrayP = partInterfaceArray;
    }

    public function getPartInterfaceArray() : haxe.ds.Vector<PartInterface> {
        return this.partInterfaceArrayP;
    }

    private static final READYFOREXPLOSION : String = "ReadyForExplosion: ";
    public override function toStringAppend(stringBuffer : StringMaker) : Void {
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        final positionStrings : PositionStrings = PositionStrings.getInstance();
        super.toStringAppend(stringBuffer);
        stringBuffer.append(commonSeps.NEW_LINE);
        final groupInterfaceArray : haxe.ds.Vector<Group> = this.getGroupInterface();
        final size : Int = groupInterfaceArray.length;
        for (index in 0...size) {
            stringBuffer.append(Std.string(groupInterfaceArray[index]));
            stringBuffer.append(commonSeps.COMMA);
        }
        final pickupBehavior : PickupBehavior = this.getPickupBehavior();
        if (pickupBehavior != null) {
            stringBuffer.append(commonSeps.NEW_LINE);
            stringBuffer.append(Std.string(pickupBehavior));
        }
        stringBuffer.append(commonSeps.NEW_LINE);
        stringBuffer.append(CollidableDestroyableDamageableLayer.READYFOREXPLOSION);
        stringBuffer.appendboolean(this.readyForExplosion);
        stringBuffer.append(commonSeps.NEW_LINE);
        stringBuffer.append(this.commonStrings.INIT);
        stringBuffer.append(commonSeps.SPACE);
        stringBuffer.append(positionStrings.X_LABEL);
        stringBuffer.appendint(this.initX);
        stringBuffer.append(positionStrings.Y_LABEL);
        stringBuffer.appendint(this.initX);
        stringBuffer.append(positionStrings.Z_LABEL);
        stringBuffer.appendint(this.initZ);
    }

    public override function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        this.toStringAppend(stringBuffer);
        return Std.string(stringBuffer);
    }

}

