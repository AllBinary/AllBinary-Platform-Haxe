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

import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GameFeatureFactory;
import org.allbinary.graphics.opengles.OpenGLFeatureUtil;
import org.allbinary.layer.AllBinaryLayer;

class LayerCollisionUtil {
    private static final instance : LayerCollisionUtil = new LayerCollisionUtil();
    public static function getInstance() : LayerCollisionUtil {
        return LayerCollisionUtil.instance;
    }

    private final collisionProcessor : CollisionProcessor = null;
    public function new() {
        var features : Features = Features.getInstance();
        var gameFeatureFactory : GameFeatureFactory = GameFeatureFactory.getInstance();
        if (OpenGLFeatureUtil.getInstance().isAnyThreed() && !features.isFeature(gameFeatureFactory.COLLISIONS_FORCED_TWO_DIMENSIONAL)) {
            this.collisionProcessor = new CollisionThreedProcessor();
        } else {
            this.collisionProcessor = new Collision2DProcessor();
        }
    }

    public function isCollision(myLayer : AllBinaryLayer, myLayer2 : AllBinaryLayer) : Bool {
        return this.collisionProcessor.isCollision(myLayer, myLayer2);
    }

}

