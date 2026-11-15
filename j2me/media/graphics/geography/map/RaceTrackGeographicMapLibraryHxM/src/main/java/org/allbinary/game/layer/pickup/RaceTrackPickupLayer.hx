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

import org.allbinary.animation.NullAnimationFactory;
import org.allbinary.game.identification.BasicGroupFactory;
import org.allbinary.game.layer.AllBinaryTiledLayer;
import org.allbinary.game.multiplayer.layer.RemoteInfo;
import org.allbinary.game.view.TileLayerPositionIntoViewPosition;
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.Rectangle;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.view.ViewPosition;
import org.allbinary.view.event.ViewPositionEventHandler;

class RaceTrackPickupLayer extends PickupLayer {
    private static final NAME : String = "RaceTrackPickupLayer";
    public function new() {
        super(NAME, RemoteInfo.REMOTE_INFO, 0, CountedPickedUpLayerInterfaceFactory.NULL_COUNTED_PICKUP_LAYER_FACTORY, NullAnimationFactory.getFactoryInstance().getInstance(0), new Rectangle(PointFactory.getInstance().ZERO_ZERO, 0, 0), new TileLayerPositionIntoViewPosition());
    }

    private final viewPositionEventHandler : ViewPositionEventHandler = ViewPositionEventHandler.getInstance();
    public function setTiledLayer(tiledLayer : AllBinaryTiledLayer) : Void {
        final viewPosition : TileLayerPositionIntoViewPosition = (cast this.getViewPosition() : TileLayerPositionIntoViewPosition);
        viewPosition.setTiledLayer(tiledLayer);
        this.viewPositionEventHandler.addListener((cast this : AllBinaryLayer));
    }

    public override function setDestroyed(destroyed : Bool) : Void {
        super.setDestroyed(destroyed);
        if (this.isDestroyed()) {
            this.viewPositionEventHandler.removeListener(this);
        }
    }

}

