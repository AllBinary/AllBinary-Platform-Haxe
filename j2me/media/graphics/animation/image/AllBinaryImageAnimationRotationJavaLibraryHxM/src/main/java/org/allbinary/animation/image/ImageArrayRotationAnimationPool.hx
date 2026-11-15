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
package org.allbinary.animation.image;

import org.allbinary.logic.util.cache.BasicArrayListResetablePool;
import org.allbinary.logic.util.cache.CacheableInterface;
import org.allbinary.logic.util.cache.CacheableInterfaceFactoryInterface;
import org.allbinary.logic.util.cache.PoolInterface;

class ImageArrayRotationAnimationPool extends BasicArrayListResetablePool {
    private static var IMAGE_ROTATION_ANIMATION_POOL : PoolInterface = new ImageArrayRotationAnimationPool(new ImageArrayRotationAnimationCacheableInterfaceFactory());
    public function new(cacheableInterfaceFactoryInterface : CacheableInterfaceFactoryInterface) {
        super(cacheableInterfaceFactoryInterface);
    }

    public static function getInstance() : PoolInterface {
        return ImageArrayRotationAnimationPool.IMAGE_ROTATION_ANIMATION_POOL;
    }

    // throws Exception
    public override function remove(key : Any) : CacheableInterface {
        final cacheableInterface : CacheableInterface = super.remove(key);
        final allBinaryImageRotationAnimationInfo : ImageArrayRotationAnimationInfo = (cast key : ImageArrayRotationAnimationInfo);
        final imageArrayRotationAnimationCacheable : ImageArrayRotationAnimationCacheable = ((cast cacheableInterface : ImageArrayRotationAnimationCacheable));
        imageArrayRotationAnimationCacheable.setImageArray(allBinaryImageRotationAnimationInfo.getImageArray());
        return cacheableInterface;
    }

}

