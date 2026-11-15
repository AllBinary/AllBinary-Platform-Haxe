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
package org.allbinary.bounds;

import org.allbinary.graphics.Rectangle;

class RectangleLayerBounds extends LayerBounds {
    public function new(rectangle : Rectangle) {
        super(rectangle);
    }

    public override function visit(boundsVisitorInterface : BoundsVisitorInterface) : Void {
        if (boundsVisitorInterface.getX() > this.rectangle.getMaxX()) {
            boundsVisitorInterface.maxX();
        }
        if (boundsVisitorInterface.getY() > this.rectangle.getMaxY()) {
            boundsVisitorInterface.maxY();
        }
        if (boundsVisitorInterface.getX() < this.rectangle.getPoint().getX()) {
            boundsVisitorInterface.minX();
        }
        if (boundsVisitorInterface.getY() < this.rectangle.getPoint().getY()) {
            boundsVisitorInterface.minY();
        }
    }

}

