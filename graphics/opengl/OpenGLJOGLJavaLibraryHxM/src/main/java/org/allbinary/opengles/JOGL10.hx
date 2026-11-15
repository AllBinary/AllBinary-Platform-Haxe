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
package org.allbinary.opengles;

import com.jogamp.opengl.glu.GLU;

//JOGLEToKhronosGL10
class JOGL10 implements javax.microedition.khronos.opengles.GL10 {
    public final RED : String = "red: ";
    public final GREEN : String = " green: ";
    public final BLUE : String = " blue: ";
    public final ALPHA : String = " alpha: ";
    public final PNAME : String = "pname: ";
    public final _PNAME : String = " pname: ";
    public final PARAM : String = " param: ";
    public final PARAMS : String = " params: ";
    public final LIGHT : String = "light: ";
    public final FACE : String = "face: ";
    public final TARGET : String = "target: ";
    private final gl10 : com.jogamp.opengl.GL2;
    public final glu : GLU;
    public final GL_LINE : Int;
    public final GL_QUAD_STRIP : Int;
    public function new(gl : com.jogamp.opengl.GL, gl2 : com.jogamp.opengl.GL2) {
        this.gl10 = gl2;
        this.glu = GLU.createGLU(this.gl10);
        this.GL_LINE = com.jogamp.opengl.GL2.GL_LINE;
        this.GL_QUAD_STRIP = com.jogamp.opengl.GL2.GL_QUAD_STRIP;
    }

    public function getJOGLGL() : com.jogamp.opengl.GL2 {
        return this.gl10;
    }

    public function glActiveTexture(texture : Int) : Void {
        this.gl10.glActiveTexture(texture);
    }

    public function glAlphaFunc(func : Int, ref : Float) : Void {
        this.gl10.glAlphaFunc(func, ref);
    }

    public function glBindTexture(target : Int, texture : Int) : Void {
        this.gl10.glBindTexture(target, texture);
    }

    public function glBlendFunc(sfactor : Int, dfactor : Int) : Void {
        this.gl10.glBlendFunc(sfactor, dfactor);
    }

    public function glClear(mask : Int) : Void {
        this.gl10.glClear(mask);
    }

    public function glClearColor(red : Float, green : Float, blue : Float, alpha : Float) : Void {
        this.gl10.glClearColor(red, green, blue, alpha);
    }

    public function glClearDepthf(depth : Float) : Void {
        this.gl10.glClearDepthf(depth);
    }

    public function glClearStencil(s : Int) : Void {
        this.gl10.glClearStencil(s);
    }

    public function glClientActiveTexture(texture : Int) : Void {
        this.gl10.glClientActiveTexture(texture);
    }

    public function glColor4f(red : Float, green : Float, blue : Float, alpha : Float) : Void {
        this.gl10.glColor4f(red, green, blue, alpha);
    }

    public function glColorMask(red : Bool, green : Bool, blue : Bool, alpha : Bool) : Void {
        this.gl10.glColorMask(red, green, blue, alpha);
    }

    public function glColorPointer(size : Int, type : Int, stride : Int, pointer : java.nio.Buffer) : Void {
        this.gl10.glColorPointer(size, type, stride, pointer);
    }

    public function glCompressedTexImage2D(target : Int, level : Int, internalformat : Int, width : Int, height : Int, border : Int, imageSize : Int, data : java.nio.Buffer) : Void {
        this.gl10.glCompressedTexImage2D(target, level, internalformat, width, height, border, imageSize, data);
    }

    public function glCompressedTexSubImage2D(target : Int, level : Int, xoffset : Int, yoffset : Int, width : Int, height : Int, format : Int, imageSize : Int, data : java.nio.Buffer) : Void {
        this.gl10.glCompressedTexSubImage2D(target, level, xoffset, yoffset, width, height, format, imageSize, data);
    }

    public function glCopyTexImage2D(target : Int, level : Int, internalformat : Int, x : Int, y : Int, width : Int, height : Int, border : Int) : Void {
        this.gl10.glCopyTexImage2D(target, level, internalformat, x, y, width, height, border);
    }

    public function glCopyTexSubImage2D(target : Int, level : Int, xoffset : Int, yoffset : Int, x : Int, y : Int, width : Int, height : Int) : Void {
        this.gl10.glCopyTexSubImage2D(target, level, xoffset, yoffset, x, y, width, height);
    }

    public function glCullFace(mode : Int) : Void {
        this.gl10.glCullFace(mode);
    }

    public function glDeleteTextures(n : Int, textures : haxe.ds.Vector<Int>, offset : Int) : Void {
        this.gl10.glDeleteTextures(n, textures, offset);
    }

    public function glDeleteTextures(n : Int, textures : java.nio.IntBuffer) : Void {
        this.gl10.glDeleteTextures(n, textures);
    }

    public function glDepthFunc(func : Int) : Void {
        this.gl10.glDepthFunc(func);
    }

    public function glDepthMask(flag : Bool) : Void {
        this.gl10.glDepthMask(flag);
    }

    public function glDepthRangef(zNear : Float, zFar : Float) : Void {
        this.gl10.glDepthRangef(zNear, zFar);
    }

    public function glDisable(cap : Int) : Void {
        this.gl10.glDisable(cap);
    }

    public function glDisableClientState(array : Int) : Void {
        this.gl10.glDisableClientState(array);
    }

    public function glDrawArrays(mode : Int, first : Int, count : Int) : Void {
        this.gl10.glDrawArrays(mode, first, count);
    }

    public function glDrawElements(mode : Int, count : Int, type : Int, indices : java.nio.Buffer) : Void {
        this.gl10.glDrawElements(mode, count, type, indices);
    }

    public function glEnable(cap : Int) : Void {
        this.gl10.glEnable(cap);
    }

    public function glEnableClientState(array : Int) : Void {
        this.gl10.glEnableClientState(array);
    }

    public function glFinish() : Void {
        this.gl10.glFinish();
    }

    public function glFlush() : Void {
        this.gl10.glFlush();
    }

    public function glFogf(pname : Int, param : Float) : Void {
        this.gl10.glFogf(pname, param);
    }

    public function glFogfv(pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void {
        this.gl10.glFogfv(pname, params, offset);
    }

    public function glFogfv(pname : Int, params : java.nio.FloatBuffer) : Void {
        this.gl10.glFogfv(pname, params);
    }

    public function glFrontFace(mode : Int) : Void {
        this.gl10.glFrontFace(mode);
    }

    public function glFrustumf(left : Float, right : Float, bottom : Float, top : Float, zNear : Float, zFar : Float) : Void {
        this.gl10.glFrustumf(left, right, bottom, top, zNear, zFar);
    }

    public function glGenTextures(n : Int, textures : haxe.ds.Vector<Int>, offset : Int) : Void {
        this.gl10.glGenTextures(n, textures, offset);
    }

    public function glGenTextures(n : Int, textures : java.nio.IntBuffer) : Void {
        this.gl10.glGenTextures(n, textures);
    }

    public function glGetError() : Int {
        return this.gl10.glGetError();
    }

    public function glGetIntegerv(pname : Int, params : haxe.ds.Vector<Int>, offset : Int) : Void {
        this.gl10.glGetIntegerv(pname, params, offset);
    }

    public function glGetIntegerv(pname : Int, params : java.nio.IntBuffer) : Void {
        this.gl10.glGetIntegerv(pname, params);
    }

    public function glGetString(name : Int) : String {
        return this.gl10.glGetString(name);
    }

    public function glHint(target : Int, mode : Int) : Void {
        this.gl10.glHint(target, mode);
    }

    public function glLightModelf(pname : Int, param : Float) : Void {
        this.gl10.glLightModelf(pname, param);
    }

    public function glLightModelfv(pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void {
        this.gl10.glLightModelfv(pname, params, offset);
    }

    public function glLightModelfv(pname : Int, params : java.nio.FloatBuffer) : Void {
        this.gl10.glLightModelfv(pname, params);
    }

    public function glLightf(light : Int, pname : Int, param : Float) : Void {
        this.gl10.glLightf(light, pname, param);
    }

    public function glLightfv(light : Int, pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void {
        this.gl10.glLightfv(light, pname, params, offset);
    }

    public function glLightfv(light : Int, pname : Int, params : java.nio.FloatBuffer) : Void {
        this.gl10.glLightfv(light, pname, params);
    }

    public function glLineWidth(width : Float) : Void {
        this.gl10.glLineWidth(width);
    }

    public function glLoadIdentity() : Void {
        this.gl10.glLoadIdentity();
    }

    public function glLoadMatrixf(m : haxe.ds.Vector<Float>, offset : Int) : Void {
        this.gl10.glLoadMatrixf(m, offset);
    }

    public function glLoadMatrixf(m : java.nio.FloatBuffer) : Void {
        this.gl10.glLoadMatrixf(m);
    }

    public function glLogicOp(opcode : Int) : Void {
        this.gl10.glLogicOp(opcode);
    }

    public function glMaterialf(face : Int, pname : Int, param : Float) : Void {
        this.gl10.glMaterialf(face, pname, param);
    }

    public function glMaterialfv(face : Int, pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void {
        this.gl10.glMaterialfv(face, pname, params, offset);
    }

    public function glMaterialfv(face : Int, pname : Int, params : java.nio.FloatBuffer) : Void {
        this.gl10.glMaterialfv(face, pname, params);
    }

    public function glMatrixMode(mode : Int) : Void {
        this.gl10.glMatrixMode(mode);
    }

    public function glMultMatrixf(m : haxe.ds.Vector<Float>, offset : Int) : Void {
        this.gl10.glMultMatrixf(m, offset);
    }

    public function glMultMatrixf(m : java.nio.FloatBuffer) : Void {
        this.gl10.glMultMatrixf(m);
    }

    public function glMultiTexCoord4f(target : Int, s : Float, t : Float, r : Float, q : Float) : Void {
        this.gl10.glMultiTexCoord4f(target, s, t, r, q);
    }

    public function glNormal3f(nx : Float, ny : Float, nz : Float) : Void {
        this.gl10.glNormal3f(nx, ny, nz);
    }

    public function glNormalPointer(type : Int, stride : Int, pointer : java.nio.Buffer) : Void {
        this.gl10.glNormalPointer(type, stride, pointer);
    }

    public function glOrthof(left : Float, right : Float, bottom : Float, top : Float, zNear : Float, zFar : Float) : Void {
        this.gl10.glOrthof(left, right, bottom, top, zNear, zFar);
    }

    public function glPixelStorei(pname : Int, param : Int) : Void {
        this.gl10.glPixelStorei(pname, param);
    }

    public function glPointSize(size : Float) : Void {
        this.gl10.glPointSize(size);
    }

    public function glPolygonOffset(factor : Float, units : Float) : Void {
        this.gl10.glPolygonOffset(factor, units);
    }

    public function glPopMatrix() : Void {
        this.gl10.glPopMatrix();
    }

    public function glPushMatrix() : Void {
        this.gl10.glPushMatrix();
    }

    public function glReadPixels(x : Int, y : Int, width : Int, height : Int, format : Int, type : Int, pixels : java.nio.Buffer) : Void {
        this.gl10.glReadPixels(x, y, width, height, format, type, pixels);
    }

    public function glRotatef(angle : Float, x : Float, y : Float, z : Float) : Void {
        this.gl10.glRotatef(angle, x, y, z);
    }

    public function glRotatex(angle : Int, x : Int, y : Int, z : Int) : Void {
        this.gl10.glRotatef(angle, x, y, z);
    }

    public function glSampleCoverage(value : Float, invert : Bool) : Void {
        this.gl10.glSampleCoverage(value, invert);
    }

    public function glScalef(x : Float, y : Float, z : Float) : Void {
        this.gl10.glScalef(x, y, z);
    }

    public function glScalex(x : Int, y : Int, z : Int) : Void {
        this.gl10.glScalef(x, y, z);
    }

    public function glScissor(x : Int, y : Int, width : Int, height : Int) : Void {
        this.gl10.glScissor(x, y, width, height);
    }

    public function glShadeModel(mode : Int) : Void {
        this.gl10.glShadeModel(mode);
    }

    public function glStencilFunc(func : Int, ref : Int, mask : Int) : Void {
        this.gl10.glStencilFunc(func, ref, mask);
    }

    public function glStencilMask(mask : Int) : Void {
        this.gl10.glStencilMask(mask);
    }

    public function glStencilOp(fail : Int, zfail : Int, zpass : Int) : Void {
        this.gl10.glStencilOp(fail, zfail, zpass);
    }

    public function glTexCoordPointer(size : Int, type : Int, stride : Int, pointer : java.nio.Buffer) : Void {
        this.gl10.glTexCoordPointer(size, type, stride, pointer);
    }

    public function glTexEnvf(target : Int, pname : Int, param : Float) : Void {
        this.gl10.glTexEnvf(target, pname, param);
    }

    public function glTexEnvfv(target : Int, pname : Int, params : haxe.ds.Vector<Float>, offset : Int) : Void {
        this.gl10.glTexEnvfv(target, pname, params, offset);
    }

    public function glTexEnvfv(target : Int, pname : Int, params : java.nio.FloatBuffer) : Void {
        this.gl10.glTexEnvfv(target, pname, params);
    }

    public function glTexImage2D(target : Int, level : Int, internalformat : Int, width : Int, height : Int, border : Int, format : Int, type : Int, pixels : java.nio.Buffer) : Void {
        this.gl10.glTexImage2D(target, level, internalformat, width, height, border, format, type, pixels);
    }

    public function glTexParameterf(target : Int, pname : Int, param : Float) : Void {
        this.gl10.glTexParameterf(target, pname, param);
    }

    public function glTexParameteri(target : Int, pname : Int, param : Int) : Void {
        this.gl10.glTexParameteri(target, pname, param);
    }

    public function glTexSubImage2D(target : Int, level : Int, xoffset : Int, yoffset : Int, width : Int, height : Int, format : Int, type : Int, pixels : java.nio.Buffer) : Void {
        this.gl10.glTexSubImage2D(target, level, xoffset, yoffset, width, height, format, type, pixels);
    }

    public function glTranslatef(x : Float, y : Float, z : Float) : Void {
        this.gl10.glTranslatef(x, y, z);
    }

    public function glVertexPointer(size : Int, type : Int, stride : Int, pointer : java.nio.Buffer) : Void {
        this.gl10.glVertexPointer(size, type, stride, pointer);
    }

    public function glViewport(x : Int, y : Int, width : Int, height : Int) : Void {
        this.gl10.glViewport(x, y, width, height);
    }

    public function glBegin(i : Int) : Void {
        this.gl10.glBegin(i);
    }

    public function glEnd() : Void {
        this.gl10.glEnd();
    }

    public function glVertex3f(f : Float, f2 : Float, f3 : Float) : Void {
        this.gl10.glVertex3f(f, f2, f3);
    }

    public function glPolygonMode(i : Int, i1 : Int) : Void {
        this.gl10.glPolygonMode(i, i1);
    }

}

