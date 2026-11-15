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
package org.allbinary.logic.java.jar;

//import java.io.IOException;
//import java.net.URL;
//import java.net.URLConnection;
//import java.util.jar.JarEntry;
//import java.util.jar.JarInputStream;

class JarUtil {
    private var jarURL : URL;
    public function new(jarURL : URL) {
        this.jarURL = jarURL;
    }

    public function show() : Void {
        var cache : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...1024) 0]);
        try {
            var conn : URLConnection = this.jarURL.openConnection();
            var jis : JarInputStream = new JarInputStream(conn.getInputStream());
            while (true) {
                var entry : JarEntry = jis.getNextJarEntry();
                if (entry != null) {
                    if (!entry.isDirectory()) {
                        var offset : Int = 0;
                        var i : Int = 0;
                        while (((i = jis.read(cache, offset, cache.length - offset))) != -1) {
                            offset += i;
                            if (offset >= cache.length) {
                                var newcache : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...cache.length + 1024) 0]);
                                haxe.ds.Vector.blit(cache, 0, newcache, 0, cache.length);
                                cache = newcache;
                            }
                        }
                        var tmp : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...offset) 0]);
                        haxe.ds.Vector.blit(cache, 0, tmp, 0, offset);
                        trace(entry.getName());
                    }
                } else {
                    break;
                }
            }
        } catch (ex : IOException) {
            trace(ex);
            trace(ex.details());
        }
    }

    // throws Exception
    public static function main(args : haxe.ds.Vector<String>) : Void {
        new JarUtil(new URL("file:///G:/mnt/bc/mydev/working/j2me/MiniSpaceWars/MiniSpaceWars/dist/MiniSpaceWars.jar")).show();
    }

}

