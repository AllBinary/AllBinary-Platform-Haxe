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
package org.allbinary.input.motion.button;

import org.allbinary.animation.resource.BaseResourceAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.resource.ResourceLoadingLevelFactory;
import org.allbinary.graphics.opengles.OpenGLFeatureFactory;
import org.allbinary.image.ImageCache;
import org.allbinary.image.ImageCacheFactory;
import org.allbinary.logic.StdUtil;

class TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory extends BaseResourceAnimationInterfaceFactoryInterfaceFactory {
    public static function createFactory() : TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory {
        return new TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory("TouchButton Animations");
    }

    public function new(name : String) {
        super(name, StdUtil.getInstance().createHashtable(), StdUtil.getInstance().createHashtable(), StdUtil.getInstance().createHashtable());
    }

    // throws Exception
    public override function init(level : Int) : Void {
        this.initImageCache(ImageCacheFactory.getInstance(), level);
    }

    // throws Exception
    public override function initImageCache(imageCache : ImageCache, level : Int) : Void {
        if (this.isInitialized()) {
            return;
        }
        super.init(level);
    }

    public override function isLoadingLevel(level : Int) : Bool {
        var resourceLoadingLevelFactory : ResourceLoadingLevelFactory = ResourceLoadingLevelFactory.getInstance();
        if (level == resourceLoadingLevelFactory.LOAD_TOUCH.getLevel()) {
            return true;
        } else {
            return super.isLoadingLevel(level);
        }
    }

    public override function isFeature() : Bool {
        if (!Features.getInstance().isDefault(OpenGLFeatureFactory.getInstance().OPENGL)) {
            return true;
        } else {
            return false;
        }
    }

}

