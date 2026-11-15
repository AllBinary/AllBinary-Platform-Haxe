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
package org.allbinary.game.layer.resources;

import org.allbinary.animation.resource.BaseResourceAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.MainFeatureFactory;
import org.allbinary.game.layer.GameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory;
import org.allbinary.game.layer.LayerPlacementInterfaceBasicArrayListFactoryInterface;
import org.allbinary.game.resource.ResourceLoadingLevelFactory;
import org.allbinary.image.ImageCache;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonStrings;

class OnDemandLoader {
    private final onDemandResourcesFactory : OnDemandResourcesFactory;
    private final gameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory : GameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory;
    private final resourceAnimationInterfaceFactoryInterfaceFactory : BaseResourceAnimationInterfaceFactoryInterfaceFactory;
    public function new(onDemandResourcesFactory : OnDemandResourcesFactory, gameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory : GameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory, resourceAnimationInterfaceFactoryInterfaceFactory : BaseResourceAnimationInterfaceFactoryInterfaceFactory) {
        this.onDemandResourcesFactory = onDemandResourcesFactory;
        this.gameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory = gameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory;
        this.resourceAnimationInterfaceFactoryInterfaceFactory = resourceAnimationInterfaceFactoryInterfaceFactory;
    }

    // throws Exception
    public function init(imageCache : ImageCache, level : Int, loadingString : String) : Void {
        final resourceLoadingLevelFactory : ResourceLoadingLevelFactory = ResourceLoadingLevelFactory.getInstance();
        if (Features.getInstance().isFeature(MainFeatureFactory.getInstance().LOAD_ALL)) {
            if (this.resourceAnimationInterfaceFactoryInterfaceFactory.isInitialized()) {
                return;
            }
            this.initAll(imageCache, loadingString);
        } else if (level != resourceLoadingLevelFactory.LOAD_ALL.getLevel()) {
            final layerPlacementInterfaceBasicArrayListFactoryInterface : LayerPlacementInterfaceBasicArrayListFactoryInterface = this.gameLayerPlacementInterfaceBasicArrayListFactoryInterfaceFactory.getInstance(level);
            this.initLevel(layerPlacementInterfaceBasicArrayListFactoryInterface, imageCache, level, loadingString);
        }
    }

    // throws Exception
    private function initAll(imageCache : ImageCache, loadingString : String) : Void {
        var index : Int = 0;
        final portion : Int = 120;
        var onDemandResources : OnDemandResources = null;
        {
            var onDemandIndex : Int = this.onDemandResourcesFactory.size();
            while (--onDemandIndex >= 0) {
            onDemandResources = this.onDemandResourcesFactory.remove(onDemandIndex);
            if (onDemandResources != OnDemandResources.NULL_ON_DEMAND_RESOURCES) {
                index = onDemandResources.initAt(imageCache, this.resourceAnimationInterfaceFactoryInterfaceFactory, portion, loadingString, index);
            }
            }
        }
    }

    // throws Exception
    private function initLevel(layerPlacementInterfaceBasicArrayListFactoryInterface : LayerPlacementInterfaceBasicArrayListFactoryInterface, imageCache : ImageCache, level : Int, loadingString : String) : Void {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        final portion : Int = 120;
        var index : Int = 0;
        final onDemandArray : haxe.ds.Vector<Int> = layerPlacementInterfaceBasicArrayListFactoryInterface.getOnDemandResources();
        PreLogUtil.put(Std.string(new StringMaker().append(commonStrings.START).appendint(onDemandArray.length)), this, "initLevel");
        var onDemandResources : OnDemandResources = null;
        {
            var onDemandIndex : Int = onDemandArray.length;
            while (--onDemandIndex >= 0) {
            onDemandResources = this.onDemandResourcesFactory.remove(onDemandArray[onDemandIndex]);
            if (onDemandResources != OnDemandResources.NULL_ON_DEMAND_RESOURCES) {
                index = onDemandResources.initAt(imageCache, this.resourceAnimationInterfaceFactoryInterfaceFactory, portion, loadingString, index);
            }
            }
        }
    }

}

