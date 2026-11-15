// Generated Code Do Not Modify
package javax.microedition.khronos.opengles;


interface GL11Ext extends javax.microedition.khronos.opengles.GL {
    public static final GL_MATRIX_INDEX_ARRAY_BUFFER_BINDING_OES : Int = 35742;
    public static final GL_MATRIX_INDEX_ARRAY_OES : Int = 34884;
    public static final GL_MATRIX_INDEX_ARRAY_POINTER_OES : Int = 34889;
    public static final GL_MATRIX_INDEX_ARRAY_SIZE_OES : Int = 34886;
    public static final GL_MATRIX_INDEX_ARRAY_STRIDE_OES : Int = 34888;
    public static final GL_MATRIX_INDEX_ARRAY_TYPE_OES : Int = 34887;
    public static final GL_MATRIX_PALETTE_OES : Int = 34880;
    public static final GL_MAX_PALETTE_MATRICES_OES : Int = 34882;
    public static final GL_MAX_VERTEX_UNITS_OES : Int = 34468;
    public static final GL_TEXTURE_CROP_RECT_OES : Int = 35741;
    public static final GL_WEIGHT_ARRAY_BUFFER_BINDING_OES : Int = 34974;
    public static final GL_WEIGHT_ARRAY_OES : Int = 34477;
    public static final GL_WEIGHT_ARRAY_POINTER_OES : Int = 34476;
    public static final GL_WEIGHT_ARRAY_SIZE_OES : Int = 34475;
    public static final GL_WEIGHT_ARRAY_STRIDE_OES : Int = 34474;
    public static final GL_WEIGHT_ARRAY_TYPE_OES : Int = 34473;
    function glTexParameterfv(target : Int, pname : Int, param : haxe.ds.Vector<Float>, offset : Int) : Void;

    function glCurrentPaletteMatrixOES(matrixpaletteindex : Int) : Void;

    function glDrawTexfOES(x : Float, y : Float, z : Float, width : Float, height : Float) : Void;

    function glDrawTexfvOES(...args : Dynamic) : Dynamic;

    function glDrawTexfvOES_floatArray_int(coords : haxe.ds.Vector<Float>, offset : Int) : Void;

    function glDrawTexfvOES_FloatBuffer(coords : jre.nio.FloatBuffer) : Void;

    function glDrawTexiOES(x : Int, y : Int, z : Int, width : Int, height : Int) : Void;

    function glDrawTexivOES(...args : Dynamic) : Dynamic;

    function glDrawTexivOES_intArray_int(coords : haxe.ds.Vector<Int>, offset : Int) : Void;

    function glDrawTexivOES_IntBuffer(coords : jre.nio.IntBuffer) : Void;

    function glDrawTexsOES(x : Int, y : Int, z : Int, width : Int, height : Int) : Void;

    function glDrawTexsvOES(...args : Dynamic) : Dynamic;

    function glDrawTexsvOES_shortArray_int(coords : haxe.ds.Vector<Int>, offset : Int) : Void;

    function glDrawTexsvOES_ShortBuffer(coords : jre.nio.ShortBuffer) : Void;

    function glDrawTexxOES(x : Int, y : Int, z : Int, width : Int, height : Int) : Void;

    function glDrawTexxvOES(...args : Dynamic) : Dynamic;

    function glDrawTexxvOES_intArray_int(coords : haxe.ds.Vector<Int>, offset : Int) : Void;

    function glDrawTexxvOES_IntBuffer(coords : jre.nio.IntBuffer) : Void;

    function glEnable(cap : Int) : Void;

    function glEnableClientState(array : Int) : Void;

    function glLoadPaletteFromModelViewMatrixOES() : Void;

    function glMatrixIndexPointerOES(...args : Dynamic) : Dynamic;

    function glMatrixIndexPointerOES_int_int_int_Buffer(size : Int, type : Int, stride : Int, pointer : jre.nio.Buffer) : Void;

    function glMatrixIndexPointerOES_int_int_int_int(size : Int, type : Int, stride : Int, offset : Int) : Void;

    function glWeightPointerOES(...args : Dynamic) : Dynamic;

    function glWeightPointerOES_int_int_int_Buffer(size : Int, type : Int, stride : Int, pointer : jre.nio.Buffer) : Void;

    function glWeightPointerOES_int_int_int_int(size : Int, type : Int, stride : Int, offset : Int) : Void;

}

