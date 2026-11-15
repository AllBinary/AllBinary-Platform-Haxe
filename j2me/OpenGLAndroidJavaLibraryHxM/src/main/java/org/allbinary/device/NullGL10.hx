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
package org.allbinary.device;

//import javax.microedition.khronos.opengles.GL10;
//import java.nio.Buffer;
//import java.nio.FloatBuffer;
//import java.nio.IntBuffer;
import org.allbinary.logic.string.StringUtil;

class NullGL10 implements GL10 {
    public static final NULL_GL10 : NullGL10 = new NullGL10();
    public function glActiveTexture(texture : Int) : Void {
        return;
    }

    public function glAlphaFunc(func : Int, ref : Float) : Void {
        return;
    }

    public function glAlphaFuncx(func : Int, ref : Int) : Void {
    }

    public function glBindTexture(target : Int, texture : Int) : Void {
        return;
    }

    public function glBlendFunc(sfactor : Int, dfactor : Int) : Void {
        return;
    }

    public function glClear(mask : Int) : Void {
        return;
    }

    public function glClearColor(red : Float, green : Float, blue : Float, alpha : Float) : Void {
        return;
    }

    public function glClearColorx(red : Int, green : Int, blue : Int, alpha : Int) : Void {
    }

    public function glClearDepthf(depth : Float) : Void {
        return;
    }

    public function glClearDepthx(depth : Int) : Void {
    }

    public function glClearStencil(s : Int) : Void {
        return;
    }

    public function glClientActiveTexture(texture : Int) : Void {
        return;
    }

    public function glColor4f(red : Float, green : Float, blue : Float, alpha : Float) : Void {
        return;
    }

    public function glColor4x(red : Int, green : Int, blue : Int, alpha : Int) : Void {
    }

    public function glColorMask(red : Bool, green : Bool, blue : Bool, alpha : Bool) : Void {
        return;
    }

    public function glColorPointer(size : Int, type : Int, stride : Int, pointer : Buffer) : Void {
        return;
    }

    public function glCompressedTexImage2D(target : Int, level : Int, internalformat : Int, width : Int, height : Int, border : Int, imageSize : Int, data : Buffer) : Void {
        return;
    }

    public function glCompressedTexSubImage2D(target : Int, level : Int, xoffset : Int, yoffset : Int, width : Int, height : Int, format : Int, imageSize : Int, data : Buffer) : Void {
        return;
    }

    public function glCopyTexImage2D(target : Int, level : Int, internalformat : Int, x : Int, y : Int, width : Int, height : Int, border : Int) : Void {
        return;
    }

    public function glCopyTexSubImage2D(target : Int, level : Int, xoffset : Int, yoffset : Int, x : Int, y : Int, width : Int, height : Int) : Void {
        return;
    }

    public function glCullFace(mode : Int) : Void {
        return;
    }

    public function glDeleteTextures(n : Int, textures : haxe.ds.Vector<Int>, offset : Int) : Void {
        return;
    }

    public function glDeleteTextures(n : Int, textures : IntBuffer) : Void {
        return;
    }

    public function glDepthFunc(func : Int) : Void {
        return;
    }

    public function glDepthMask(flag : Bool) : Void {
        return;
    }

    public function glDepthRangef(zNear : Float, zFar : Float) : Void {
        return;
    }

    public function glDepthRangex(zNear : Int, zFar : Int) : Void {
    }

    public function glDisable(cap : Int) : Void {
        return;
    }

    public function glDisableClientState(array : Int) : Void {
        return;
    }

    public function glDrawArrays(mode : Int, first : Int, count : Int) : Void {
        return;
    }

    public function glDrawElements(mode : Int, count : Int, type : Int, indices : Buffer) : Void {
        return;
    }

    public function glEnable(cap : Int) : Void {
        return;
    }

    public function glEnableClientState(array : Int) : Void {
        return;
    }

    public function glFinish() : Void {
        return;
    }

    public function glFlush() : Void {
        return;
    }

    public function glFogf(pname : Int, param : Float) : Void {
        return;
    }

    public function glFogfv(pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void {
        return;
    }

    public function glFogfv(pname : Int, params : FloatBuffer) : Void {
        return;
    }

    public function glFogx(pname : Int, param : Int) : Void {
    }

    public function glFogxv(pname : Int, params : haxe.ds.Vector<Int>, offset : Int) : Void {
    }

    public function glFogxv(pname : Int, params : IntBuffer) : Void {
    }

    public function glFrontFace(mode : Int) : Void {
        return;
    }

    public function glFrustumf(left : Float, right : Float, bottom : Float, top : Float, zNear : Float, zFar : Float) : Void {
        return;
    }

    public function glFrustumx(left : Int, right : Int, bottom : Int, top : Int, zNear : Int, zFar : Int) : Void {
    }

    public function glGenTextures(n : Int, textures : haxe.ds.Vector<Int>, offset : Int) : Void {
        return;
    }

    public function glGenTextures(n : Int, textures : IntBuffer) : Void {
        return;
    }

    public function glGetError() : Int {
        return 0;
    }

    public function glGetIntegerv(pname : Int, params : haxe.ds.Vector<Int>, offset : Int) : Void {
        return;
    }

    public function glGetIntegerv(pname : Int, params : IntBuffer) : Void {
        return;
    }

    public function glGetString(name : Int) : String {
        return StringUtil.getInstance().EMPTY_STRING;
    }

    public function glHint(target : Int, mode : Int) : Void {
        return;
    }

    public function glLightModelf(pname : Int, param : Float) : Void {
        return;
    }

    public function glLightModelfv(pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void {
        return;
    }

    public function glLightModelfv(pname : Int, params : FloatBuffer) : Void {
        return;
    }

    public function glLightModelx(pname : Int, param : Int) : Void {
    }

    public function glLightModelxv(pname : Int, params : haxe.ds.Vector<Int>, offset : Int) : Void {
    }

    public function glLightModelxv(pname : Int, params : IntBuffer) : Void {
    }

    public function glLightf(light : Int, pname : Int, param : Float) : Void {
        return;
    }

    public function glLightfv(light : Int, pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void {
        return;
    }

    public function glLightfv(light : Int, pname : Int, params : FloatBuffer) : Void {
        return;
    }

    public function glLightx(light : Int, pname : Int, param : Int) : Void {
    }

    public function glLightxv(light : Int, pname : Int, params : haxe.ds.Vector<Int>, offset : Int) : Void {
    }

    public function glLightxv(light : Int, pname : Int, params : IntBuffer) : Void {
    }

    public function glLineWidth(width : Float) : Void {
        return;
    }

    public function glLineWidthx(width : Int) : Void {
    }

    public function glLoadIdentity() : Void {
        return;
    }

    public function glLoadMatrixf(m : haxe.ds.Vector<Float>, offset : Int) : Void {
        return;
    }

    public function glLoadMatrixf(m : FloatBuffer) : Void {
        return;
    }

    public function glLoadMatrixx(m : haxe.ds.Vector<Int>, offset : Int) : Void {
    }

    public function glLoadMatrixx(m : IntBuffer) : Void {
    }

    public function glLogicOp(opcode : Int) : Void {
        return;
    }

    public function glMaterialf(face : Int, pname : Int, param : Float) : Void {
        return;
    }

    public function glMaterialfv(face : Int, pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void {
        return;
    }

    public function glMaterialfv(face : Int, pname : Int, params : FloatBuffer) : Void {
        return;
    }

    public function glMaterialx(face : Int, pname : Int, param : Int) : Void {
    }

    public function glMaterialxv(face : Int, pname : Int, params : haxe.ds.Vector<Int>, offset : Int) : Void {
    }

    public function glMaterialxv(face : Int, pname : Int, params : IntBuffer) : Void {
    }

    public function glMatrixMode(mode : Int) : Void {
        return;
    }

    public function glMultMatrixf(m : haxe.ds.Vector<Float>, offset : Int) : Void {
        return;
    }

    public function glMultMatrixf(m : FloatBuffer) : Void {
        return;
    }

    public function glMultMatrixx(m : haxe.ds.Vector<Int>, offset : Int) : Void {
    }

    public function glMultMatrixx(m : IntBuffer) : Void {
    }

    public function glMultiTexCoord4f(target : Int, s : Float, t : Float, r : Float, q : Float) : Void {
        return;
    }

    public function glMultiTexCoord4x(target : Int, s : Int, t : Int, r : Int, q : Int) : Void {
    }

    public function glNormal3f(nx : Float, ny : Float, nz : Float) : Void {
        return;
    }

    public function glNormal3x(nx : Int, ny : Int, nz : Int) : Void {
    }

    public function glNormalPointer(type : Int, stride : Int, pointer : Buffer) : Void {
        return;
    }

    public function glOrthof(left : Float, right : Float, bottom : Float, top : Float, zNear : Float, zFar : Float) : Void {
        return;
    }

    public function glOrthox(left : Int, right : Int, bottom : Int, top : Int, zNear : Int, zFar : Int) : Void {
    }

    public function glPixelStorei(pname : Int, param : Int) : Void {
        return;
    }

    public function glPointSize(size : Float) : Void {
        return;
    }

    public function glPointSizex(size : Int) : Void {
    }

    public function glPolygonOffset(factor : Float, units : Float) : Void {
        return;
    }

    public function glPolygonOffsetx(factor : Int, units : Int) : Void {
    }

    public function glPopMatrix() : Void {
        return;
    }

    public function glPushMatrix() : Void {
        return;
    }

    public function glReadPixels(x : Int, y : Int, width : Int, height : Int, format : Int, type : Int, pixels : Buffer) : Void {
        return;
    }

    public function glRotatef(angle : Float, x : Float, y : Float, z : Float) : Void {
        return;
    }

    public function glRotatex(angle : Int, x : Int, y : Int, z : Int) : Void {
        return;
    }

    public function glSampleCoverage(value : Float, invert : Bool) : Void {
        return;
    }

    public function glSampleCoveragex(value : Int, invert : Bool) : Void {
    }

    public function glScalef(x : Float, y : Float, z : Float) : Void {
        return;
    }

    public function glScalex(x : Int, y : Int, z : Int) : Void {
        return;
    }

    public function glScissor(x : Int, y : Int, width : Int, height : Int) : Void {
        return;
    }

    public function glShadeModel(mode : Int) : Void {
        return;
    }

    public function glStencilFunc(func : Int, ref : Int, mask : Int) : Void {
        return;
    }

    public function glStencilMask(mask : Int) : Void {
        return;
    }

    public function glStencilOp(fail : Int, zfail : Int, zpass : Int) : Void {
        return;
    }

    public function glTexCoordPointer(size : Int, type : Int, stride : Int, pointer : Buffer) : Void {
        return;
    }

    public function glTexEnvf(target : Int, pname : Int, param : Float) : Void {
        return;
    }

    public function glTexEnvfv(target : Int, pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void {
        return;
    }

    public function glTexEnvfv(target : Int, pname : Int, params : FloatBuffer) : Void {
        return;
    }

    public function glTexEnvx(target : Int, pname : Int, param : Int) : Void {
    }

    public function glTexEnvxv(target : Int, pname : Int, params : haxe.ds.Vector<Int>, offset : Int) : Void {
    }

    public function glTexEnvxv(target : Int, pname : Int, params : IntBuffer) : Void {
    }

    public function glTexImage2D(target : Int, level : Int, internalformat : Int, width : Int, height : Int, border : Int, format : Int, type : Int, pixels : Buffer) : Void {
        return;
    }

    public function glTexParameterf(target : Int, pname : Int, param : Float) : Void {
        return;
    }

    public function glTexParameterx(target : Int, pname : Int, param : Int) : Void {
    }

    public function glTexSubImage2D(target : Int, level : Int, xoffset : Int, yoffset : Int, width : Int, height : Int, format : Int, type : Int, pixels : Buffer) : Void {
        return;
    }

    public function glTranslatef(x : Float, y : Float, z : Float) : Void {
        return;
    }

    public function glTranslatex(x : Int, y : Int, z : Int) : Void {
    }

    public function glVertexPointer(size : Int, type : Int, stride : Int, pointer : Buffer) : Void {
        return;
    }

    public function glViewport(x : Int, y : Int, width : Int, height : Int) : Void {
        return;
    }

    public function new() {
    }
}

