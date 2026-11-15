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

import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class FeatureResourceInitializationUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : FeatureResourceInitializationUtil = new FeatureResourceInitializationUtil();
    public static function getInstance() : FeatureResourceInitializationUtil {
        return FeatureResourceInitializationUtil.instance;
    }

    // throws Exception
    public function init(level : Int) : Void {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        this.logUtil.putF(commonStrings.START, this, commonStrings.INIT);
        var featuredResourceFactory : FeaturedResourceFactory = FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance();
        featuredResourceFactory.init(level);
        FeaturedResourceRelativeRelationshipFactory.getInstance().init(level);
    }

    public function new() {
    }
}

