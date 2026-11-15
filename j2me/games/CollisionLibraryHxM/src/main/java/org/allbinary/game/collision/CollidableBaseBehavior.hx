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
package org.allbinary.game.collision;

import javax.microedition.lcdui.Graphics;
import org.allbinary.game.layer.CollidableCompositeLayer;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;

class CollidableBaseBehavior implements CollidableInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final layerCollisionUtil : LayerCollisionUtil = LayerCollisionUtil.getInstance();
    private var collidable : Bool = true;
    public function new(collidable : Bool) {
        this.collidable = collidable;
    }

    public function update() : Void {
    }

    public function getName() : String {
        return Type.getClassName(Type.getClass(this));
    }

    public function setCollidable(collidable : Bool) : Void {
        this.collidable = collidable;
    }

    public function isCollidable(ownerLayer : CollidableCompositeLayer) : Bool {
        return this.collidable;
    }

    // throws Exception
    public function collide(ownerLayer : CollidableCompositeLayer, allbinaryCollidableLayer : CollidableCompositeLayer) : Void {
        throw new jre.lang.JavaException(Std.string(new StringMaker().append(this.commonStrings.NOT_IMPLEMENTED).append(CommonLabels.getInstance().COLON_SEP).append(Type.getClassName(Type.getClass(this)))));
    }

    public function isCollision(ownerLayer : CollidableCompositeLayer, collisionLayer : CollidableCompositeLayer) : Bool {
        return this.layerCollisionUtil.isCollision(ownerLayer, collisionLayer);
    }

    public function isCollisionInterface(ownerLayer : CollidableCompositeLayer, collidableInterfaceCompositeInterface : CollidableInterfaceCompositeInterface) : Bool {
        return this.layerCollisionUtil.isCollision(ownerLayer, (cast collidableInterfaceCompositeInterface : AllBinaryLayer));
    }

    // throws Exception
    public function collideInterface(ownerLayer : CollidableCompositeLayer, collidableInterfaceCompositeInterface : CollidableInterfaceCompositeInterface) : Void {
        throw new jre.lang.JavaException(this.commonStrings.NOT_IMPLEMENTED);
    }

    public function paint(ownerLayer : CollidableCompositeLayer, graphics : Graphics) : Void {
    }

    public function getCollisionTypeWith(layerInterface : AllBinaryLayer) : CollisionType {
        return CollisionTypeFactory.getInstance().NONE;
    }

}

