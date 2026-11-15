// Generated Code Do Not Modify
package javax.microedition.khronos.opengles;

//import java.nio.Buffer;
//import java.nio.FloatBuffer;
//import java.nio.IntBuffer;
//import java.nio.ShortBuffer;

interface GL11Ext extends GL {
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

    function glDrawTexfvOES(coords : haxe.ds.Vector<Float>, offset : Int) : Void;

    function glDrawTexfvOES(coords : FloatBuffer) : Void;

    function glDrawTexiOES(x : Int, y : Int, z : Int, width : Int, height : Int) : Void;

    function glDrawTexivOES(coords : haxe.ds.Vector<Int>, offset : Int) : Void;

    function glDrawTexivOES(coords : IntBuffer) : Void;

    function glDrawTexsOES(x : Int, y : Int, z : Int, width : Int, height : Int) : Void;

    function glDrawTexsvOES(coords : haxe.ds.Vector<Int>, offset : Int) : Void;

    function glDrawTexsvOES(coords : ShortBuffer) : Void;

    function glDrawTexxOES(x : Int, y : Int, z : Int, width : Int, height : Int) : Void;

    function glDrawTexxvOES(coords : haxe.ds.Vector<Int>, offset : Int) : Void;

    function glDrawTexxvOES(coords : IntBuffer) : Void;

    function glEnable(cap : Int) : Void;

    function glEnableClientState(array : Int) : Void;

    function glLoadPaletteFromModelViewMatrixOES() : Void;

    function glMatrixIndexPointerOES(size : Int, type : Int, stride : Int, pointer : Buffer) : Void;

    function glMatrixIndexPointerOES(size : Int, type : Int, stride : Int, offset : Int) : Void;

    function glWeightPointerOES(size : Int, type : Int, stride : Int, pointer : Buffer) : Void;

    function glWeightPointerOES(size : Int, type : Int, stride : Int, offset : Int) : Void;

}

