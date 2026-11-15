// Generated Code Do Not Modify
package org.platform.opengl;

//import javax.microedition.khronos.opengles.GL10;

class OpenGLGLU {
    private static final instance : OpenGLGLU = new OpenGLGLU();
    public static function getInstance() : OpenGLGLU {
        return OpenGLGLU.instance;
    }

    public function gluLookAt(gl : GL10, eyeX : Float, eyeY : Float, eyeZ : Float, centerX : Float, centerY : Float, centerZ : Float, upX : Float, upY : Float, upZ : Float) : Void {
        throw new haxe.Exception();
    }

    public function gluProject(gl : GL10, objX : Float, objY : Float, objZ : Float, model : haxe.ds.Vector<Float>, modelOffset : Int, project : haxe.ds.Vector<Float>, projectOffset : Int, view : haxe.ds.Vector<Int>, viewOffset : Int, win : haxe.ds.Vector<Float>, winOffset : Int) : Int {
        throw new haxe.Exception();
    }

    public function gluUnProject(gl : GL10, winX : Float, winY : Float, winZ : Float, model : haxe.ds.Vector<Float>, modelOffset : Int, project : haxe.ds.Vector<Float>, projectOffset : Int, view : haxe.ds.Vector<Int>, viewOffset : Int, obj : haxe.ds.Vector<Float>, objOffset : Int) : Int {
        throw new haxe.Exception();
    }

    public function glFrustumf(gl : GL10, lt : Float, rt : Float, btm : Float, top : Float, zNear : Float, zFar : Float) : Void {
        throw new haxe.Exception();
    }

    public function new() {
    }
}

