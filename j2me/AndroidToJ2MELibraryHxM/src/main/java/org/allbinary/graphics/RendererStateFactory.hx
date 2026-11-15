/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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
package org.allbinary.graphics;


class RendererStateFactory {
    private static final instance : RendererStateFactory = new RendererStateFactory();
    public static function getInstance() : RendererStateFactory {
        return RendererStateFactory.instance;
    }

    private var loaded : Bool = false;
    private var surfaceChanged : Bool = false;
    public function setLoaded(loaded : Bool) : Void {
        this.loaded = loaded;
    }

    public function isLoaded() : Bool {
        return this.loaded;
    }

    public function setSurfaceChanged(initialized : Bool) : Void {
        this.surfaceChanged = initialized;
    }

    public function isSurfaceChanged() : Bool {
        return this.surfaceChanged;
    }

    public function new() {
    }
}

