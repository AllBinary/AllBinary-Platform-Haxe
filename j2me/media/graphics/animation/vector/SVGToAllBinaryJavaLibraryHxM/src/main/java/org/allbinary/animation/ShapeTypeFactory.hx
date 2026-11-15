/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2026 AllBinary 
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
package org.allbinary.animation;


class ShapeTypeFactory {
    private static final instance : ShapeTypeFactory = new ShapeTypeFactory();
    public static function getInstance() : ShapeTypeFactory {
        return ShapeTypeFactory.instance;
    }

    public final KEY_LINE : String = "line";
    public final KEY_CIRCLE : String = "circle";
    public final KEY_RECTANGLE : String = "rectangle";
    public final KEY_RECT : String = "rect";
    public final LINE : ShapeType = new ShapeType(KEY_LINE);
    public final CIRCLE : ShapeType = new ShapeType(KEY_CIRCLE);
    public final RECTANGLE : ShapeType = new ShapeType(KEY_RECTANGLE);
    public function new() {
    }
}

