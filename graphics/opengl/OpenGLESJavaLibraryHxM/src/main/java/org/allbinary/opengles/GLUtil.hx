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

//import java.nio.Buffer;
//import java.nio.ByteBuffer;
//import java.nio.ByteOrder;
//import java.nio.FloatBuffer;

class GLUtil {
    private static final instance : GLUtil = new GLUtil();
    public static function getInstance() : GLUtil {
        return GLUtil.instance;
    }

    private final BYTES_PER_FLOAT : Int = 4;
    public function makeFloatBuffer3(p_a : Float, p_b : Float, p_c : Float) : FloatBuffer {
        final b : ByteBuffer = ByteBuffer.allocateDirect(3 * this.BYTES_PER_FLOAT);
        b.order(ByteOrder.nativeOrder());
        final buffer : FloatBuffer = b.asFloatBuffer();
        buffer.put(p_a);
        buffer.put(p_b);
        buffer.put(p_c);
        this.position(buffer, 0);
        return buffer;
    }

    public function makeFloatBuffer4(p_a : Float, p_b : Float, p_c : Float, p_d : Float) : FloatBuffer {
        final b : ByteBuffer = ByteBuffer.allocateDirect(4 * this.BYTES_PER_FLOAT);
        b.order(ByteOrder.nativeOrder());
        final buffer : FloatBuffer = b.asFloatBuffer();
        buffer.put(p_a);
        buffer.put(p_b);
        buffer.put(p_c);
        buffer.put(p_d);
        this.position(buffer, 0);
        return buffer;
    }

    public function makeFloatBuffer(byteBuffer : ByteBuffer) : FloatBuffer {
        final b : ByteBuffer = ByteBuffer.allocateDirect(byteBuffer.limit() * this.BYTES_PER_FLOAT);
        b.order(ByteOrder.nativeOrder());
        final buffer : FloatBuffer = b.asFloatBuffer();
        var unsigned : Int = 0;
        var v : Float = 0.0;
        while (byteBuffer.hasRemaining()) {
            unsigned = byteBuffer.get() & 0xFF;
            v = (unsigned) / 255.0;
            buffer.put(v);
        }
        this.position(buffer, 0);
        return buffer;
    }

    public function position(buffer : Buffer, newPosition : Int) : Buffer {
        return buffer.position(newPosition);
    }

    public function rotateUVs(uvs : haxe.ds.Vector<Float>, angleDegrees : Float, pivotU : Float, pivotV : Float) : Void {
        final angleRad : Float = ((angleDegrees) * Math.PI / 180);
        final cosA : Float = Math.cos(angleRad);
        final sinA : Float = Math.sin(angleRad);
        {
            var i : Int = 0;
            while (i < uvs.length) {
            var u : Float = uvs[i];
            var v : Float = uvs[i + 1];
            var du : Float = u - pivotU;
            var dv : Float = v - pivotV;
            var ru : Float = (du * cosA - dv * sinA) + pivotU;
            var rv : Float = (du * sinA + dv * cosA) + pivotV;
            uvs[i] = ru;
            uvs[i + 1] = rv;
                i += 2;
            }
        }
    }

    public function new() {
    }
}

