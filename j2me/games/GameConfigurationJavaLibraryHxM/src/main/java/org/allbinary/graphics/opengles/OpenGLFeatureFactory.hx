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


class OpenGLFeatureFactory {
    private static final instance : OpenGLFeatureFactory = new OpenGLFeatureFactory();
    public static function getInstance() : OpenGLFeatureFactory {
        return OpenGLFeatureFactory.instance;
    }

    public function new() {
    }

    public final OPENGL_OPTIONS : OpenGLFeature = new OpenGLFeature("OpenGL Options");
    public final OPENGL : OpenGLFeature = new OpenGLFeature("OpenGL");
    public final OPENGL_SURFACE_VIEW : OpenGLFeature = new OpenGLFeature("GLSurfaceView");
    public final OPENGL_2D : OpenGLFeature = new OpenGLFeature("OpenGL 2D");
    public final OPENGL_3D : OpenGLFeature = new OpenGLFeature("OpenGL 3D");
    public final OPENGL_2D_AND_3D : OpenGLFeature = new OpenGLFeature("OpenGL 2D/3D");
    public final OPENGL_AUTO_SELECT : OpenGLFeature = new OpenGLFeature("Auto Select");
    public final OPENGL_MINIMUM : OpenGLFeature = new OpenGLFeature("Minimum");
    public final OPENGL_AS_GAME_THREAD : OpenGLFeature = new OpenGLFeature("As game thread");
    public final OPENGL_AND_GAME_HAVE_DIFFERENT_THREADS : OpenGLFeature = new OpenGLFeature("As different threads");
    public final IMAGE_COLOR_DEPTH_4444 : OpenGLFeature = new OpenGLFeature("4444");
    public final IMAGE_COLOR_DEPTH_8888 : OpenGLFeature = new OpenGLFeature("8888");
    public final IMAGE_COLOR_DEPTH_565 : OpenGLFeature = new OpenGLFeature("565");
    public final OPENGL_COLOR_DEPTH_4444 : OpenGLFeature = new OpenGLFeature("4444");
    public final OPENGL_COLOR_DEPTH_8888 : OpenGLFeature = new OpenGLFeature("8888");
    public final OPENGL_COLOR_DEPTH_565 : OpenGLFeature = new OpenGLFeature("565");
    public final OPENGL_DRAW_TEXTURE : OpenGLFeature = new OpenGLFeature("GL_OES_draw_texture");
    public final OPENGL_VERTEX_BUFFER_OBJECT : OpenGLFeature = new OpenGLFeature("vertex_buffer_object");
    public final OPENGL_SIMPLE_OBJECT3D_PROCESSOR : OpenGLFeature = new OpenGLFeature("Simple Object3d Processor");
    public final OPENGL_COMPLEX_OBJECT3D_PROCESSOR : OpenGLFeature = new OpenGLFeature("Complex Object3d Processor");
    public final OPENGL_SIMPLE_TEXTURE_PROCESSOR : OpenGLFeature = new OpenGLFeature("Simple Texture Processor");
    public final OPENGL_COMPLEX_TEXTURE_PROCESSOR : OpenGLFeature = new OpenGLFeature("Complex Texture Processor");
}

