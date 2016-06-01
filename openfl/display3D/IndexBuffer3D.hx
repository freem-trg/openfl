package openfl.display3D;


import lime.graphics.opengl.GL;
import lime.graphics.opengl.GLBuffer;
import lime.utils.Int16Array;
import openfl.utils.ByteArray;
import openfl.Vector;


@:final class IndexBuffer3D {
	
	
	private var __context:Context3D;
	private var __glBuffer:GLBuffer;
	private var __numIndices:Int;
	private var __bufferUsage:Int;
	
	
	private function new (context:Context3D, glBuffer:GLBuffer, numIndices:Int, bufferUsage:Int) {
		
		__context = context;
		__glBuffer = glBuffer;
		__numIndices = numIndices;
		__bufferUsage = bufferUsage;
		
	}
	
	
	public function dispose ():Void {
		
		__context.__deleteIndexBuffer (this);
		
	}
	
	
	public function uploadFromByteArray (data:ByteArray, byteArrayOffset:Int, startOffset:Int, count:Int):Void {
		
		var bytesPerIndex = 2;
		var length:Int = count * bytesPerIndex;
		var offset:Int = byteArrayOffset + startOffset * bytesPerIndex;
		
		var indices = new Int16Array (data, offset, length);
		GL.bindBuffer (GL.ELEMENT_ARRAY_BUFFER, __glBuffer);
		GL.bufferData (GL.ELEMENT_ARRAY_BUFFER, indices, __bufferUsage);
		
	}
	
	
	public function uploadFromInt16Array (data:Int16Array):Void {
		
		GL.bindBuffer (GL.ELEMENT_ARRAY_BUFFER, __glBuffer);
		GL.bufferData (GL.ELEMENT_ARRAY_BUFFER, data, __bufferUsage);
		
	}
	
	
	public function uploadFromVector (data:Vector<UInt>, startOffset:Int, count:Int):Void {
		
		var indices = new Int16Array (data, startOffset, count);
		GL.bindBuffer (GL.ELEMENT_ARRAY_BUFFER, __glBuffer);
		GL.bufferData (GL.ELEMENT_ARRAY_BUFFER, indices, __bufferUsage);
		
	}
	
	
}