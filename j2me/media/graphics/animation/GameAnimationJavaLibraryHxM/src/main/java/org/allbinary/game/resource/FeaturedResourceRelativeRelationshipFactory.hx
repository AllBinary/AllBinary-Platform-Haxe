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
package org.allbinary.game.resource;

import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.RelativeRelationship;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.layer.relationship.RelativeLayerRelationship;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.util.BasicArrayListUtil;

class FeaturedResourceRelativeRelationshipFactory extends FeaturedResourceFactory {
    private static var INSTANCE : FeaturedResourceRelativeRelationshipFactory = new FeaturedResourceRelativeRelationshipFactory();
    public function new() {
        super();
    }

    public static function getInstance() : FeaturedResourceRelativeRelationshipFactory {
        return FeaturedResourceRelativeRelationshipFactory.INSTANCE;
    }

    private final basicArrayListUtil : BasicArrayListUtil = BasicArrayListUtil.getInstance();
    // throws Exception
    public function getRelativeRelationshipList(resource : String, layer : AllBinaryLayer) : BasicArrayList {
        final featureReleaseList : BasicArrayList = this.getList();
        var size : Int = this.getList().size();
        for (index in 0...size) {
            var featureInterface : ResourceRelativeRelationshipFactoryInterface = (cast featureReleaseList.objectArray[index] : ResourceRelativeRelationshipFactoryInterface);
            if (featureInterface.isFeature()) {
                var list : BasicArrayList = featureInterface.getResourceRelativeRelationshipList(resource);
                if (list != this.basicArrayListUtil.getImmutableInstance()) {
                    return this.duplicate(list, layer);
                }
            }
        }
        throw new haxe.Exception(new StringMaker().append("Not available for current feature selection or Resource: ").append(resource).toString());
    }

    // throws Exception
    private function duplicate(list : BasicArrayList, layer : AllBinaryLayer) : BasicArrayList {
        final pointFactory : PointFactory = PointFactory.getInstance();
        final newList : BasicArrayList = new BasicArrayListD();
        final size : Int = list.size();
        for (index in 0...size) {
            var relativeRelationship : RelativeRelationship = (cast list.objectArray[index] : RelativeRelationship);
            newList.add(new RelativeLayerRelationship(layer, pointFactory.createXY(relativeRelationship.getX(), relativeRelationship.getY()), BasicArrayListUtil.getInstance().getImmutableInstance()));
        }
        return newList;
    }

}

