/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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


class OrthogonalLightingOpenGLProcessorFactory {
    private static final instance : OrthogonalLightingOpenGLProcessorFactory = new OrthogonalLightingOpenGLProcessorFactory();
    public static function getInstance() : OrthogonalLightingOpenGLProcessorFactory {
        return OrthogonalLightingOpenGLProcessorFactory.instance;
    }

    public var sceneLightingOrthogonalModeOpenGLProcessor : OpenGLProcessor = NullOpenGLProcessorFactory.getInstance();
    public var sceneLightsOrthogonalModeOpenGLProcessor : OpenGLProcessor = NullOpenGLProcessorFactory.getInstance();
    public function new() {
    }
}

