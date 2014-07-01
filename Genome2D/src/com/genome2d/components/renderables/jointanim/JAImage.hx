package com.genome2d.components.renderables.jointanim;
import flash.Vector;

/**
 * ...
 * @author Rise
 */
class JAImage
{
	public var drawMode:Int;
	public var cols:Int;
	public var rows:Int;
	public var origWidth:Int;
	public var origHeight:Int;
	public var _transform:JATransform;
	public var imageName:String;
	public var images:Vector<JAMemoryImage>;

	public function new() 
	{
		imageName = "";
		_transform = new JATransform();
		images = new Vector<JAMemoryImage>();
	}
	
	//public function get transform():JATransform
	//{
	//	return (_transform);
	//}
	public var transform(get, never):JATransform;
    inline private function get_transform():JATransform {
        return _transform;
    }

	public function OnMemoryImageLoadCompleted(image:JAMemoryImage):Void
	{
		if ((((this.images.length == 1)) && ((this.images[0] == image))))
		{
			if (((!((this.origWidth == -1))) && (!((this.origHeight == -1)))))
			{
				this._transform.matrix.m02 = (this._transform.matrix.m02 + (-((image.width - (this.origWidth * 1))) / (image.numCols + 1)));
				this._transform.matrix.m12 = (this._transform.matrix.m12 + (-((image.height - (this.origHeight * 1))) / (image.numRows + 1)));
			};
		};
	}
}