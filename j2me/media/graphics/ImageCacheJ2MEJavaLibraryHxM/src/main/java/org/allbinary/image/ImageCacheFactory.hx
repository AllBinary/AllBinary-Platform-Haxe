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
package org.allbinary.image;


class ImageCacheFactory {
    private static final IMAGE_CACHE : ImageCache = new ImageCache();
    public static function getInstance() : ImageCache {
        return ImageCacheFactory.IMAGE_CACHE;
    }

    public static function init() : Void {
    }

    public function new() {
    }
}

