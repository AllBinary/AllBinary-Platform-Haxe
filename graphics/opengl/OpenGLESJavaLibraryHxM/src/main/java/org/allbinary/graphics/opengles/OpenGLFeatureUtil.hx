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
package org.allbinary.graphics.opengles;

import org.allbinary.game.configuration.feature.Features;

class OpenGLFeatureUtil {
    private static final instance : OpenGLFeatureUtil = new OpenGLFeatureUtil();
    public static function getInstance() : OpenGLFeatureUtil {
        return OpenGLFeatureUtil.instance;
    }

    private final anyThreed : Bool;
    public function new() {
        final openGLConfiguration : OpenGLConfiguration = OpenGLConfiguration.getInstance();
        final features : Features = Features.getInstance();
        final openGLFeatureFactory : OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance();
        this.anyThreed = openGLConfiguration.isOpenGL() && (features.isFeature(openGLFeatureFactory.OPENGL_2D_AND_3D) || features.isFeature(openGLFeatureFactory.OPENGL_3D));
    }

    public function isAnyThreed() : Bool {
        return this.anyThreed;
    }

}

