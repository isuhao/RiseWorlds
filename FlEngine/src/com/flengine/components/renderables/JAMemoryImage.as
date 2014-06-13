﻿package com.flengine.components.renderables
{
    import com.flengine.textures.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;

    public class JAMemoryImage extends Object
    {
        public var width:int;
        public var height:int;
        public var numRows:int;
        public var numCols:int;
        public var bd:BitmapData;
        public var loadFlag:int;
        public var name:String;
        public var texture:FTexture;
        public var imageExist:Boolean;
        private var onImgLoadCompleted:Function;
        public static const Image_Uninitialized:int = 0;
        public static const Image_Loading:int = 1;
        public static const Image_Loaded:int = 2;

        public function JAMemoryImage(param1:Function)
        {
            width = 0;
            height = 0;
            numRows = 1;
            numCols = 1;
            imageExist = true;
            loadFlag = 0;
            onImgLoadCompleted = param1;
            return;
        }// end function

        public function GetCelRect(param1:int, param2:Rectangle) : void
        {
            param2.height = GetCelHeight();
            param2.width = GetCelWidth();
            param2.x = param1 % numCols * param2.width;
            param2.y = param1 / numCols * param2.height;
            return;
        }// end function

        public function GetCelHeight() : Number
        {
            return height / numRows;
        }// end function

        public function GetCelWidth() : Number
        {
            return width / numCols;
        }// end function

        public function OnLoadedCompleted(event:Event) : void
        {
            event.target.removeEventListener("complete", OnLoadedCompleted);
            bd = this.BitmapData(event.target.content.bitmapData);
            width = bd.width;
            height = bd.height;
            loadFlag = 2;
            if (onImgLoadCompleted != null)
            {
                this.onImgLoadCompleted(this);
                onImgLoadCompleted = null;
            }
            return;
        }// end function

        public function onBeChanged() : void
        {
            if (bd)
            {
                width = bd.width;
                height = bd.height;
                loadFlag = 2;
            }
            return;
        }// end function

        public function Dispose() : void
        {
            if (texture)
            {
                texture.dispose();
            }
            texture = null;
            if (bd)
            {
                bd.dispose();
            }
            return;
        }// end function

    }
}
